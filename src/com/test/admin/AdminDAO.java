package com.test.admin;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.common.DBUtil;
import com.test.member.FilterDTO;
import com.test.member.MarketDTO;

import oracle.jdbc.OracleTypes;

public class AdminDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	private CallableStatement cstat;
	

	public AdminDAO() {

		DBUtil util = new DBUtil();
//		conn = util.open("211.63.89.55", "chanbang", "java1234");
		conn = util.open();
	}

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int adminLogin(AdminDTO adto) {
		
		try {
			String sql ="select count(*) as cnt from tbl_admin where id=? and pw= ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, adto.getId());
			pstat.setString(2, adto.getPw());
			rs = pstat.executeQuery();
			if(rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
					
			
		} catch (Exception e) {
			System.out.println("AdminDAO.adminLogin()");
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김영현
	 * admin2
	 * @return 리스트 반환
	 */
	public ArrayList<RecommendThemeDTO> getRecommendList() {
		
		try {
			String sql = "select * from vwseerecommendtheme";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<RecommendThemeDTO> list = new ArrayList<RecommendThemeDTO>();
			
			while(rs.next()) {
				RecommendThemeDTO dto = new RecommendThemeDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setFilename(rs.getString("filename"));
				dto.setOptname(rs.getString("optname"));
				dto.setOptseq(rs.getString("opseq"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	
	/**
	 * 윤희선
	 * @param map
	 * @return 게시물의 seq , 제목 , 상태 , rownum , 등록일 정보 가져옴.
	 */
	//reghouseboard 서블릿  > 게시물에 사용될 매물번호 가져오기 ( 등록된 매물 리스트 ) 
	public ArrayList<RegHouseDTO> post_list(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if(map.get("sel1") != null && !(map.get("sel1").equals("4"))) {
				//셀렉트 박스가 선택 되었을 때 > 0,1,2,3 중 하나 
				where += String.format("and state = %s ", map.get("sel1"));

			} 
			
			
			if(map.get("search_word") == null) {
				//null 처리
				map.put("search_word","");
			}
			

			
			//검색 
			// > 검색한 단어 like 절 걸기 
			if(map.get("sel2").equals("0")) {
				//제목 검색 
				//System.out.println("제목 검색하기");
				where += String.format("and subject like '%%' || '%s' || '%%'" , map.get("search_word"));					

				
			} 
			else if (map.get("sel2").equals("1")) {
				//내용 검색 
				//System.out.println("내용 검색하기");
		
				where += String.format("and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"));					

			} 
				else if (map.get("sel2").equals("2")) {
				//제목+내용 검색 
				//System.out.println("제목+내용 검색하기");

				where += String.format("and subject like '%%' || '%s' || '%%' and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"), map.get("search_word"));					
				
			}
			
			
			
			
			
				
				//등록된 매물 게시물
				//state = 0 대기 , 1 신고 , 2 정상매물 , 3 허위매물
	
				String sql = String.format("select seq , subject , state , rnum , to_char(regdate , 'yyyy-mm-dd') as regdate , detailcontent from (select rownum as rnum , a.* from (select * from tbl_house_post where delflag = 0  %s order by regdate ) a) where rnum >= %s and rnum <= %s order by rnum desc"
												, where ,map.get("end") , map.get("begin") );
				
				System.out.println(sql);
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				
				//결과 레코드 담을 어레이리스트 
				ArrayList<RegHouseDTO> result = new ArrayList<RegHouseDTO>();
				
				
				while (rs.next()) {
					//레코드 1줄 > AdminDTO 1개 
					RegHouseDTO dto = new RegHouseDTO();
					
					dto.setHouse_seq(rs.getString("seq"));				//매물번호 
					dto.setPost_subject(rs.getString("subject"));		//제목
					dto.setPost_state(rs.getString("state"));			//상태
					dto.setHouse_rnum(rs.getString("rnum"));			//rnum
					dto.setHouse_regdate(rs.getString("regdate"));		//regdate
					
					
					
					//정보 저장된 dto > ArrayList에 담아서 서블릿에 넘김
					result.add(dto);
	
				}

				return result;
//			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}//post_list

	
	/**
	 * 
	 * @return 게시물의 총 갯수
	 */
	//RegHouseBoard 에서 호출 : 총 페이지 수 카운트 
	public ArrayList<String> getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if(map.get("sel1") != null && !(map.get("sel1").equals("4"))) {
				
				
				//셀렉트 박스가 선택 되었을 때 > 0,1,2,3 중 하나 
				where = String.format("and state = %s", map.get("sel1"));
				
			} 
			
			if(map.get("search_word") == null) {
				//null 처리
				map.put("search_word","");
			}
			

			
			//검색 
			// > 검색한 단어 like 절 걸기 
			if(map.get("sel2").equals("0")) {
				//제목 검색 
				//System.out.println("제목 검색하기");
				where += String.format("and subject like '%%' || '%s' || '%%'" , map.get("search_word"));					

				
			} 
			else if (map.get("sel2").equals("1")) {
				//내용 검색 
				//System.out.println("내용 검색하기");
		
				where += String.format("and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"));					

			} 
				else if (map.get("sel2").equals("2")) {
				//제목+내용 검색 
				//System.out.println("제목+내용 검색하기");

				where += String.format("and subject like '%%' || '%s' || '%%' and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"), map.get("search_word"));					
				
			}
			
			

				
				//총 게시물 수 
				String sql = String.format("select count(*) as cnt from tbl_house_post where delflag = 0 %s", where);
				
//				System.out.println(sql);
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				//결과 레코드 담을 어레이리스트 
				ArrayList<String> result = new ArrayList<String>();
				
				if ( rs.next()) {
					result.add(rs.getString("cnt"));
				}
				
				
				
				return result;
//				}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	
	/**
	 * 
	 * @param map 가져올 게시물 시작 , 끝 번호 매개변수로 전달 
	 * @return 게시물 리스트 반환 
	 */
	//RegWaitBoard 서블릿이 부름 , 승인 대기 리스트 받으러
	public ArrayList<RegWaitDTO> wait_post(HashMap<String, String> map) {
		
		try {
			
			String where = "";

			
//			System.out.println("셀렉트:"+map.get("sel"));

			
			if(map.get("search_word") == null) {
				//null 처리
				map.put("search_word","");
			}
			

			
			//검색 
			// > 검색한 단어 like 절 걸기 
			if(map.get("sel").equals("0")) {
				//제목 검색 
//				System.out.println("제목 검색하기");
				where += String.format("and subject like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("제목 where:"+where );
				
			} 
			else if (map.get("sel").equals("1")) {
				//내용 검색 
//				System.out.println("내용 검색하기");
		
				where += String.format("and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("내용where:"+where );
			} 
				else if (map.get("sel").equals("2")) {
				//제목+내용 검색 
//				System.out.println("제목+내용 검색하기");

				where += String.format("and subject like '%%' || '%s' || '%%' and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"), map.get("search_word"));					
//				System.out.println("제목내용 where:"+where );
			}
				else if (map.get("sel").equals("3")) {
					//작성자 검색 
//					System.out.println("작성자 검색하기");

					where += String.format("and name like '%%%s%%'" , map.get("search_word"));					
//					System.out.println("작성자 where:"+where );
			}
			
			
			

			String sql = String.format("select * from (select rownum as rnum , a.* from (select hp.seq as hpseq,  m.seq as mseq ,hp.subject as subject , m.name as name , to_char(hp.regdate , 'yyyy-mm-dd') as regdate from tbl_house_post hp inner join tbl_member m on hp.memseq = m.seq where state = 0 and hp.delflag = 0 %s order by hp.regdate) a ) where rnum >= %s and rnum <= %s order by rnum desc" 
								,where ,map.get("end") , map.get("begin"));

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);
			
			//쿼리 결과 저장할 list
			ArrayList<RegWaitDTO> result = new ArrayList<RegWaitDTO>();
			
			while(rs.next()) {
				RegWaitDTO dto = new RegWaitDTO();
				
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setRnum(rs.getString("rnum"));
				dto.setHpseq(rs.getString("hpseq"));
				dto.setMseq(rs.getString("mseq"));
				

				
				result.add(dto);
			}
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	/**
	 * 
	 * @param map 조건에 따른 게시물 카운트 
	 * @return 게시물 수 반환
	 */
	//승인 대기 게시물 총 카운트 
	public ArrayList<String> getWaitTotalCount(HashMap<String, String> map) {

		try {
			
			String where = "";
			
			if(map.get("search_word") == null) {
				//null 처리
				map.put("search_word","");
			}
			

			
			//검색 
			// > 검색한 단어 like 절 걸기 
			if(map.get("sel").equals("0")) {
				//제목 검색 
//				System.out.println("제목 검색하기");
				where += String.format("and subject like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("제목 where:"+where );
				
			} 
			else if (map.get("sel").equals("1")) {
				//내용 검색 
//				System.out.println("내용 검색하기");
		
				where += String.format("and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("내용where:"+where );
			} 
				else if (map.get("sel").equals("2")) {
				//제목+내용 검색 
//				System.out.println("제목+내용 검색하기");

				where += String.format("and subject like '%%' || '%s' || '%%' and detailcontent like '%%' || '%s' || '%%'" , map.get("search_word"), map.get("search_word"));					
//				System.out.println("제목내용 where:"+where );
			}
				else if (map.get("sel").equals("3")) {
					//작성자 검색 
//					System.out.println("작성자 검색하기");

					where += String.format("and name like '%%%s%%'" , map.get("search_word"));					
//					System.out.println("작성자 where:"+where );
			}
			
			
			String sql = String.format("select count(*) as cnt from tbl_house_post hp inner join tbl_member m on hp.memseq = m.seq where state = 0 and hp.delflag = 0 %s",where);
			
			
//			System.out.println(sql);
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			//결과 레코드 담을 어레이리스트 
			ArrayList<String> result = new ArrayList<String>();
			
			if ( rs.next()) {
				result.add(rs.getString("cnt"));
//				System.out.println(rs.getString("cnt"));
			}
			
			return result;
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	/**
	 * 
	 * @param list 게시물 seq , 회원 seq가 담겨있는 hashmap 매개변수로 받음.
	 * @return 매물등록 허가 페이지에 필요한 정보 
	 */
	//regview 서블릿이 부름 , 매물등록 허가 페이지 정보 리턴
	public ArrayList<RegViewDTO> regView(HashMap<String, String> map) {
		
		
		try {
			
			String sql = String.format("select * from vwRegView where mseq = %s and hpseq = %s",map.get("mseq"), map.get("hpseq"));
			
			stat = conn.createStatement();

			rs = stat.executeQuery(sql);
			
//			System.out.println(sql);
			
			//반환값 돌려줄 arraylist 
			ArrayList<RegViewDTO> result = new ArrayList<RegViewDTO>();
			
			DecimalFormat formatter = new DecimalFormat("###,###");
			
			
			if(rs.next()) {
				RegViewDTO dto = new RegViewDTO();
				dto.setId(rs.getString("id"));
				dto.setAddress(rs.getString("address"));
				dto.setDepcost(formatter.format(rs.getInt("depcost")));		//월세			
				
				dto.setCost(formatter.format(rs.getLong("cost")));			//보증금
				
				dto.setMaincost(formatter.format(rs.getInt("maincost")));						//관리비
				dto.setArea(rs.getInt("area"));
				dto.setDetailcontent(rs.getString("detailcontent"));
				dto.setFilename(rs.getString("filename"));
				dto.setHttype(rs.getString("httype"));						//방유형
				dto.setSttype(rs.getString("sttype"));						//거래유형
				dto.setOptseq(rs.getString("optseq"));	 					//옵션번호 (2번 = 대출)
				
				dto.setHpseq(rs.getString("hpseq"));

				
				result.add(dto);
			}
			
			return result;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	/**
	 * 
	 * @param 회원 seq 매개변수로 가져옴
	 * @return 공인인증서 , 블랙리스트 등록여부 반환
	 */
	//regview 서블릿이 부름 , 공인인증서 등록 여부 , 블랙리스트 등록 여부 
	public ArrayList<RegListDTO> regList(HashMap<String, String> map) {


		try {
			
			String sql = String.format("select * from tbl_member m left outer join tbl_agency_info ai on ai.memseq = m.seq where m.delflag = 0 and m.seq = %s order by m.seq"
											,map.get("mseq"));
			
			stat = conn.createStatement();

			rs = stat.executeQuery(sql);
			
			//결과 레코드 담긴(dto) 담을  어레이리스트
			ArrayList<RegListDTO> list = new ArrayList<RegListDTO>();

			
			while(rs.next()) {
				
				RegListDTO dto = new RegListDTO();
				
				if(rs.getString("confirm") == null) {
					//중개사 승인값 null이면 0으로 치환
					dto.setConfirm("0");
				} else {
					dto.setConfirm(rs.getString("confirm"));	//중개사 승인여부 (1=승인 or null)					
				}
				
				
				
					dto.setNoticnt(rs.getString("noticnt"));	//신고 횟수
				
				
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	/**
	 * 
	 * @param 게시물 seq , rownum 시작번호 > 매개변수로 넘겨줌
	 * @return 해당 매물에 해당하는 이미지(파일명) 반환
	 */
	//regview 서블릿이 부름 
	//매물 이미지(파일명) 가져오기
	public ArrayList<RegImageDTO> regImage(HashMap<String, String> map) {
		
		
		try {
			
			String sql = String.format("select * from(select a.* , rownum as rnum from (select hp.seq as hpseq , pi.seq as piseq , it.seq as itseq,  pi.filename from tbl_house_post hp inner join tbl_post_image pi on hp.seq = pi.postseq inner join tbl_image_type it on it.seq = pi.imgseq where hp.seq = %s and hp.delflag = 0) a )where rnum = %s"
										,map.get("hpseq") ,map.get("begin") );
			
//			System.out.println(sql);
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			//결과 dto 담을 어레이리스트
			ArrayList<RegImageDTO> list = new ArrayList<RegImageDTO>();
			
			while(rs.next()) {
				
				RegImageDTO dto = new RegImageDTO();
				
				dto.setHpseq(rs.getString("hpseq"));
				dto.setPiseq(rs.getString("piseq"));
				dto.setItseq(rs.getString("itseq"));
				dto.setFilename(rs.getString("filename"));
				
				
				
				
				list.add(dto);
//				System.out.println("파일명:" + list.get(0).getFilename());
				
			}
			
//			stat.close();
//			rs.close();
//			conn.close();
			
			return list;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	


	
	/**
	    * 
	    * @param dto --> 필터담긴 그릇
	    * @return 각 달 값과 그 값 평균 값
	    * seemarketprice 서블릿에서 위임(영현)
	    */
	   public ArrayList<MarketDTO> getcount (FilterDTO dto) {
	      
	      String firstfilter = dto.getFirstfilter(); //서울
	      String secondfilter = dto.getSecondfilter(); //송파구
	      String thirdfilter = dto.getThirdilter(); //삼전동
	      String saletype = dto.getSaletype(); //매매
	      
	      ArrayList<MarketDTO> list = new ArrayList<MarketDTO>(); //저장해서 보내줄 list
	      
	      
	      try {
	         String sql = "select regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = " + saletype + "  and address like '%" + firstfilter + "%' group by regdate"
	               + " order by regdate ";
	         
//	         System.out.println("getcount sql");
//	         System.out.println(sql);
	         
	         stat = conn.createStatement();
	         rs = stat.executeQuery(sql);
	         String temp = "";
	         String tempprice = "";
	         
	         while(rs.next()) { 
	            /*
	             * MarketDTO mdto = new MarketDTO();
	             * 
	             * mdto.setFilter(firstfilter); mdto.setAvg(rs.getString("avg"));
	             * mdto.setRegdate(rs.getString("regdate"));
	             * 
	             * list.add(mdto);
	             */
	            
	            temp += rs.getString("regdate") + ",";
	            tempprice += rs.getString("avg") + ",";
	            
	         } //firstfilter
	         
	         MarketDTO mdto = new MarketDTO();
	         
	         if(temp.length() != 0) {
	            temp = temp.substring(0, temp.length() - 1);
	            tempprice = tempprice.substring(0, tempprice.length() - 1);
	            }
	         
	         
	         mdto.setAvg(tempprice);
	         mdto.setRegdate(temp);
	         mdto.setFilter(firstfilter);
	         
	         list.add(mdto);
	         
	         
	         sql = "select regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = " + saletype + "  and address like '%" + secondfilter + "%' group by regdate"
	               + " order by regdate ";
	         
	         stat = conn.createStatement();
	         rs = stat.executeQuery(sql);
	         
	         temp = "";
	         tempprice = "";
	         
	         while(rs.next()) {
	            /*
	             * MarketDTO mdto = new MarketDTO();
	             * 
	             * mdto.setFilter(secondfilter); mdto.setAvg(rs.getString("avg"));
	             * mdto.setRegdate(rs.getString("regdate"));
	             * 
	             * list.add(mdto);
	             */
	            
	            temp += rs.getString("regdate") + ",";
	            tempprice += rs.getString("avg") + ",";
	            
	         } //firstfilter
	         
	         MarketDTO mdto2 = new MarketDTO();
	         
	         if(temp.length() != 0) {
	         temp = temp.substring(0, temp.length() - 1);
	         tempprice = tempprice.substring(0, tempprice.length() - 1);
	         }
	         mdto2.setAvg(tempprice);
	         mdto2.setRegdate(temp);
	         mdto2.setFilter(secondfilter);
	         
	         list.add(mdto2);
	         
	         sql = "select regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = " + saletype + "  and address like '%" + thirdfilter + "%' group by regdate"
	               + " order by regdate ";
	         
	         stat = conn.createStatement();
	         rs = stat.executeQuery(sql);
	         
	         temp = "";
	         tempprice = "";
	         
	         while(rs.next()) {
	            /*
	             * MarketDTO mdto = new MarketDTO();
	             * 
	             * mdto.setFilter(thirdfilter); mdto.setAvg(rs.getString("avg"));
	             * mdto.setRegdate(rs.getString("regdate"));
	             * 
	             * list.add(mdto);
	             */
	            temp += rs.getString("regdate") + ",";
	            tempprice += rs.getString("avg") + ",";
	            
	         } //thirdfilter
	         
	         if(temp.length() != 0) {
	            temp = temp.substring(0, temp.length() - 1);
	            tempprice = tempprice.substring(0, tempprice.length() - 1);
	            }
	         
	         MarketDTO mdto3 = new MarketDTO();
	         mdto3.setAvg(tempprice);
	         mdto3.setRegdate(temp);
	         mdto3.setFilter(thirdfilter);
	         
	         list.add(mdto3);
	         
	         
	         return list;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      
	      
	      
	      
	      
	      
	      
	      return null;
	   }//getcount

	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   //차트
	   /**
	    * 
	    * @param db 에서 불러온 날짜 & 값
	    * @return 정리한 값
	    * 영현
	    */
	   public ArrayList<MarketDTO> ManufactList(ArrayList<MarketDTO> list) {
	      
	      ArrayList<MarketDTO> manulist = new ArrayList<MarketDTO>();
	      
	      
	      for(MarketDTO dto : list) {
	         MarketDTO savedto = new MarketDTO();
	         
	         String[] monthList = dto.getRegdate().split(",");
	         String[] priceList = dto.getAvg().split(",");
	         
	         String temp = "";
	         String pricetemp = "";

	         
	         if(Integer.parseInt(monthList[0]) != 1) {
	            //첫 시작이 1월이 아닌 경우
	            for(int i = 1 ; i < Integer.parseInt(monthList[0]) ; i++) {
	               temp += "0"+ i  + ",";
	               pricetemp += "0,";
	            }//for
	         }
	         
	         temp += monthList[0] + ",";
	         
	         pricetemp += Math.round(Long.parseLong(priceList[0])/10000) + ",";
	         
	         for(int i = 1; i < monthList.length -1 ; i++) {
	            //값 돌면서 순서 맞추기
	            
	            if(Integer.parseInt(monthList[i]) + 1 != Integer.parseInt(monthList[i+1])) {
	               //순서대로 저장되지 않은 경우
	               temp +=  "0" + Integer.parseInt(monthList[i]) + ",";
	               temp += "0" + (Integer.parseInt(monthList[i]) + 1) + ",";
	               
	               
	               pricetemp += Math.round(Long.parseLong(priceList[i])/10000) + ",";
	               pricetemp += Math.round(Long.parseLong(priceList[i])/10000) + ",";
	               
	               
	            } else {
	               //순서대로 저장되는 경우
	               temp += monthList[i] + ",";
	               pricetemp += Math.round(Long.parseLong(priceList[i])/10000) + ",";
	               
	            }
	         }//for
	         
	         temp += monthList[monthList.length -1] + ",";
	         pricetemp += Math.round(Long.parseLong(priceList[priceList.length -1])/10000) + ",";
	         
	         int first = Integer.parseInt(monthList[monthList.length-1]);
	         
	         if(first != 8 && monthList.length != 0 ) {
	            
	            for(int i = first + 1 ; i <= 8; i++) {
	               temp += "0" + i + ",";
	               pricetemp += Math.round(Long.parseLong(priceList[priceList.length -1])/10000) + ",";
	               
	            }
	            
	            
	            //마지막 , 없애기
	            temp = temp.substring(0, temp.length() -1);
	            pricetemp = pricetemp.substring(0, pricetemp.length()-1);
	            
	         }//if
	         
	         savedto.setAvg(pricetemp);
	         savedto.setRegdate(temp);
	         savedto.setFilter(dto.getFilter());
	         
	         manulist.add(savedto);
	      }
	      
	      
	      
	      
	      
	      return manulist;
	   }

	   
	   
	/**
	 * 윤희선
	 * @param 해당 게시물 seq 매개변수로 넘겨줌
	 * @return 관리비 > 점수 계산하여 반환
	 */
	//regview 서블릿이 호출 > 관리비 점수 가져오기 
	public int score_info(String hpseq) {
		
		try {
			
			String sql = String.format("select maincost from tbl_house_post where seq = %s", hpseq);
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<AutoScoreDTO> list = new ArrayList<AutoScoreDTO>();
			
			if(rs.next()) {
//				System.out.println("점수계산 위한 가격::"+rs.getInt("cost"));
//				AutoScoreDTO dto = new AutoScoreDTO();
//				 dto.setCost(rs.getInt("cost"));
				 
				 
				 //관리비 > 0 ~ 19만원 
				 //0~5  = 100점 
				 //6~10 = 90점
				 //11~15 = 80점 
				 //16~20 = 70점 
				 //21 이상 = 60점
				 
				 if(rs.getInt("maincost") >= 0 && rs.getInt("maincost") <= 5) {
//					 dto.setMaincost(100);
					 return 100;
				 } else if (rs.getInt("maincost") >= 6 && rs.getInt("maincost") <= 10) {
//					 dto.setMaincost(90);
					 return 90;
				 } else if (rs.getInt("maincost") >= 11 && rs.getInt("maincost") <= 15) {
//					 dto.setMaincost(80);
					 return 80;
				 } else if (rs.getInt("maincost") >= 16 && rs.getInt("maincost") <= 20) {
//					 dto.setMaincost(70);
					 return 70;
				 } else {
//					 dto.setMaincost(60);
					 return 60;
				 }
				 
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	/**
	 * 윤희선
	 * @param 해당게시물 seq
	 * @param 해당 매물 가격
	 * @return 해당 매물 가격에 따른 점수 계산값 반환 
	 */
	//자동 계산 점수 > 가격 
	//regview 서블릿이 호출 
	public int auto_score(String hpseq, int score_cost) {
		
		try {
			
			String sql = "call procAutoScore(?,?,?)";
			
			
			cstat = conn.prepareCall(sql);
			
			cstat.setInt(1,score_cost);
			cstat.setString(2,hpseq);
			cstat.registerOutParameter(3, OracleTypes.CURSOR);
			
			rs = cstat.executeQuery();
			
			rs = (ResultSet)cstat.getObject(3);
			
			
			
			if(rs.next()) {
				//System.out.println("자동계산 점수:::"+rs.getInt("score"));
				return rs.getInt("score");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	
	/**
	 * 윤희선
	 * @param 특정 게시물 seq 매개변수로 받음
	 * @return 매물 가격 반환
	 */
	//regview 서블릿 호출 > 게시물 가격 가져오기
	public int cost(String hpseq) {
		try {
			
			String sql = String.format("select cost from tbl_house_post where seq = %s",hpseq);
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cost");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	
	/**
	 * 윤희선
	 * @param 특정 게시물 seq 넘겨받음
	 * @return 고도에 따른 점수계산하여 반환
	 */
	//regview 서블릿 호출 > 고도 점수 계산 
	public int auto_alt(String hpseq) {
		
		try {
			
			String sql = String.format("select alt from tbl_house_info where seq = %s",hpseq);
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			//0~3 = 100
			//4~6 = 80
			//7~10 = 70
			
			
			if(rs.next()) {
				if(rs.getInt("alt") >= 0 && rs.getInt("alt") <= 3) {
					//고도 낮음 
					return 100;
				} else if(rs.getInt("alt") >= 4 && rs.getInt("alt") <= 6) {
					//고도 보통
					return 80;
				} else if(rs.getInt("alt") >= 7 && rs.getInt("alt") <= 10) {
					//고도 높음
					return 70;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	
	/**
	 * 윤희선
	 * @param 등록 or 삭제 처리 위한 값 
	 * @return 
	 */
	//regviewok 서블릿 호출 
	//매물 대기 게시물 처리 update
	public String update(HashMap<String, String> map) {
		
		
		try {
			
			String sql = "";
			
			if(map.get("reg_btn") == null) {
				//삭제 버튼 눌렀을 때
				sql = String.format("update tbl_house_post set delflag = 1 where seq = %s", map.get("hpseq_ok"));
			} else {
				//승인 버튼 눌렀을 때 
				sql = String.format("update tbl_house_post set state = 2 where seq = %s",map.get("hpseq_ok"));
			}
			
//			System.out.println(sql);
			
			pstat = conn.prepareStatement(sql);
			
			pstat.executeUpdate();
			
//			System.out.println("update 완료!");
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	
	
/**
 * 윤희선
 * @param map 
 * @return 허위 매물 신고당한 게시물 총 개수
 */
	//허위 매물 게시물 총 개수
	public int getfakecnt(HashMap<String, String> map) {
		
		try {
			
			
			String where = "";
			
			if(map.get("sel1").equals("0")) {
				where = "fh.state in ('대기','처리')";
//				System.out.println("sel1 = 0");
				
			} else if (map.get("sel1").equals("1")) {
				
				where += "fh.state = '대기' ";
//				System.out.println("sel1 = 1");
				
			} else if (map.get("sel1").equals("2")) {
				
				where += "fh.state = '처리' ";
//				System.out.println("sel1 = 2");
			}
			
			//검색 
			// > 검색한 단어 like 절 걸기 
			if(map.get("search_select").equals("0")) {
				//제목 검색 
//				System.out.println("제목 검색하기");
				where += String.format("and hp.subject like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("제목 where:"+where );
				
			} 
			else if (map.get("search_select").equals("1")) {
				//내용 검색 
//				System.out.println("내용 검색하기");
		
				where += String.format("and fh.reportreason like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("내용where:"+where );
			} 
				else if (map.get("search_select").equals("2")) {
				//제목+내용 검색 
//				System.out.println("제목+내용 검색하기");

				where += String.format("and hp.subject like '%%' || '%s' || '%%' and fh.reportreason like '%%' || '%s' || '%%'" , map.get("search_word"), map.get("search_word"));					
//				System.out.println("제목내용 where:"+where );
			}
				
			System.out.println("허위매물 카운트");
//			String sql = String.format("select count(*) as cnt from tbl_false_house_report where %s", where);
//			String sql = String.format("select count(*) as cnt from tbl_house_post hp inner join tbl_false_house_report fh on hp.seq = fh.postseq  where %s", where);
			String sql = String.format("select count(*) as cnt from tbl_house_post hp inner join tbl_false_house_report fh on hp.seq = fh.postseq  where %s and hp.state in (1,3) ", where);
			
			System.out.println(sql);
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
//				System.out.println("getfakecnt::"+rs.getInt("cnt"));
				return rs.getInt("cnt");
			}
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	/**
	 * 윤희선
	 * @param 받아올 게시물 수 rownum 
	 * @return 허위매물 신고당한 게시물 리스트 반환
	 */
	//신고 당한 게시물 리스트
	public ArrayList<FakeNoticeDTO> report_list(HashMap<String, String> map) {
		
		try {
			
			//search_word = "" > 검색 안했을 때 , search_select = "0"  기본값 
			String where = "";
			
			
//			if(map.get("sel1") != null && !(map.get("sel1").equals("3"))) {
				
				
				//셀렉트 박스가 선택 되었을 때 > 0,1,2,3 중 하나  
//				where = String.format("and state = %s ", map.get("sel1"));
				
				if(map.get("sel1").equals("0")) {
					where = "";
//					System.out.println("sel1 = 0");
					
				} else if (map.get("sel1").equals("1")) {
					
					where += "and fh.state = '대기' ";
//					System.out.println("sel1 = 1");
					
				} else if (map.get("sel1").equals("2")) {
					
					where += "and fh.state = '처리' ";
//					System.out.println("sel1 = 2");
				}
				
//			} 
			
			
			//검색 
			// > 검색한 단어 like 절 걸기 
			if(map.get("search_select").equals("0")) {
				//제목 검색 
//				System.out.println("제목 검색하기");
				where += String.format("and subject like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("제목 where:"+where );
				
			} 
			else if (map.get("search_select").equals("1")) {
				//내용 검색 
//				System.out.println("내용 검색하기");
		
				where += String.format("and reportreason like '%%' || '%s' || '%%'" , map.get("search_word"));					
//				System.out.println("내용where:"+where );
			} 
				else if (map.get("search_select").equals("2")) {
				//제목+내용 검색 
//				System.out.println("제목+내용 검색하기");

				where += String.format("and subject like '%%' || '%s' || '%%' and reportreason like '%%' || '%s' || '%%'" , map.get("search_word"), map.get("search_word"));					
//				System.out.println("제목내용 where:"+where );
			}
				
			
			
			System.out.println("허위매물 sql");
//			String sql = String.format("select * from (select a.* , rownum as rnum from(select fh.reportreason , hb.seq as hbseq , m.id , hp.seq as hpseq , hp.subject , to_char(fh.regdate , 'yyyy-mm-dd') as regdate , fh.state from tbl_false_house_report fh left outer join tbl_house_post hp on hp.seq = fh.postseq inner join tbl_member m on fh.memseq = m.seq inner join tbl_house_basic hb on hb.seq = hp.hbasseq where hp.delflag = 0  %s order by fh.regdate ) a )where rnum >= %s and rnum <= %s order by rnum desc"
//											, where , map.get("end") , map.get("begin"));
			String sql = String.format("select * from (select a.* , rownum as rnum from(select fh.reportreason , hb.seq as hbseq , m.id , hp.seq as hpseq , hp.subject , to_char(fh.regdate , 'yyyy-mm-dd') as regdate , fh.state from tbl_false_house_report fh left outer join tbl_house_post hp on hp.seq = fh.postseq inner join tbl_member m on fh.memseq = m.seq inner join tbl_house_basic hb on hb.seq = hp.hbasseq where hp.delflag = 0 and hp.state in (1,3) %s order by fh.regdate ) a )where rnum >= %s and rnum <= %s order by rnum desc"
					, where , map.get("end") , map.get("begin"));
			
			System.out.println(sql);
			
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<FakeNoticeDTO> list = new ArrayList<FakeNoticeDTO>();
			
			while(rs.next()) {

				
				FakeNoticeDTO dto = new FakeNoticeDTO();
				
				
				dto.setHpseq(rs.getString("hpseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setState(rs.getString("state"));
				dto.setRnum(rs.getString("rnum"));
				dto.setId(rs.getString("id"));
				dto.setHbseq(rs.getString("hbseq"));
				dto.setReportreason(rs.getString("reportreason"));
				
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	/**
	 * 윤희선
	 * @param 특정 게시물 번호 넘겨줌
	 * @return 매물 위도 , 경도값 반환 
	 */
	//mappop 서블릿이 부름 
	public ArrayList<MapPopDTO> mapinfo(String hpseq) {
		
		try {
			
			String sql = String.format("select * from tbl_house_info hi inner join tbl_house_basic hb on hi.seq = hb.hinfoseq inner join tbl_house_post hp on hp.hbasseq = hb.seq where hp.seq = %s"
							,hpseq );
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<MapPopDTO> list = new ArrayList<MapPopDTO>();
			
			if(rs.next()) {
				MapPopDTO dto = new MapPopDTO();
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				
//				System.out.println(rs.getString("lat"));
				
				list.add(dto);
			}
			
			return list;
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	
	/**
	 * 윤희선
	 * @param hpseq 게시물 seq 
	 * @return 허위 매물 신고 내역 정보 돌려줌 
	 */
	//fakenoticelistok 서블릿이 호출 > 허위 매물 신고 내역 정보 가져오러 
	public ArrayList<ReportInfoDTO> info_list(String hpseq) {
		
		
		try {
			
//			String sql = String.format("select hb.seq as hbseq , st.type , hp.cost , hp.depcost , hp.maincost , fh.reportreason  from tbl_false_house_report fh inner join tbl_house_post hp on fh.postseq = hp.seq inner join tbl_house_basic hb  on hb.seq = hp.hbasseq  inner join tbl_house_info hi  on hi.seq = hb.hinfoseq inner join tbl_sale_type st  on st.seq = hb.stypeseq where hp.seq = %s"
//											,hpseq);
			
			String sql = String.format("select fh.state , pi.filename ,  hi.address , hb.seq as hbseq , st.type , hp.cost , hp.depcost , hp.maincost , fh.reportreason  from tbl_false_house_report fh inner join tbl_house_post hp on fh.postseq = hp.seq inner join tbl_house_basic hb  on hb.seq = hp.hbasseq  inner join tbl_house_info hi  on hi.seq = hb.hinfoseq inner join tbl_sale_type st  on st.seq = hb.stypeseq inner join tbl_post_image pi on hp.seq = pi.postseq where pi.imgseq = 1 and hp.seq = %s"
									, hpseq );
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<ReportInfoDTO> list = new ArrayList<ReportInfoDTO>();
			
			while(rs.next()) {
				ReportInfoDTO dto = new ReportInfoDTO();
				//가져올 데이터 
				//매물 번호 , 거래 유형 , 보증금 , 월세 , 관리비 , 신고내용 , 메인 파일명  , 주소 
				dto.setHbseq(rs.getString("hbseq"));
				dto.setSttype(rs.getString("type"));
				dto.setDepcost(rs.getString("depcost"));
				dto.setMaincost(rs.getString ("maincost"));
				dto.setREPORTREASON(rs.getString("REPORTREASON"));
				dto.setAddress(rs.getString("address"));
				dto.setFilename(rs.getString("filename"));
				dto.setCost(rs.getString("cost"));
				dto.setState(rs.getString("state"));
				
				
				
				list.add(dto);
			}
			
			return list;
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	/**
	 * 윤희선
	 * @param 특정 게시물 seq , 정상매물 or 허위매물 구별 변수 
	 */
	//fakeok 서블릿이 호출 , 정상매물 or 허위매물 선택 처리 update 
	public void fakeupdate(HashMap<String, String> map) {
		
		try {
			
			String sql = "";
			
			if(map.get("num").equals("0")) {
				//정상 매물 
				sql = String.format("update tbl_house_post set state = 2 where seq = %s", map.get("hpseq") );
				
			} else if(map.get("num").equals("1")){
				//허위 매물 
				sql = String.format("update tbl_house_post set state = 3 where seq = %s", map.get("hpseq"));
			}
			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
	
	/**
	 * 윤희선
	 * @return
	 */
	//housesearchdetail 서블릿이 호출 
	   public ArrayList<String> admingraphJon() {
		      try {
		         ArrayList<String> list = new ArrayList<String>();
		         String sql ="select Count(*) as c,regdate from(select SUBSTR(regdate, 4, 2)as regdate from TBL_AGENCY_INFO a inner join TBL_MEMBER b on a.memseq = b.seq) GROUP by regdate ORDER by regdate";
		         stat = conn.createStatement();
		         rs = stat.executeQuery(sql);
		         while (rs.next()) {
		            list.add(rs.getString("c"));
		         }
		         return list;
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return null;
		   }


	   /**
		 * 불편사항 관리 상세 페이지
		 * 
		 * @param 불편사항 상세 페이지 접속시 최초 출력에 필요한 값 받기
		 * @return 불편사항 상세 페이지 접속시 최초 출력에 필요한 값 반환
		 */
		public HashMap<String, String> incoveniences(String postseq) {
			HashMap<String, String> map = new HashMap<String, String>();
			try {
				String sql = "select typeseq,counseq,writer,content,subject,filename,regdate,blackname,blacktel,thread from TBL_INCONVENIENCES where depth=0 and seq =? order by seq";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, postseq);

				rs = pstat.executeQuery();

				while (rs.next()) {
					map.put("typeseq", rs.getString("typeseq"));
					map.put("counseq", rs.getString("counseq"));
					map.put("writer", rs.getString("writer"));
					map.put("content", rs.getString("writer"));
					map.put("filename", rs.getString("filename"));
					map.put("subject", rs.getString("subject"));
					map.put("regdate", rs.getString("regdate").replace("00:00:00", ""));
					map.put("blackname", rs.getString("blackname"));
					map.put("blacktel", rs.getString("blacktel"));
					map.put("thread", rs.getString("thread"));
					map.put("content", rs.getString("content"));

				}
				return map;
			} catch (Exception e) {
				e.printStackTrace();
			}

			return null;
		}

		/**
		 * 불편사항 답변하기 기능
		 * 
		 * @param admin
		 * @param filename
		 * @param counseq
		 * @param 답변에      필요한 값 받아오기
		 */
		public void adminanswer(String subject, String thread, String typeseq, String text, String admin, String filename,
				String counseq) {
			try {
				String sql = "insert into TBL_INCONVENIENCES VALUES (SEQ_INCONVENIENCES.nextval,?,?,?,?,?,?,sysdate,null,null,?,1,DEFAULT)";

				pstat = conn.prepareStatement(sql);

				pstat.setString(1, typeseq);
				pstat.setString(2, counseq);
				subject = "[답변] " + subject;
				pstat.setString(3, admin);
				pstat.setString(4, text);
				pstat.setString(5, subject);
				pstat.setString(6, filename);
				int a = Integer.parseInt(thread);
				a = a - 1;
				String b = "";
				b += a;
				pstat.setString(7, b);
				pstat.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		/**
		 * 매물번호 받아서 스레드값 가져오기
		 * 
		 * @param 매물번호
		 * @return 스레드값
		 */
		public int getthred(String postseq) {
			try {
				String sql = "select thread from TBL_INCONVENIENCES where seq = ?";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, postseq);
				int a = 0;
				rs = pstat.executeQuery();

				while (rs.next()) {
					a = rs.getInt(1);

				}
				return a;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}

		/**
		 * 스레드 값 을 받아서 답변이 됬는지 확인 해서 반환
		 * 
		 * @param 스레드값
		 * @return 답변됬는지 1, 0 을 반환
		 */
		public int incovenienceshide(int control) {
			try {
				String sql = "select thread from TBL_INCONVENIENCES where  thread = ?";

				pstat = conn.prepareStatement(sql);
				pstat.setInt(1, control);
				int a = 0;
				rs = pstat.executeQuery();

				while (rs.next()) {
					a++;
				}
				return a;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}

		/**
		 * 준표 - 중개사 승인 페이징에 쓰일 totalcount
		 * 
		 * @param map
		 * @return totalcount
		 */
		public int getTotalCountJon(HashMap<String, String> map) {
			try {
				String search = map.get("search");
				String sel = map.get("sel");
				if (sel.equals("0")) {
					sel = "";
					sel += " and id like ('%%";
					sel += search;
					sel += "%%')";
				} else if (sel.equals("1")) {
					sel = "";
					sel += " and b.name like ('%%";
					sel += search;
					sel += "%%')";
				} else if (sel.equals("2")) {
					sel = "";
					sel += " and id like ('%%";
					sel += search;
					sel += "%%') or b.name like ('%%";
					sel += search;
					sel += "%%')";
				}
				String sort = map.get("sort");
				if (sort.equals("3")) {
					sort = "0 or a.confirm = 1 or a.confirm = 2";
				}
				System.out.println(sort);

				String sql = String.format(
						"select count(*) from TBL_AGENCY_INFO a inner join TBL_MEMBER b on a.memseq = b.seq where a.confirm = %s %s ",
						sort, sel);
				System.out.println(sql);
				stat = conn.createStatement();

//				pstat = conn.prepareStatement(sql);
				/* pstat.setString(1, sort); */
				rs = stat.executeQuery(sql);

				int num = 0;
				while (rs.next()) {
					num = rs.getInt(1);

				}
				System.out.println(num);
				return num;

			} catch (Exception e) {

				e.printStackTrace();
			}
			return 0;
		}

		/**
		 * 준표 - 중개사 승인 페이징
		 * 
		 * @param map
		 * @return list
		 */
		public ArrayList<BoardDTO> list(HashMap<String, String> map) {
			try {

				String search = map.get("search");
				String sel = map.get("sel");
				if (sel.equals("0")) {
					sel = "";
					sel += " and id like ('%%";
					sel += search;
					sel += "%%')";
				} else if (sel.equals("1")) {
					sel = "";
					sel += " and b.name like ('%%";
					sel += search;
					sel += "%%')";
				} else if (sel.equals("2")) {
					sel = "";
					sel += " and id like ('%%";
					sel += search;
					sel += "%%') or b.name like ('%%";
					sel += search;
					sel += "%%')";
				}
				String sort = map.get("sort");
				if (sort.equals("3")) {
					sort = "0 or a.confirm = 1 or a.confirm = 2";
				}

				String sql = String.format(
						"select * from(select c.*,ROWNUM as rnum from (select id,b.name,a.filename,a.confirm,a.seq from TBL_AGENCY_INFO a inner join TBL_MEMBER b on a.memseq = b.seq where a.confirm = %s %s ORDER by a.seq)c )where rnum <=%s and rnum >=%s",
						sort, sel, map.get("end"), map.get("begin"));
				System.out.println(sql);
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);

				ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

				// rs -> list 복사
				while (rs.next()) {
					// 레코드 1줄 -> BoardDTO 1개
					BoardDTO dto = new BoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setRownum(rs.getInt("rnum"));
					dto.setFilename(rs.getString("filename"));

					String temp = "";
					if (rs.getString("confirm").equals("0")) {
						temp = "대기";
					} else if (rs.getString("confirm").equals("1")) {
						temp = "승인";
					} else if (rs.getString("confirm").equals("2")) {
						temp = "거부";
					}
					/* System.out.println(temp); */
					dto.setConfirm(temp);
					list.add(dto);
				}

				return list;

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}

		public ArrayList<String> admindetail(String seq) {
			try {
				ArrayList<String> list = new ArrayList<String>();
				String sql = String.format(
						"select b.filename as main,SUBSTR(ssn, 7, 1)as gender, substr(ssn,1,6) as ssn,b.tel,b.name,id,a.filename,offernum,a.name as sname , a.address as saddress,a.tel as stell from TBL_AGENCY_INFO a inner join TBL_MEMBER b on a.memseq = b.seq where a.seq = %s",
						seq);
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				while (rs.next()) {
					list.add(rs.getString("main"));
					String gender = "";
					if (rs.getString("gender").equals("1")) {
						gender = "남자";
					} else {
						gender = "du자";
					}
					list.add(gender);
					list.add(rs.getString("ssn"));
					list.add(rs.getString("tel"));
					list.add(rs.getString("name"));
					list.add(rs.getString("id"));
					list.add(rs.getString("filename"));
					list.add(rs.getString("offernum"));
					list.add(rs.getString("sname"));
					list.add(rs.getString("saddress"));
					list.add(rs.getString("stell"));
				}
				return list;
			} catch (Exception e) {
				e.printStackTrace();
			}

			return null;
		}

		public void adminupdate(String temp, String seq) {
			try {
				ArrayList<String> list = new ArrayList<String>();
				String sql = String.format(
						"update TBL_AGENCY_INFO set confirm =%s where seq=%s",temp,seq);
				stat = conn.createStatement();
				stat.executeUpdate(sql);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		public ArrayList<String> admingraph() {
			try {
				ArrayList<String> list = new ArrayList<String>();
				String sql ="select Count(*) as c,regdate from(select SUBSTR(regdate, 4, 2)as regdate from TBL_AGENCY_INFO a inner join TBL_MEMBER b on a.memseq = b.seq) GROUP by regdate ORDER by regdate";
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				while (rs.next()) {
					list.add(rs.getString("c"));
				}
				return list;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}

		public ArrayList<String> circlegraph() {
			try {
				ArrayList<String> list = new ArrayList<String>();
				String sql ="select b.memtype,count(*) as c from TBL_AGENCY_INFO a inner join TBL_MEMBER b on a.memseq = b.seq GROUP by b.memtype";
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				while (rs.next()) {
					list.add(rs.getString("c"));
				}
				return list;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	   
	   
	   
	   
	   
	   
	   
	   




}//AdminDAO


