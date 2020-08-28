package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import com.test.common.DBUtil;

/**
 * @author sist41
 *
 */
/**
 * @author sist41
 *
 */
/**
 * @author sist41
 *
 */
/**
 * @author sist41
 *
 */
public class MemberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public MemberDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// close

	/**
	 * 백지현 로그인시 id/pw 일치 유효성 검사
	 * 
	 * @param dto : memberdto
	 * @return : 검사 성공여부 cnt로 return
	 */
	public int memberLogin(MemberDTO dto) {
		try {

			String sql = "select count(*) as cnt from tbl_Member where id=? and pw=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("MemberDAO.memberLogin()");
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 백지현 로그인시 id를 입력받아 seq값을 찾아내는 메소드
	 * 
	 * @param id
	 * @return 해당 회원의 seq return
	 */
	public String getMemberSeq(String id) {
		try {

			String sql = "select seq from tbl_Member where id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("seq");
			}
		} catch (Exception e) {
			System.out.println("MemberDAO.getMemberSeq()");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 김영현
	 * 
	 * @param 서블릿에서 페이징 용 총 게시물 갯수 세기
	 * @return
	 */
	public int getTotalCount(HashMap<String, String> map) {
		
		
		try {
			
			String where = "";
			
			//검색 중이면 아무것도 x
			if (map.get("search") != null) {
				//제목으로만 검색
				if(map.get("sort").equals("subject")) {
					where = String.format("where subject like '%%%s%%'", map.get("search"));					
				} else if(map.get("sort").equals("contentsubject")) {
				//제목 + 내용	
					where = String.format(" where subject like '%%%s%%' or content like '%%%s%%'", map.get("search"), map.get("search"));	
				}
			}
			
			String sql = String.format("select count(*) as cnt from vwseefinance %s", where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			
			System.out.println(e);
		}
		
		return 0;
	}//getTotalCount
	
	/**
	 * 
	 * @param 내용 저장하기
	 * @return
	 */
	public ArrayList<SeeRecommendFinDTO> finlist(HashMap<String, String> map) {
try {
			
			//목록 or 검색
			String where = "";
			
			//검색 중이면 아무것도 x
			if (map.get("search") != null) {
				//제목으로만 검색
				if(map.get("sort").equals("subject")) {
					where = String.format("and subject like '%%%s%%'", map.get("search"));					
				} else if(map.get("sort").equals("contentsubject")) {
				//제목 + 내용	
					where = String.format("and subject like '%%%s%%' or content like '%%%s%%'", map.get("search"), map.get("search"));	
				}
			}
			
			
			String begin = map.get("begin");
			String end = map.get("end");
			
			String sql = String.format("select * from vwseefinance where rnum >= %s and rnum <= %s %s",begin, end, where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<SeeRecommendFinDTO> list = new ArrayList<SeeRecommendFinDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				//레코드 1줄 -> BoardDTO 1개
				SeeRecommendFinDTO dto = new SeeRecommendFinDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setRnum(rs.getString("rnum"));
				dto.setContent(rs.getString("content"));
				dto.setFilename(rs.getString("filename"));
				dto.setId(rs.getString("id"));
				dto.setReadcnt(rs.getString("readcnt"));
				dto.setRecomcnt(rs.getString("recomcnt"));
				dto.setRegdate(rs.getString("regdate").substring(0, 10));
				dto.setSubject(rs.getString("subject"));
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}//list 메소드

	// reghousemenu 서블릿에서 문서 갯수 세기
	/**
	 * 김영현
	 * 
	 * @param seq 넘기고 문서 갯수 세기
	 * @return
	 */
	public String getDocCount(String seq) {

		try {

			String sql = "select ((select count(*) as cnt from tbl_copy_info where memseq = ? and delflag = 0) + (select count(*) as cnt from tbl_agency_info where memseq = ? and delflag = 0)) as cnt "
					+ "from dual";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			pstat.setString(2, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}// getDocCount

	/**
	 * 
	 * 김영현
	 * 
	 * regcertidoc 서블릿에서 개설번호 인증하기 버튼
	 * 
	 * 
	 * @param inputnum
	 * @return result
	 */
	public String compareOffNum(String inputnum) {

		try {
			String sql = "select (select count(*) as cnt from tbl_offering_num where num =" + inputnum
					+ " and delflag = 0) + (select count(*) " + "from tbl_agency_info where offernum = '" + inputnum
					+ "' and delflag = 0 and confirm = 1) as cnt from dual";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("cnt");
			}

			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "0";
	}// compareOffNum

	/**
	 * 김영현
	 * 
	 * @param map
	 * @return result
	 *
	 *         regcertidocok 서블릿에서 공인 중개사 등록하는 메소드
	 */
	public int insertAgency(HashMap<String, String> map) {

		try {

			String sql = String.format(
					"insert into tbl_agency_info values (seq_copy_info.nextVal, %s, '%s', '%s', '%s', '%s', '%s', '%s', default)",
					map.get("seq"), map.get("uploadfile"), map.get("address"), map.get("inputnum"), map.get("call"),
					map.get("inputname"), "0");

			System.out.println(sql);
			stat = conn.createStatement();

			return stat.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	// regattdoc 서블릿에서 등본 등록 기능 (영현)
	/**
	 * 김영현
	 * 
	 * @param 등본 등록을 위한 정보가 담긴 그릇
	 * @return 성공 여부
	 */
	public int insertCopy(HashMap<String, String> map) {

		try {

			String sql = String.format(
					"insert into tbl_copy_info values (seq_copy_info.nextVal, %s, '%s', %s, %s, %s, %s, %s, %s, %s, default)",
					map.get("seq"), map.get("uploadfile"), map.get("opt1"), map.get("opt2"), map.get("sel1"),
					map.get("opt3"), map.get("sel2"), map.get("opt4"), "0");

			stat = conn.createStatement();

			return stat.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	// reghousemenu 서블릿에서 등본 갯수 반환(영현)
	/**
	 * 김영현
	 * 
	 * @param 멤버 seq
	 * @return 갯수 반환
	 */
	public String getCopyCount(String seq) {

		try {

			String sql = "select count(*) as cnt from tbl_copy_info where memseq = " + seq
					+ "and confirm = 1 and delflag = 0";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "0";
	}

	// reghousemenu 서블릿에서 자격증 갯수 반환(영현)
	/**
	 * 김영현
	 * 
	 * @param 멤버 seq
	 * @return 자격증 갯수 반환
	 */
	public String getAgencyCount(String seq) {
		try {

			String sql = "select count(*) as cnt from tbl_agency_info where memseq = " + seq
					+ "and confirm = 1 and delflag = 0";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "0";
	}

	/**
	 * 
	 * 김영현
	 * 
	 * @param dto --> 필터담긴 그릇
	 * @return 각 달 값과 그 값 평균 값 seemarketprice 서블릿에서 위임(영현)
	 */
	public ArrayList<MarketDTO> getcount(FilterDTO dto) {

		String firstfilter = dto.getFirstfilter(); // 서울
		String secondfilter = dto.getSecondfilter(); // 송파구
		String thirdfilter = dto.getThirdilter(); // 삼전동
		String saletype = dto.getSaletype(); // 매매

		ArrayList<MarketDTO> list = new ArrayList<MarketDTO>(); // 저장해서 보내줄 list

		try {
			String sql = "select regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = " + saletype
					+ "  and address like '%" + firstfilter + "%' group by regdate" + " order by regdate ";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			String temp = "";
			String tempprice = "";

			while (rs.next()) {

				temp += rs.getString("regdate") + ",";
				tempprice += rs.getString("avg") + ",";

			} // firstfilter

			MarketDTO mdto = new MarketDTO();

			if (temp.length() != 0) {
				temp = temp.substring(0, temp.length() - 1);
				tempprice = tempprice.substring(0, tempprice.length() - 1);
			}

			mdto.setAvg(tempprice);
			mdto.setRegdate(temp);
			mdto.setFilter(firstfilter);

			list.add(mdto);

			sql = "select regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = " + saletype
					+ "  and address like '%" + secondfilter + "%' group by regdate" + " order by regdate ";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			temp = "";
			tempprice = "";

			while (rs.next()) {

				temp += rs.getString("regdate") + ",";
				tempprice += rs.getString("avg") + ",";

			} // firstfilter

			MarketDTO mdto2 = new MarketDTO();

			if (temp.length() != 0) {
				temp = temp.substring(0, temp.length() - 1);
				tempprice = tempprice.substring(0, tempprice.length() - 1);
			}
			mdto2.setAvg(tempprice);
			mdto2.setRegdate(temp);
			mdto2.setFilter(secondfilter);

			list.add(mdto2);

			sql = "select regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = " + saletype
					+ "  and address like '%" + thirdfilter + "%' group by regdate" + " order by regdate ";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			temp = "";
			tempprice = "";

			while (rs.next()) {
				temp += rs.getString("regdate") + ",";
				tempprice += rs.getString("avg") + ",";

			} // thirdfilter

			if (temp.length() != 0) {
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
	}// getcount

	/**
	 * 
	 * @param db 에서 불러온 날짜 & 값
	 * @return 정리한 값 영현
	 */
	public ArrayList<MarketDTO> ManufactList(ArrayList<MarketDTO> list) {

		ArrayList<MarketDTO> manulist = new ArrayList<MarketDTO>();

		for (MarketDTO dto : list) {
			MarketDTO savedto = new MarketDTO();

			String[] monthList = dto.getRegdate().split(",");
			String[] priceList = dto.getAvg().split(",");

			String temp = "";
			String pricetemp = "";

			if (Integer.parseInt(monthList[0]) != 1) {
				// 첫 시작이 1월이 아닌 경우
				for (int i = 1; i < Integer.parseInt(monthList[0]); i++) {
					temp += "0" + i + ",";
					pricetemp += "0,";
				} // for
			}

			temp += monthList[0] + ",";

			pricetemp += Math.round(Long.parseLong(priceList[0]) / 10000) + ",";

			for (int i = 1; i < monthList.length - 1; i++) {
				// 값 돌면서 순서 맞추기

				if (Integer.parseInt(monthList[i]) + 1 != Integer.parseInt(monthList[i + 1])) {
					// 순서대로 저장되지 않은 경우
					temp += "0" + Integer.parseInt(monthList[i]) + ",";
					temp += "0" + (Integer.parseInt(monthList[i]) + 1) + ",";

					pricetemp += Math.round(Long.parseLong(priceList[i]) / 10000) + ",";
					pricetemp += Math.round(Long.parseLong(priceList[i]) / 10000) + ",";

				} else {
					// 순서대로 저장되는 경우
					temp += monthList[i] + ",";
					pricetemp += Math.round(Long.parseLong(priceList[i]) / 10000) + ",";

				}
			} // for

			temp += monthList[monthList.length - 1] + ",";
			pricetemp += Math.round(Long.parseLong(priceList[priceList.length - 1]) / 10000) + ",";

			int first = Integer.parseInt(monthList[monthList.length - 1]);

			if (first != 8 && monthList.length != 0) {

				for (int i = first + 1; i <= 8; i++) {
					temp += "0" + i + ",";
					pricetemp += Math.round(Long.parseLong(priceList[priceList.length - 1]) / 10000) + ",";

				}

				// 마지막 , 없애기
				temp = temp.substring(0, temp.length() - 1);
				pricetemp = pricetemp.substring(0, pricetemp.length() - 1);

			} // if

			savedto.setAvg(pricetemp);
			savedto.setRegdate(temp);
			savedto.setFilter(dto.getFilter());

			manulist.add(savedto);
		}

		return manulist;
	}

	/**
	 * 김영현
	 * 
	 * @매매타입 & 매매 seq
	 */
	public ArrayList<SaleTypeDTO> getSaleType() {

		try {
			String sql = "select * from tbl_sale_type where delflag = 0";
			ArrayList<SaleTypeDTO> list = new ArrayList<SaleTypeDTO>();

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			while (rs.next()) {

				SaleTypeDTO dto = new SaleTypeDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setSaletype(rs.getString("type"));

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
	 * @매물 타입 반환 김영현
	 */
	public ArrayList<HouseTypeDTO> getHouseType() {

		try {
			String sql = "select * from tbl_house_type where delflag = 0";
			ArrayList<HouseTypeDTO> list = new ArrayList<HouseTypeDTO>();

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			while (rs.next()) {

				HouseTypeDTO dto = new HouseTypeDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setType(rs.getString("type"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 김영현
	 * 
	 * @옵션 반환
	 */
	public ArrayList<OptionTypeDTO> getOptionType() {

		try {
			String sql = "select * from tbl_option where delflag = 0";
			ArrayList<OptionTypeDTO> list = new ArrayList<OptionTypeDTO>();

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			while (rs.next()) {

				OptionTypeDTO dto = new OptionTypeDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setOptname(rs.getString("optname"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 김영현
	 * 
	 * @param infomap -> tbl_house_info 에 들어갈 정보들이 담긴 그릇
	 * @return result 와 seq가 담긴 그릇
	 */
	public ResultDTO insertInfo(HashMap<String, String> infomap) {

		try {

			String sql = "select seq_house_info.nextVal from dual";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			String seq = "";

			// 변환해줄 그릇
			ResultDTO dto = new ResultDTO();

			if (rs.next()) {
				seq = rs.getString("nextval");
			}

			dto.setSeq(seq);

			sql = "insert into tbl_house_info values (?, ?, ?, ?, ?, ?, ?, ?, ?, default)";
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			pstat.setString(2, infomap.get("comdate"));
			pstat.setString(3, infomap.get("address"));
			System.out.println(infomap.get("lat"));

			pstat.setString(4, infomap.get("lat").substring(0, infomap.get("lat").lastIndexOf(".") + 7));
			pstat.setString(5, infomap.get("lng").substring(0, infomap.get("lng").lastIndexOf(".") + 7));
			pstat.setString(6, infomap.get("alt"));
			pstat.setString(7, infomap.get("area"));
			pstat.setString(8, infomap.get("floor"));
			pstat.setString(9, infomap.get("totalfloor"));

			String result = pstat.executeUpdate() + "";

			dto.setResult(result);

			return dto;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 김영현
	 * 
	 * @param tbl_house_basic 에 담기 위한 그릇
	 * @return 결과 값들 반환
	 */
	public ResultDTO insertBasic(HashMap<String, String> basicmap) {
		try {

			String sql = "select seq_house_basic.nextVal from dual";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			String seq = "";

			// 변환해줄 그릇
			ResultDTO dto = new ResultDTO();

			if (rs.next()) {
				seq = rs.getString("nextval");
			}

			dto.setSeq(seq);

			sql = "insert into tbl_house_basic values (?, ?, ?, ?, default)";
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			pstat.setString(2, basicmap.get("hinfoseq"));
			pstat.setString(3, basicmap.get("htype"));
			pstat.setString(4, basicmap.get("stype"));

			String result = pstat.executeUpdate() + "";

			dto.setResult(result);

			return dto;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 김영현
	 * 
	 * @param tbl_house_option
	 * @param hbasseq          house_basic seq
	 * @return
	 */
	public ResultDTO insertOption(HashMap<String, String[]> optmap, String hbasseq) {

		try {
			ResultDTO dto = new ResultDTO();

			String sql = "insert into tbl_house_option values (seq_house_option.nextVal, ?, ?, default)";

			int result = 0;

			System.out.println(optmap.get("op"));
			// 옵션에 값이 있는 경우만
			if (optmap.get("op").length != 0) {
				pstat = conn.prepareStatement(sql);
				for (String opt : optmap.get("op")) {
					for (String optseq : opt.split(",")) {

						if (optseq.length() != 0) {

							pstat.setString(1, hbasseq);
							pstat.setString(2, optseq);
							result += pstat.executeUpdate();
						}
					}
				} // for문

				dto.setResult("1");

				return dto;

			} else {
				dto.setResult("1");
				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;
	}

	/**
	 * 김영현
	 * 
	 * @param postmap에 넣기 위한 데이터 그릇
	 * @return result 를 담기 위한 그릇
	 */
	public ResultDTO insertPost(HashMap<String, String> postmap) {

		try {

			String sql = "select seq_house_post.nextVal from dual";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			String seq = "";

			// 변환해줄 그릇
			ResultDTO dto = new ResultDTO();

			if (rs.next()) {
				seq = rs.getString("nextval");
			}

			dto.setSeq(seq);

			sql = "insert into tbl_house_post values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', default)";
			pstat = conn.prepareStatement(sql);

			Calendar now = Calendar.getInstance();
			String time = String.format("%tF", now);

			pstat.setString(1, seq);
			pstat.setString(2, postmap.get("memseq"));
			pstat.setString(3, postmap.get("hbasseq"));
			pstat.setString(4, postmap.get("subject"));
			pstat.setString(5, postmap.get("cost"));
			pstat.setString(6, postmap.get("depcost"));
			pstat.setString(7, postmap.get("maincost"));
			pstat.setString(8, time);
			pstat.setString(9, postmap.get("detailsubject"));
			pstat.setString(10, postmap.get("detailcontent"));

			String result = pstat.executeUpdate() + "";

			dto.setResult(result);

			return dto;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 김영현
	 * 
	 * @param postmap에 넣을 데이터가 담긴 그릇
	 * @return 결과값이 담긴 그릇
	 */
	public ResultDTO insertImage(HashMap<String, String> imgmap) {

		try {
			String sql = "insert into tbl_post_image values (seq_post_image.nextVal, ?, ?, ?, default)";
			pstat = conn.prepareStatement(sql);

			ResultDTO dto = new ResultDTO();

			for (String seq : imgmap.keySet()) {

//				System.out.println(imgmap.get(seq).isEmpty()); //오류
//				System.out.println(imgmap.get(seq).equals("")); //오류
//				System.out.println(imgmap.get(seq) == null); //성공~
				if (seq.equals("main")) {
					// 메인 사진
					pstat.setString(1, "1");
					pstat.setString(3, imgmap.get("main"));

					pstat.setString(2, imgmap.get("pseq")); // 게시글 번호

					pstat.executeUpdate();
				} else if (seq.equals("detail1")) {
					// 상세 사진
					pstat.setString(1, "2");
					pstat.setString(3, imgmap.get("detail1"));
					pstat.setString(2, imgmap.get("pseq")); // 게시글 번호

					pstat.executeUpdate();
				} else if (seq.equals("detail2")) {
					// 상세 사진에 값이 있을 경우만 저장
					if (imgmap.get("detail2") != null) {
						pstat.setString(1, "2");
						pstat.setString(3, imgmap.get("detail2"));
						pstat.setString(2, imgmap.get("pseq")); // 게시글 번호

						pstat.executeUpdate();
					}
				} else if (seq.equals("detail3")) {
					// 상세 사진에 값이 있을 경우만 저장
					if (imgmap.get("detail3") != null) {
						pstat.setString(1, "2");
						pstat.setString(3, imgmap.get("detail3"));
						pstat.setString(2, imgmap.get("pseq")); // 게시글 번호

						pstat.executeUpdate();
					}

				} else if (seq.equals("detail4")) {
					// 상세 사진에 값이 있을 경우만 저장
					if (imgmap.get("detail4") != null) {
						pstat.setString(1, "2");
						pstat.setString(3, imgmap.get("detail4"));
						pstat.setString(2, imgmap.get("pseq")); // 게시글 번호

						pstat.executeUpdate();
					}

				} else if (seq.equals("surround")) {
					// 전경 사진에 값이 있을 경우만 저장
					if (imgmap.get("surround") != null) {
						pstat.setString(1, "3");
						pstat.setString(3, imgmap.get("surround"));
						pstat.setString(2, imgmap.get("pseq")); // 게시글 번호

						pstat.executeUpdate();
					}

				} else if (seq.equals("floorimg")) {
					// 평면도 사진에 값이 있을 경우만 저장
					if (imgmap.get(seq) != null) {
						pstat.setString(1, "4");
						pstat.setString(3, imgmap.get(seq));
						pstat.setString(2, imgmap.get("pseq")); // 게시글 번호

						pstat.executeUpdate();
					}

				}
			} // for문

			dto.setResult("1");

			return dto;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

/**
 * 
 * 백지현
 * @param id
 * @return
 */
	
	public int checkId(String id) {

		try {
			String sql = "select count(*) as cnt from tbl_member where id=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			if (rs.next()) {
				return (Integer.parseInt(rs.getString("cnt")));
			}

		} catch (Exception e) {
			System.out.println("MemberDAO.checkId()");
		}
		return 0;
	}

	
	


	/**
	 * 최예림
	 * @param map
	 * @return
	 */

	public ArrayList<NoticeBoardDTO> noticelist(HashMap<String, String> map) {

		try {

			// 검색
			String where = "";

			if (map.get("search") != null) {

				if (map.get("searchfield").equals("st")) {

					// 내용
					where = String.format("where (subject like '%%%s%%')", map.get("search"));

				} else if (map.get("searchfield").equals("stc")) {

					// 제목&내용
					where = String.format("where (subject like '%%%s%%' or content like '%%%s%%')", map.get("search"),
							map.get("search"));

				} else if (map.get("searchfield").equals("sc")) {

					// 내용
					where = String.format("where (content like '%%%s%%')", map.get("search"));

				}

			} // if문

			// String sql = "select * from (select a.*, rownum as rnum from (select * from
			// tbl_notice order by regdate asc) a) order by rnum desc";
			String sql = String.format(
					"select * from (select a.*, rownum as rnum from (select * from tbl_notice order by regdate asc) a) %s order by rnum desc",
					where);

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<NoticeBoardDTO> list = new ArrayList<NoticeBoardDTO>();

			while (rs.next()) {

				NoticeBoardDTO dto = new NoticeBoardDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setAdmseq(rs.getString("admseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcnt(rs.getString("readcnt"));
				dto.setRegdate(rs.getString("regdate").substring(0, 10));
				dto.setFilename(rs.getString("filename"));

				dto.setRnum(rs.getString("rnum"));

				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 공지사항 글 조회 시
	public NoticeBoardDTO noticeget(NoticeBoardDTO dto2) {

		try {

			String sql = "select * from tbl_Notice where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getSeq()); // 글번호

			rs = pstat.executeQuery();

			if (rs.next()) {

				NoticeBoardDTO dto = new NoticeBoardDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setAdmseq(rs.getString("admseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcnt(rs.getString("readcnt"));
				dto.setRegdate(rs.getString("regdate").substring(0, 10));
				dto.setFilename(rs.getString("filename"));

				return dto;

			}

		} catch (Exception e) {
			System.out.println("MemberDAO.get()");
			e.printStackTrace();
		}

		return null;
	}

	// 공지사항글 조회시 조회수 증가
	public void updateReadcount(String seq) {

		try {

			String sql = "update tbl_Notice set readcnt = readcnt + 1 where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("MemberDAO.updateReadcount()");
			e.printStackTrace();
		}

	}
	/**
	 * 백지현
	 * @param seq
	 * @return
	 */

	public MemberDTO getMemberInfo(String seq) {
		
		try {
			String sql = " select * from tbl_member where seq =?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,seq);
			rs = pstat.executeQuery();
			MemberDTO mdto = new MemberDTO();
			if(rs.next()) {
				mdto.setName(rs.getString("name"));
				mdto.setTel(rs.getString("tel"));
				return mdto;
			}
					
		} catch (Exception e) {
			System.out.println("MemberDAO.getMemberInfo()");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 최예림
	 * @return
	 */
	//자주묻는질문 목록 출력
	public ArrayList<FaqBoardDTO> faqlist() {
		
		try {
			
			String sql = "select * from tbl_faq";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<FaqBoardDTO> faqlist = new ArrayList<FaqBoardDTO>();
			
			
			while (rs.next()) {
				
				FaqBoardDTO dto = new FaqBoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setItemseq(rs.getString("itemseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setDelflag(rs.getString("delflag"));
				
				faqlist.add(dto);
				
				
			}
			
			return faqlist;
			
			
		} catch (Exception e) {
			System.out.println("MemberDAO.faqlist()");
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	//문의사항 목록 출력
	public ArrayList<InquiryBoardDTO> inquirylist(HashMap<String, String> map) {
		
		
		try {
			
			//검색
			String where = "";
			
			if(map.get("search") != null) {
				
				
				if( map.get("searchfield").equals("st") ) {
					
					//제목
					where = String.format("where (subject like '%%%s%%')", map.get("search"));
					
				}
				
				
			}//if문
			

			//String sql = "select * from (select a.*, rownum as rnum from (select * from tbl_notice order by regdate asc) a) order by rnum desc";
			
			//기본 sql
			String sql = "select * from tbl_inquiry where seq <=10";
			
			//rownum 추가 sql
			//String sql = String.format("select * from (select * from (select rownum as rnum, a.* from tbl_inquiry a) order by rnum desc) %s order by seq asc", where);
			
			//String sql = String.format("select * from (select * from (select rownum as rnum, a.* from tbl_inquiry a) order by rnum desc) %s and rnum >= %s and rnum <= %s order by seq asc", where, map.get("begin"), map.get("end"));
			
			/*
			 * sql = String.
			 * format("select * from (select a.*, rownum as rnum from (select * from vwBoard order by %s desc) a) where rnum >= %s and rnum <= %s %s order by %s desc"
			 * , map.get("sort"), map.get("begin"), map.get("end"), where, map.get("sort"));
			 */
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<InquiryBoardDTO> list = new ArrayList<InquiryBoardDTO>();

			
			while (rs.next()) {
				
				InquiryBoardDTO dto = new InquiryBoardDTO();

				
				dto.setSeq(rs.getString("seq"));
				dto.setItemseq(rs.getString("itemseq"));
				
				
				//1.회원정보 2.중개사 3.시공서비스 4. 홈페이지이용 5.기타 6.블랙리스트
				if (rs.getString("itemseq").equals("1")) {
					dto.setItemseq("회원정보");
				} else if (rs.getString("itemseq").equals("2")) {
					dto.setItemseq("중개사");
				} else if (rs.getString("itemseq").equals("3")) {
					dto.setItemseq("시공 서비스");
				} else if (rs.getString("itemseq").equals("4")) {
					dto.setItemseq("홈페이지 이용");
				} else if (rs.getString("itemseq").equals("5")) {
					dto.setItemseq("기타");
				} else if (rs.getString("itemseq").equals("6")) {
					dto.setItemseq("블랙리스트");
				}
				
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setFilename(rs.getString("filename"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));
				

				list.add(dto);
				
			}
			
			 
			return list;
			
		} catch (Exception e) {
			System.out.println("MemberDAO.list()");
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	//문의사항 글 조회 시
	public InquiryBoardDTO inquiryget(InquiryBoardDTO dto2) {
		try {
			
			String sql = "select * from tbl_Inquiry where seq = ?";
					
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getSeq()); //글번호
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				InquiryBoardDTO dto = new InquiryBoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setItemseq(rs.getString("itemseq"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setFilename(rs.getString("filename"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				
				return dto;
	
			}
			
			
		} catch (Exception e) {
			System.out.println("MemberDAO.get()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 김영현
	 * @param 글 번호
	 * @return 게시글 정보 반환
	 */
	public SeeRecommendFinDTO viewFinList(FinanceDTO fdto) {
		
		//글번호 seq
		try {
			
			String sql = "select a.* from (select rownum as rnum, v.* from vwseefinance v where seq = " +  fdto.getSeq()+ ") a order by rnum desc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			//반환할 정보를 담을 객체
			SeeRecommendFinDTO dto = new SeeRecommendFinDTO();
			if(rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setRnum(rs.getString("rnum"));
				dto.setContent(rs.getString("content").replaceAll("\\\\r\\\\n", "<br>")); //개행 처리
				dto.setFilename(rs.getString("filename"));
				dto.setId(rs.getString("id"));
				dto.setReadcnt(rs.getString("readcnt"));
				dto.setRegdate(rs.getString("regdate").substring(0, 10));
				dto.setSubject(rs.getString("subject"));
			} //게시글

			String where = "";
			//검색 중이면 아무것도 x
			if (fdto.getSort() != "4") {
				//제목으로만 검색
				if(fdto.getSort().equals("subject")) {
					where = String.format("where subject like '%%%s%%'", fdto.getSearch());					
				} else if(fdto.getSort().equals("contentsubject")) {
				//제목 + 내용	
					where = String.format("where subject like '%%%s%%' or content like '%%%s%%'", fdto.getSearch(), fdto.getSearch());	
				}
			}
			
			sql = "select min(seq) as min from (select rownum as rnum, v.* from vwseefinance v  " + where + ") a where seq > " + fdto.getSeq(); //다음 글 번호
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				dto.setNextNum(rs.getString("min")); //다음글 번호
			} else {
				dto.setNextNum("");
			}
			
			//이전글
			sql = "select max(seq) as max from (select rownum as rnum, v.* from vwseefinance v  " + where + ") a where seq < " + fdto.getSeq(); //이전 글 번호
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				dto.setPrevNum(rs.getString("max")); //다음글 번호
			} else {
				dto.setPrevNum("");
			}
			
			
			return dto;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}

	/**
	 * 김영현
	 * @param seq 글번호
	 * 조회수 증가 viewRecommendFinance 서블릿
	 */
	public void updatereadcnt_Finance(String seq) {
		String sql = "update tbl_recommend_finance set readcnt = readcnt + 1 where seq = " + seq;
		
		
		try {
			
			stat = conn.createStatement();
			stat.executeUpdate(sql);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 김영현
	 * @param postseq 게시판 번호, 고객번호
	 * @param seq 
	 * @return 문의 seq
	 */
	public String getContactSeq(String postseq, String seq) {
		
		try {
			System.out.println(seq);
			String sql = "select seq from tbl_house_contact where memseq = " + seq + " and delflag = 0"
					+ " and sellerconfirm = '상담완료' and consumerconfirm = '상담완료'";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				String finalseq = rs.getString("seq");
				System.out.println(finalseq);
				return finalseq;
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		
		return null;
	}

	/**
	 * 김영현
	 * @param stype 매매 or 월세 or 전세
	 * @return
	 */
	public String getDocumentSeq(String stype) {
		
		try {
			String sql = String.format("select seq from tbl_document_type where type like '%%%s%%' and delflag = 0", stype) ;
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getString("seq");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	/**
	 * 영현
	 * @param 회원 번호
	 * @return 회원 정보가 담긴 그릇
	 */
	public MemberDocInfoDTO GetmemberDocInfo(String seq) {
		
		try {
			
			String sql = "select * from tbl_member where seq = " + seq;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			MemberDocInfoDTO dto = new MemberDocInfoDTO();
			
			if(rs.next()) {
				dto.setAddress(rs.getString("address").substring(7));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
			}
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	/**
	 * 김영현
	 * @param tbl_contract_document 에 넘기 위한 데이터 그릇
	 * @return 결과값
	 */
	public int insertContractDoc(HashMap<String, String> map) {
		
		try {
			String sql ="insert into tbl_contract_document values (seq_contract_document.nextVal, ?, ?, ?, default)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("docseq"));
			pstat.setString(2, map.get("hconseq"));
			pstat.setString(3, map.get("file"));
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return 0;
	}

	
	/**
	 * complete 서블릿
	 * 김영현
	 * @param hconseq 계약 번호 
	 * @param docseq 문서 번호
	 * @return 해당 계약과 해당 문서번호를 가진 컬럼의 갯수와 문서의 이름을 담은 그릇
	 */
	public getCntAndNameDTO getSaleDocCount(String hconseq, String docseq) {
		
		try {
			
			String sql = "select count(*) as cnt from tbl_contract_document where delflag = 0 and hconseq = ? and docseq = ?";
			
			getCntAndNameDTO dto = new getCntAndNameDTO();
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, hconseq);
			pstat.setString(2, docseq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				dto.setCnt(rs.getString("cnt"));
			}
			
			if(!dto.getCnt().equals("0")) {
				
				sql = "select filename from tbl_contract_document where delflag = 0 and hconseq = ? and docseq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, hconseq);
				pstat.setString(2, docseq);
				
				rs = pstat.executeQuery();
				
				if(rs.next()) {
					dto.setName(rs.getString("filename"));
				}
				
				
			}
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return null; //오류 발생시
	}
		
	
	   
	/**
	 * 김찬우
	 * 세션에 저장된 아이디를 통해 해당 회원의 정보를 가져오는 메소드
	 * @param id 로그인 후 세션에 저장된 id
	 * @return 회원정보가 저장된 dto 반환
	 */
	public MypageDTO getInfo(String seq) {
	
		try {
			String sql = "select * from tbl_member where seq= ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
	
			while(rs.next()) {
				MypageDTO dto = new MypageDTO();
				dto.setMemseq(rs.getString("seq"));
				dto.setFilename(rs.getString("filename"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setMarsta(rs.getString("marsta"));
				dto.setMemtype(rs.getString("memtype").equals("2")?"중개사":
					rs.getString("memtype").equals("1")?"개인 영업자":rs.getString("memtype").equals("0")?"일반 회원":"만능회원");
				dto.setPw(rs.getString("pw"));	
				return dto;
			}
		} catch (Exception e) {
			System.out.println("MemberDAO.getInfo()");
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * 김찬우
	 * @param seq session에 저장된 회원번호 
	 * @return ArrayList<MyregDTO> 
	 * 내가 올린 매물 게시판의 목록 데이터를 저장한 배열을 반환하는 메소드
	 */
	public ArrayList<MyregDTO> myreglist(String seq) {
	
	try {	
		String sql = "select rownum, a.* from vwMyreglist a where memseq = ? order by rownum desc ";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1, seq);
		
		rs = pstat.executeQuery();
		
		ArrayList<MyregDTO> reglist = new ArrayList<MyregDTO>();
		while(rs.next()) {
			MyregDTO dto = new MyregDTO();
			dto.setSubject(rs.getString("subject"));
			dto.setId(rs.getString("id"));
			dto.setRegdate(rs.getString("regdate").substring(0,10));
			dto.setState(rs.getString("state").equals("0")?"대기":
				rs.getString("state").equals("1")?"신고":
				rs.getString("state").equals("2")?"정상매물":"허위매물");
			dto.setPostseq(rs.getString("postseq"));
			dto.setRnum(rs.getString("rownum"));
			reglist.add(dto);
		}
		return reglist;
	} catch (Exception e) {
		System.out.println("MemberDAO.myreglist()");
		e.printStackTrace();
	}
	return null;
	}

	/**
	 * 김찬우
	 * @param seq 세션에 저장된 회원번호
	 * @return ArrayList<MyregDTO> 내가올린매물의 정보를 담은 배열반환
	 * 내가올린 매물 게시글의 정보를 반환해주는 메소드
	 */
	public ArrayList<MyregDTO> myreg(String seq) {
		
		try {	
			String sql = "select * from vwMyreg where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MyregDTO> reglist = new ArrayList<MyregDTO>();
			while(rs.next()) {
				MyregDTO dto = new MyregDTO();
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setState(rs.getString("state"));
				dto.setAddress(rs.getString("address"));
				dto.setArea(rs.getString("area"));
				dto.setMaincost(rs.getString("maincost"));
				dto.setDepcost(rs.getString("depcost"));
				dto.setDetailcontent(rs.getString("detailcontent"));
				dto.setCost(rs.getString("cost"));
				dto.setFilename(rs.getString("filename"));
				dto.setSellerconfirm(rs.getString("sellerconfirm"));
				dto.setConsumerconfirm(rs.getString("consumerconfirm"));
				
				
				reglist.add(dto);
			}
			return reglist;
		} catch (Exception e) {
			System.out.println("MemberDAO.myreglist()");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 김찬우
	 * @param seq 로그인 후 세션에 저장된 회원번호
	 * @return ArrayList<MypageDTO> 자신이 선택한 옵션 목록을 저장한 배열
	 * 내가 선택한 옵션들을 반환해주는 메소드
	 */
	public ArrayList<MypageDTO> getoption(String seq) {
		try {
			String sql ="select * from vwoptlist where memseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);

			rs = pstat.executeQuery();
			ArrayList<MypageDTO> optlist = new ArrayList<MypageDTO>();
			while(rs.next()) {
				MypageDTO dto = new MypageDTO();
				
				dto.setOptname(rs.getString("optname"));
				optlist.add(dto);
			}
			return optlist;
		} catch (Exception e) {
			System.out.println("MemberDAO.getoption()");
			e.printStackTrace();
		}
		
		return null;
	}
	/**
	 * 김찬우
	 * 게시글의 상태 저장한 배열 반환하는 메소드
	 * @return
	 */
	public ArrayList<MyregDTO> statlist() {
		try {
		String sql = "select distinct state from tbl_house_post order by state asc";
		
		stat = conn.createStatement();
		
		rs = stat.executeQuery(sql);
		ArrayList<MyregDTO> statlist = new ArrayList<MyregDTO>();
		while(rs.next()) {
			MyregDTO dto = new MyregDTO();
			
			dto.setState(rs.getString("state").equals("0")?"대기":
						rs.getString("state").equals("1")?"신고":
						rs.getString("state").equals("2")?"정상매물":"허위매물");
		 	
			statlist.add(dto);
		}
		return statlist;
		} catch (Exception e) {
			System.out.println("MemberDAO.statlist()");
			e.printStackTrace();
		}
		return null;
	}
		/**
		 * 김찬우
		 * @param seq 게시글번호
		 * @return
		 * 게시글을 눌렀을때 반환되는 게시글 번호로 데이터 반환하는 메소드
		 */
	public MyregDTO getRegHouseInfo(String seq) {
		
		try {
			String sql = "select * from vwmyreg where delflag=0 and postseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			while(rs.next()) {
				MyregDTO dto = new MyregDTO();
				dto.setAddress(rs.getString("address"));
				dto.setArea(rs.getString("area"));
				dto.setCost(rs.getString("cost"));
				dto.setDepcost(rs.getString("depcost"));
				dto.setMaincost(rs.getString("maincost"));
				dto.setHtype(rs.getString("htype"));
				dto.setStype(rs.getString("stype"));
				dto.setState(rs.getString("state").equals("0")?"대기":
					rs.getString("state").equals("1")?"신고":
					rs.getString("state").equals("2")?"정상매물":"허위매물");
				dto.setPostseq(rs.getString("postseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setDetailcontent(rs.getString("detailcontent"));
				dto.setDetailsubject(rs.getString("detailsubject"));
				dto.setDelflag(rs.getString("delflag"));
				return dto;
			}
			
			
		} catch (Exception e) {
			System.out.println("MemberDAO.getRegHouseInfo()");
			e.printStackTrace();
		}
		
		
		return null;
	}

	/**
	 * 김찬우
	 * @param seq
	 * @return
	 * 계약이 완료된 매물의 정보를 반환하는 메소드
	 */
	public ArrayList<contractingDTO> compeletelist(String seq) {
			try {
				String sql = "select rownum, a.* from vwcontractinglist a where (memseq =? or a.sellerseq=?) and consumerconfirm='계약완료' and sellerconfirm='계약완료' order by rownum desc";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, seq);
				pstat.setString(2, seq);
				
				rs= pstat.executeQuery();
				
				ArrayList<contractingDTO> list = new ArrayList<contractingDTO>();
				while(rs.next()) {
					contractingDTO dto = new contractingDTO();
					dto.setPostseq(rs.getString("postseq"));
					dto.setMemseq(rs.getString("memseq"));
					dto.setSubject(rs.getString("subject"));
					dto.setRegdate(rs.getString("regdate").substring(0,10));
					dto.setConsumerconfirm(rs.getString("consumerconfirm"));
					dto.setSellerconfirm(rs.getString("sellerconfirm"));
					dto.setId(rs.getString("id"));
					dto.setRownum(rs.getString("rownum")); 
					dto.setSellerseq(rs.getString("sellerseq"));
					
					
					list.add(dto);
				}
				return list;
			}
			catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
			}
			return null;
	}


	/**
	 * 김찬우
	 * @param postseq
	 * @return
	 * 계약완료된 계약이 완료된 매물의 정보반환하는메소드
	 */
	public completeDTO complete_hinfo(String postseq) {
		try {
		String sql ="select * from vwmyreg where postseq = ?";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1, postseq);
		
		rs = pstat.executeQuery();
		
		
		while(rs.next()) {
			completeDTO dto = new completeDTO();
			dto.setAddress(rs.getString("address"));
			dto.setArea(rs.getString("area"));
			dto.setCost(rs.getString("cost"));
			dto.setDepcost(rs.getString("depcost"));
			dto.setMaincost(rs.getString("Maincost"));
			dto.setFloor(rs.getString("floor"));
			dto.setTotalfloor(rs.getString("totalfloor"));
			dto.setHtype(rs.getString("htype"));
			dto.setStype(rs.getString("stype"));
			dto.setSubject(rs.getString("subject"));
			dto.setPostseq(rs.getString("postseq"));
			dto.setMemseq(rs.getString("memseq"));
			dto.setDetailcontent(rs.getString("detailcontent").replace(". ", ". <br>"));
			dto.setSellerseq(rs.getString("sellerseq"));
			dto.setSellerconfirm(rs.getString("sellerconfirm"));
			dto.setConsumerconfirm(rs.getString("consumerconfirm"));
			
			return dto;
		}
		
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 김찬우
	 * @param postseq
	 * @return
	 * 게시글번호를 받아 해당게시글을 쓴 중개사회원 정보 반환
	 */
	public completeDTO agency_info(String postseq) {
		
		try {
			String sql = "select * from vwmyagency where postseq = ? order by postseq desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, postseq);
			
			rs = pstat.executeQuery();
			
		
			while(rs.next()) {
				completeDTO dto = new completeDTO();
			
			dto.setName(rs.getString("name"));
			dto.setAddress(rs.getString("address"));
			dto.setFilename(rs.getString("filename"));
			dto.setOffice(rs.getString("office"));
			dto.setTel(rs.getString("tel").substring(0,3)
					+"-"+rs.getString("tel").substring(3,6)
					+"-"+rs.getString("tel").substring(6));
			dto.setEmail(rs.getString("email"));
			
			
			return dto;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	/**
	 * 김찬우
	 * @param postseq
	 * @return 이미지 이름이 들어있는 배열
	 * 해당 게시물의 이미지를 반환해주는 메소드
	 */
	public ArrayList<MyregDTO> getimage(String postseq) {
		try {
			String sql = "select * from vwmyregimg where postseq = ? and filename <> 'nopic.jpg'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, postseq);
			
			rs = pstat.executeQuery();
			ArrayList<MyregDTO> list = new ArrayList<MyregDTO>();
			while(rs.next()) {
				MyregDTO dto = new MyregDTO();
				dto.setFilename(rs.getString("filename"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	/**
	 * 김찬우
	 * @param postseq
	 * @return
	 * 매물을 등록할 때 선택한 옵션리스트들을 가져오는 메소드
	 */
	public ArrayList<completeDTO> gethoption(String postseq) {
		try {
			String sql = "select * from vwhouseoption where postseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, postseq);
			
			rs = pstat.executeQuery();
			ArrayList<completeDTO> list = new ArrayList<completeDTO>();
			while(rs.next()) {
				completeDTO dto = new completeDTO();
				
				dto.setOptseq(rs.getString("optseq"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	/**
	 * 김찬우
	 * @param seq
	 * @return
	 * 로그인한 회원번호를 받아 해당 회원이 찜한 리스트를 반환하는 메소드
	 */
	public ArrayList<jjimDTO> getjjim(String seq) {
		try {
			
			String sql = "select * from vwjjim where memseq = ? and imgseq = 1";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,seq);
			
			rs = pstat.executeQuery();
			ArrayList<jjimDTO> list = new ArrayList<jjimDTO>();
			
			while(rs.next()) {
				jjimDTO dto = new jjimDTO();
				dto.setCost(rs.getString("cost"));
				dto.setDepcost(rs.getString("depcost"));
				dto.setImgname(rs.getString("imgfile"));
				dto.setMemseq(rs.getString("memseq"));
				dto.setImgseq(rs.getString("imgseq"));
				dto.setPostseq(rs.getString("postseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setHtype(rs.getString("htype"));
				dto.setStype(rs.getString("stype"));
				dto.setArea(rs.getString("area"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("MemberDAO.getjjim()");
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 김찬우
	 * @param seq
	 * @return
	 * 게시판번호를 받아 그집이 선택한 옵션을 반환해주는 메소드
	 */
	public ArrayList<MyregDTO> getHouseOPT(String seq) {
		try {
			String sql = "select * from vwmyregoption where postseq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			ArrayList<MyregDTO> list = new ArrayList<MyregDTO>();
			while(rs.next()) {
				MyregDTO dto = new MyregDTO();
				dto.setHoption(rs.getString("optname"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	/**
	 * 김찬우
	 * @param seq
	 * @return
	 * 해당 게시물이 갖는 이미지목록을 반환해주는 메소드
	 */
	public ArrayList<MyregDTO> gethouseIMG(String seq) {
		try {
			String sql = "select * from vwmyregimg where postseq = ? and filename <> 'nopic.jpg'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs= pstat.executeQuery();
			ArrayList<MyregDTO> list = new ArrayList<MyregDTO>();
			while(rs.next()) {
				MyregDTO dto = new MyregDTO();
				dto.setFilename(rs.getString("filename"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("MemberDAO.gethouseIMG()");
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 김찬우
	 * @param seq
	 * @return
	 * 모든 옵션목록을 반환해주는 메소드
	 */
	public ArrayList<MypageDTO> getalloption(String seq) {
		try {
			String sql = "select * from tbl_option";
			stat = conn.createStatement();
			
			ArrayList<MypageDTO> list = new ArrayList<MypageDTO>();
			rs = stat.executeQuery(sql);
			while(rs.next()) {
				MypageDTO dto = new MypageDTO();
				
				dto.setOptname(rs.getString("optname"));
				dto.setOptseq(rs.getString("seq"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("MemberDAO.getalloption()");
			e.printStackTrace();
		}
		
		return null;
	}

	   
	 
	/**
	 * 김찬우
	 * @param seq 회원번호
	 * @return 회원번호를 통해 서류를 냇는지 안냇는지 확인
	 */
	public completeDTO paperstate(String seq) {
		
		try {
			String sql = " ";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			completeDTO dto = new completeDTO();
			while(rs.next()) {
				dto.setType(rs.getString("paperstate"));
				
				return dto;
			}
					
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	/**
	 * 김찬우
	 * @param seq 회원번호 
	 * @return 계약 중인 매물 리스트 가져오기
	 */
	public ArrayList<contractingDTO> contractinglist(String seq) {
		try {
			String sql = "select distinct rownum,a.* from vwcontractinglist a where (memseq =? or sellerseq=?) and consumerconfirm<>'계약 완료' and sellerconfirm<>'계약 완료'  order by rownum desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			
			rs= pstat.executeQuery();
			
			ArrayList<contractingDTO> list = new ArrayList<contractingDTO>();
			while(rs.next()) {
				contractingDTO dto = new contractingDTO();
				dto.setPostseq(rs.getString("postseq"));
				dto.setMemseq(rs.getString("memseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setConsumerconfirm(rs.getString("consumerconfirm"));
				dto.setSellerconfirm(rs.getString("sellerconfirm"));
				dto.setId(rs.getString("id"));
				dto.setRownum(rs.getString("rownum"));
				dto.setConseq(rs.getString("conseq"));
//				dto.setFilename(rs.getString("filename"));
				
				list.add(dto);
			}
			return list;
		}
		catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 김찬우
	 * @param seq 로그인한 회원번호
	 * @return sql문이 성공했는지 유무를 반환
	 * 회원 정보를 수정하는 메소드
	 */
	public int mypageEdit(MypageDTO dto) {
		try {
			String sql = "update tbl_member set name=?, pw=?,address=?,email=?,tel=?,marsta=? where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getAddress());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getTel());
			pstat.setString(6, dto.getMarsta());
			pstat.setString(7, dto.getMemseq());
			
			
			return pstat.executeUpdate();
		
			
		} catch (Exception e) {
			System.out.println("MemberDAO.mypageEdit()");
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param seq 로그인한 회원
	 * @return 결과값 반환
	 * 회원 탈퇴시 delflag를 1로 바꾸는 메소드
	 */
	public int bye(String seq) {
		try {
			
			String sql = "update tbl_member set delflag=1 where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
				
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param dto 파일명 받아오기
	 * @return 결과 값 반환
	 * 프로필 사진명을 바꾼다.
	 */
	public int upfile(MyregDTO dto) {
		String sql = "update tbl_member set filename=? where seq=?";
		try {
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,dto.getFilename());
			pstat.setString(2, dto.getMemseq());
			System.out.println("!"+dto.getMemseq());
			System.out.println("!"+dto.getFilename());
			
			return pstat.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	/**
	 * 김찬우
	 * @param seq
	 * @param optseq
	 * @return
	 * 회원번호와 옵션번호로 검색해 결과있는지확인
	 */
	public int optchk(String seq, String optseq) {
		try {
			String sql = "select * from tbl_member_option where delflag=0 and memseq= ? and optseq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,seq);
			pstat.setString(2, optseq);
			int cnt= 0;
			rs =  pstat.executeQuery();
			while (rs.next()) {
				cnt++;
			
			}
			return cnt;
		} catch (Exception e) {
			System.out.println("MemberDAO.optchk()");
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param seq
	 * @param optseq
	 * @return 실행결과
	 * 수정시 선택한 옵션의 delflag가 1일때 0으로바꿔주는 메소드
	 */
	public int upopt(String seq, String optseq) {
		
		try {
			String sql = "update tbl_member_option set delflag=0 where memseq=? and optseq=?";
			
			pstat =conn.prepareStatement(sql);
			
			pstat.setString(1,seq);
			pstat.setString(2, optseq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberDAO.upopt()");
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param seq
	 * @param optseq
	 * @return 실행결과값
	 * 수정 시 선택한 옵션값이 없을 때 옵션을 추가해주는 메소드
	 */
	public int intopt(String seq, String optseq) {
		try {
			String sql = "insert into tbl_member_option values (seq_member_option.nextVal,?,?,0)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			pstat.setString(2, optseq);
			
			return pstat.executeUpdate();
		} catch (Exception e) {
			System.out.println("MemberDAO.intopt()");
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param memseq
	 * @param postseq
	 * @return 실행결과값
	 *  계약 중인지 아닌지 확인하는 메소드
	 */
	public int agreestat(String memseq,String postseq) {
		try {
			String sql = "select * from tbl_house_contact where postseq=? and memseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,memseq);
			pstat.setString(2, postseq);
			rs = pstat.executeQuery();
			int cnt=0;
			while(rs.next()) {
				cnt++;
			}
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param conseq
	 * @return 결과값
	 * 계약이 완료되 승인완료버튼을 눌렀을때 계약이 완료되었다는 상태로 변경해주는 메소드
	 */
	public int agree( String conseq) {
		try {
			System.out.println(conseq+"@");
			String sql = "update tbl_house_contact set consumerconfirm ='계약완료' where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, conseq);
			
			return pstat.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param conseq
	 * @return 실행 결과 값
	 * 계약이 완료되었지만 취소할경우를 위한 승인취소 버튼
	 */
	public int disagree (String conseq) {
		try {
			String sql = "update tbl_house_contact set consumerconfirm ='대기' where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, conseq);
			
			return pstat.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	/**
	 * 김찬우
	 * @return 맞춤추천의 정보가 담긴 arraylist반환
	 * 메인에 나올 맞춤추천서비스를 가져오는 메소드
	 */
	public ArrayList<IndexDTO> recohouse() {
		try {
			
			String sql = "select * from vwrecohouse";
			
			stat = conn.createStatement();
			ArrayList<IndexDTO> list = new ArrayList<IndexDTO>();
			rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				IndexDTO dto = new IndexDTO();
				
				dto.setFilename(rs.getString("filename"));
				dto.setOptseq(rs.getString("optseq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRecomopseq(rs.getString("recomopseq"));
			list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return null;
	}
	/**
	 * 김찬우
	 * @return 대출추천 정보가 들어있는 arraylist
	 * 대출추천 게시판의 정보를 가져오는 메소드
	 */
	public ArrayList<IndexDTO> recoeco() {
		try {
			String sql = "select * from vwrecoeco";
			stat =conn.createStatement();
			ArrayList<IndexDTO> list = new ArrayList<IndexDTO>();
			rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				IndexDTO dto = new IndexDTO();
				
				dto.setFilename(rs.getString("filename"));
				dto.setSubject(rs.getString("subject"));
				dto.setRecomcnt(rs.getString("recomcnt"));
				dto.setReadcnt(rs.getString("readcnt"));
				dto.setRecomopseq(rs.getString("seq"));
				dto.setRegdate(rs.getString("regdate"));
				
			list.add(dto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 김찬우
	 * @return 공지사항 목록
	 * 공지사항 목록을 가져오는 메소드
	 */
	public ArrayList<IndexDTO> notice() {
	 try {
		String sql = "select seq as notseq,subject,regdate from tbl_notice where seq<6";
			
		stat = conn.createStatement();
		
		ArrayList<IndexDTO> list = new ArrayList<IndexDTO>();
		rs = stat.executeQuery(sql);
		
		while(rs.next()) {
			IndexDTO dto = new IndexDTO();
			
			dto.setSubject(rs.getString("subject"));
			dto.setRegdate(rs.getString("regdate").substring(0,10));
			dto.setSeq(rs.getString("notseq"));
		list.add(dto);
		}
		return list;
	} catch (Exception e) {
		e.printStackTrace();
	}
		return null;
	}
	/**
	 * 김찬우
	 * @return qna정보가 담긴 arraylist
	 * 메인 화면에 나올 qna 목록을 가져오는 메소드
	 */
	public ArrayList<IndexDTO> faq() {
		// TODO Auto-generated method stub
		 try {
				String sql = "select rownum, type,subject,f.seq as faqseq,regdate from tbl_faq f join tbl_board_type bt on f.itemseq = bt.seq where rownum<=5";
					
				stat = conn.createStatement();
				
				ArrayList<IndexDTO> list = new ArrayList<IndexDTO>();
				rs = stat.executeQuery(sql);
				
				while(rs.next()) {
					IndexDTO dto = new IndexDTO();
					
					dto.setSubject(rs.getString("subject"));
					dto.setRegdate(rs.getString("regdate").substring(0,10));
					dto.setSeq(rs.getString("faqseq"));
					dto.setType(rs.getString("type"));
				list.add(dto);
				}
				return list;
			} catch (Exception e) {
				e.printStackTrace();
			}
				return null;
			}

	public MypageDTO getid(String seq) {
		try {
			String sql = "select id from tbl_member where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs= pstat.executeQuery();
			MypageDTO dto = new MypageDTO();  
			while(rs.next()) {
				
			}
			
		} catch (Exception e) {
			System.out.println("MemberDAO.getid()");
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 김찬우
	 * @param seq
	 * @return
	 * 문의 팝업 정보
	 */
	public ArrayList<completeDTO> getinqagency(String seq) {
		try {
			String sql = "select rownum,a.* from vwinqpopup a where memseq=? or sellerseq = ? order by regdate desc";
			
			pstat= conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			ArrayList<completeDTO> list = new ArrayList<completeDTO>();
			while(rs.next()) {				
				completeDTO dto = new completeDTO();
				dto.setAddress(rs.getString("address"));
				if(rs.getString("sellertel").length()==9) {
				dto.setSellertel(rs.getString("sellertel").substring(0,2)+"-"+rs.getString("sellertel").substring(2,5)+"-"+rs.getString("sellertel").substring(5));
//				System.out.println(dto.getSellertel());
				}
				else {
					dto.setSellertel(rs.getString("sellertel").substring(0,3)+"-"+rs.getString("sellertel").substring(3,6)+"-"+rs.getString("sellertel").substring(6));
//					System.out.println(dto.getSellertel());
				}
				dto.setOffice(rs.getString("office"));
				dto.setSellername(rs.getString("sellername"));
				dto.setSellerseq(rs.getString("sellerseq"));
				dto.setSeq(rs.getString("memseq"));
				dto.setPostseq(rs.getString("postseq"));
				dto.setMemtype(rs.getString("memtype"));
				dto.setName(rs.getString("memname"));
				dto.setTel(rs.getString("memtel"));
				dto.setContent(rs.getString("inqcontent"));
				dto.setConseq(rs.getString("conseq"));
				dto.setRownum(rs.getString("rownum"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 김찬우
	 * @param seq 판매자 번호
	 * @param postseq 
	 * @return 실행 결과
	 * 문의 번호를 받아 판매자가 상담완료 버튼 눌럿을 시 상태가 상담완료로 바뀜
	 */
	public int conplete(String seq, String postseq) {
		try {
		String sql ="update tbl_house_contact set sellerconfirm='상담완료',consumerconfirm='상담완료' where memseq=? and postseq=?";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1, seq);
		pstat.setString(2, postseq);
		
	    return pstat.executeUpdate();
	 
		} catch (Exception e) {
			System.out.println("MemberDAO.conplete()");
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param postseq
	 * @return sql문 실행 결과
	 * 판매자가 진행 중인 계약을 완료시키는 메소드
	 */
	public int myagree( String conseq) {
		try {
			String sql = "update tbl_house_contact set sellerconfirm ='계약완료' where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, conseq);
			
			return pstat.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 김찬우
	 * @param memseq
	 * @param postseq
	 * @return 실행 결과 값
	 * 계약이 완료되었지만 취소할경우를 위한 승인취소 버튼
	 */
	public int mydisagree(String conseq) {
		try {
			String sql = "update tbl_house_contact set sellerconfirm ='대기' where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, conseq);
			
			return pstat.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	public int myconplete(String conseq) {
		try {
			String sql ="update tbl_house_contact set sellerconfirm='상담완료',consumerconfirm='상담완료' where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, conseq);
			
		    return pstat.executeUpdate();
		 
			} catch (Exception e) {
				System.out.println("MemberDAO.conplete()");
				e.printStackTrace();
			}
			return 0;
	}

	   
	   

}
