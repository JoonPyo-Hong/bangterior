package com.test.house;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.common.DBUtil;
/**
 * 
 * @author 홍준표
 */
/**
 * @author 지현공주
 *
 */
/**
 * @author 지현공주
 *
 */
/**
 * @author 지현공주
 *
 */
public class HouseDAO {
	/**
	 * 재사용 되는 객체 선언
	 */
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	// 돈 가공 처리 123,456원
	DecimalFormat formatter = new DecimalFormat("###,###");
	/**
	 * DB연결
	 */
	public HouseDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	/**
	 * DB연결 끊기
	 */
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
/**
 * 매물 조회페이지 메인기능
 * Ajax를 활용한 페이징, 필터기능, 조회기능 
 * @param 필터기능에 필요한 값 받기
 * @return 매물리스트에 필요한 데이터 반환
 */
	// 매물페이지
	public ArrayList<HouseSearchDTO> HouseSearchlist(HashMap<String, String> map) {

		String mapseq = "";
		if (map.get("mapseq") == null) {
			mapseq = "0";
		} else {
			mapseq = map.get("mapseq");
		}

		String f = "";
		if (map.get("f") == null) {
			f = "";
		} else {
			f = map.get("f");
		}
		String q = f.replace(",undefined", "");
		if (q.contains(",")) {
			q = f.replace(",", " and filter like '%");
			q = q.replace("q", ",%'");
		}
		f = q;
		/* System.out.println(f); */
		f.replace("%1,", "1,");

		String money = "";
		if (map.get("money") == null) {
			money = "0 억 200 억";
		} else {
			money = map.get("money");
		}
		money = money.replace(" ", "");
		String temp[] = money.split("억");
		String money1 = temp[0];
		String money2 = temp[1];
		money1 += "00000000";
		money2 += "00000000";
		if (money1.equals("000000000")) {
			money1 = "0";
		}

		String area = "";
		if (map.get("area") == null) {
			area = "1";

		} else {
			area = map.get("area");
		}

		if (area.equals("1")) {
			area = " >=0";
		} else if (area.equals("2")) {
			area = " <=(10 *3.31)";
		} else if (area.equals("3")) {
			area = " >=(10 *3.31)and area <(20*3.31)";
		} else if (area.equals("4")) {
			area = " >=(20*3.31) and area <(30*3.31)";
		} else if (area.equals("5")) {
			area = " >=(30*3.31) and area < (40*3.31)";
		} else if (area.equals("6")) {
			area = " >=(40*3.31) and area <(50*3.31)";
		} else if (area.equals("7")) {
			area = " >=(50*3.31) and area <(60*3.31)";
		} else if (area.equals("8")) {
			area = " >=(60*3.31)";
		}

		String sae = "";
		if (map.get("sae") == null) {
			sae = "1";

		} else {
			sae = map.get("sae");
		}

		if (sae.equals("1")) {
			sae = "= 1";
		}

		if (sae.equals("2")) {
			sae = "in ('2','3')";

		}

//		System.out.println(map.get("sel"));
		String searchtext = "";
		if (map.get("searchtext") == null) {
			searchtext = "";
		} else {
			searchtext = map.get("searchtext");
		}

		String sort = "";
		if (map.get("sort") == null) {
			sort = "1";
		} else {

			sort = map.get("sort");
		}

		String where = "";
		if (map.get("sel") == null) {
			where = "subject";
		} else if (map.get("sel").equals("1")) {
			where = "subject";
		} else if (map.get("sel").equals("2")) {
			where = "cost";
		} else if (map.get("sel").equals("3")) {
			where = "cost desc";
		} else if (map.get("sel") == null) {
			where = "subject";
		}
		try {

			String sql = String.format(
					"select * from(select p.*,ROWNUM as rnum from (select * from VWHOUSEJOONPYO where address like '%%%s%%' and delflag=0 and sort = %s and sae %s and area %s and cost >= %s and cost <= %s %s order by %s ) p) where rnum>=? and rnum <=? ",
					searchtext, sort, sae, area, money1, money2, f, where);
			sql = sql.replace("and filter = undefined", "");
			if (!mapseq.equals("0")) {
				sql = String.format(
						"select * from(select p.*,ROWNUM as rnum from (select * from VWHOUSEJOONPYO where seq = %s ) p) where rnum>=? and rnum <=?",
						mapseq);
			}

			/* System.out.println(sql); */
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("begin"));
			pstat.setString(2, map.get("end"));

//			System.out.println(map.get("begin"));
//			System.out.println(map.get("end"));
//			int count = 0;
			rs = pstat.executeQuery();

			ArrayList<HouseSearchDTO> list = new ArrayList<HouseSearchDTO>();

			while (rs.next()) {
				HouseSearchDTO dto = new HouseSearchDTO();
//				count ++;
				String co = "";
				String de = "";
				long c = 0;
				long d = 0;

				c = rs.getLong("cost");
				d = rs.getLong("depcost");
				c = c / 10000;
				d = d / 10000;

				co = formatter.format(c);
				de = formatter.format(d);

				dto.setSeq(rs.getInt("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setCost(co);
				dto.setDepcost(de);
				dto.setMaincost(rs.getInt("maincost"));
				dto.setFilename(rs.getString("filename"));
				dto.setArea(rs.getString("area"));
				dto.setFloor(rs.getInt("floor"));
				dto.setType(rs.getString("type"));
//				dto.setSum(formatter.format(count));
//				dto.setTotalnum(count);
				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 페이징에 필요한 총 페이지 수 구현
	 * @param 페이징에 필요한 값 받기
	 * @return 페이징에 필요한 총 페이지 수 반환
	 */
	public int getHouseTotalCount(HashMap<String, String> map) {

		String mapseq = "";
		if (map.get("mapseq") == null) {
			mapseq = "0";
		} else {
			mapseq = map.get("mapseq");
		}

		String f = "";
		if (map.get("f") == null) {
			f = "";
		} else {
			f = map.get("f");
		}
		String q = f.replace(",undefined", "");
		if (q.contains(",")) {
			q = f.replace(",", " and filter like '%");
			q = q.replace("q", ",%'");
		}
		f = q;

		f.replace("%1,", "1,");

		/* System.out.println(f); */

		String money = "";
		if (map.get("money") == null) {
			money = "0 억 200 억";
		} else {
			money = map.get("money");
		}
		money = money.replace(" ", "");
		String temp[] = money.split("억");
		String money1 = temp[0];
		String money2 = temp[1];
		money1 += "00000000";
		money2 += "00000000";
		if (money1.equals("000000000")) {
			money1 = "0";
		}

		String area = "";
		if (map.get("area") == null) {
			area = "1";

		} else {
			area = map.get("area");
		}

		if (area.equals("1")) {
			area = " >=0";
		} else if (area.equals("2")) {
			area = " <=(10 *3.31)";
		} else if (area.equals("3")) {
			area = " >=(10 *3.31)and area <(20*3.31)";
		} else if (area.equals("4")) {
			area = " >=(20*3.31) and area <(30*3.31)";
		} else if (area.equals("5")) {
			area = " >=(30*3.31) and area < (40*3.31)";
		} else if (area.equals("6")) {
			area = " >=(40*3.31) and area <(50*3.31)";
		} else if (area.equals("7")) {
			area = " >=(50*3.31) and area <(60*3.31)";
		} else if (area.equals("8")) {
			area = " >=(60*3.31)";
		}

		String sae = "";
		if (map.get("sae") == null) {
			sae = "1";

		} else {
			sae = map.get("sae");
		}

		if (sae.equals("1")) {
			sae = "= 1";
		}

		if (sae.equals("2")) {
			sae = "in ('2','3')";

		}

		String searchtext = "";
		if (map.get("searchtext") == null) {
			searchtext = "";
		} else {
			searchtext = map.get("searchtext");
		}
		try {

			/*
			 * String sae = ""; if(map.get("sae").equals("1")) { sae = "1"; }else
			 * if(map.get("sae").equals("2")) { sae= "2 or sae = 3"; }else if(map.get("sae")
			 * ==null) { sae="1"; }
			 */

			String sort = "";
			if (map.get("sort") == null) {
				sort = "1";
			} else {

				sort = map.get("sort");
			}

			String sql = String.format(
					"select count(*) from(select p.*,rownum as rnum from (select *  from vwhousejoonpyo where address like '%%%s%%' and sort = %s and sae %s and area %s and cost >= %s and cost <= %s %s)p)",
					searchtext, sort, sae, area, money1, money2, f);
			sql = sql.replace("and filter = undefined", "");
			if (!mapseq.equals("0")) {
				sql = String.format(
						"select count(*) from(select p.*,ROWNUM as rnum from (select * from VWHOUSEJOONPYO where seq = %s ) p)",
						mapseq);
			}

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			int a = 0;
			if (rs.next()) {

				a = rs.getInt(1);
			}
			return a;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	
	/**
	 * 구글 맵 좌표 처리 
	 * @return 구글 맵 좌표 값 반환
	 */
	public ArrayList<HouseSearchDTO> HouseMap() {
		try {
			String sql = "select * from vwhousejoonpyo";
			ArrayList<HouseSearchDTO> maplist = new ArrayList<HouseSearchDTO>();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				HouseSearchDTO dto = new HouseSearchDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setAddress(rs.getString("address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));

				maplist.add(dto);

			}

			return maplist;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 매물 상세 보기 페이지 구현
	 * @param 매물 상세 보기에 필요한 값들 넣기
	 * @return 매물 상세 보기에 필요한 값들 반환
	 */
	public ArrayList<String> HouseDetail(HashMap<String, String> map) {

		ArrayList<String> list = new ArrayList<String>();

		try {
			String sql = "select * from vwdetailjoonpyo where seq = ? order by fileseq";
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, map.get("seq"));

			rs = pstat.executeQuery();

			int control = 0;
			while (rs.next()) {

				control++;
				if (control == 1) {
					list.add(rs.getString("seq"));
					list.add(rs.getString("subject"));
					long a = rs.getLong("cost");
					a = a / 10000;
					String a1 = "";
					a1 += formatter.format(a);
					list.add(a1);
					long b = rs.getLong("depcost");
					b = b / 10000;
					String b1 = "";
					b1 += formatter.format(b);
					list.add(b1);
					long c = rs.getLong("maincost");
					c = c / 10000;
					String c1 = "";
					c1 += formatter.format(c);

					list.add(c1);
					list.add(rs.getString("area"));
					list.add(rs.getString("floor"));
					list.add(rs.getString("address"));
					list.add(rs.getString("type"));
					list.add(rs.getString("detailsubject"));
					list.add(rs.getString("detailcontent"));
					list.add(rs.getString("lng"));
					list.add(rs.getString("lat"));
					list.add(rs.getString("totalfloor"));
					list.add(rs.getString("tel"));
					list.add(rs.getString("name"));
					list.add(rs.getString("typeseq"));
				}
				list.add(rs.getString("filename"));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	/**
	 * 매물 상세보기 페이지에서 업체 or 회원 인지에 따라 select 다르게 구현
	 * @param 매물 상세보기에 필요한 값 넣기
	 * @return 매물 상세보기에 필요한 값 반환
	 */
	public ArrayList<String> Budongsan(HashMap<String, String> map) {
		ArrayList<String> list = new ArrayList<String>();

		try {
			String sql = "";
			if (map.get("memseq").equals("1")) {
				sql = "select b.email as titlename,b.address,b.name,b.tel,b.filename from TBL_HOUSE_POST a inner join TBL_MEMBER b on a.MEMSEQ = b.seq where b.memtype=1 and a.seq = ?";
			} else {
				sql = "select c.name as titlename ,c.address,b.name,c.tel,b.filename from TBL_HOUSE_POST a inner join TBL_MEMBER b on a.MEMSEQ = b.seq inner join TBL_AGENCY_INFO c on b.seq = c.memseq where a.seq = ?";
			}

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("seq"));

			rs = pstat.executeQuery();

			while (rs.next()) {
				list.add(rs.getString("titlename"));
				list.add(rs.getString("address"));
				list.add(rs.getString("name"));
				list.add(rs.getString("tel"));
				list.add(rs.getString("filename"));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 일반회원인지 업체회원인진 반환을 위한 값 
	 * @param 일반회원인지 업체회원인진 반환을 위한 값 받기
	 * @return 일반회원인지 업체회원인진 반환을 위한 값 반환
	 */
	public String Memseq(HashMap<String, String> map) {
		try {
			String sql = "select * from TBL_HOUSE_POST a inner join TBL_MEMBER b on a.MEMSEQ = b.seq where a.seq =?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("seq"));

			rs = pstat.executeQuery();
			String memtype = "";
			while (rs.next()) {
				memtype = rs.getString("memtype");
			}

			return memtype;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 막대 그래프
	 * @param 막대 그래프 필요한 값 받기
	 * @return 막대 그래프 필요한 값 반환
	 */
	public HashMap<Integer, String> graph(HashMap<String, String> map) {
		try {
			
			HashMap<Integer, String> list2 = new HashMap<Integer, String>();
			String sql = "select SUBSTR(regdate, 2, 1)as regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = ?  and address like '%' || ? || '%' group by regdate order by regdate";
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, map.get("typeseq"));
			pstat.setString(2, map.get("graphadress"));
			rs = pstat.executeQuery();

			while (rs.next()) {
				double a = rs.getLong("avg");
				a = a /100000000;
			
				String a1= "";
				a1 = String.format("%.2f", a);
			
				list2.put(rs.getInt("regdate"), a1);

			}

			for (int i = 1; i <= 8; i++) {
				if (list2.get(i) == null) {
					for (int j = i; j <= 8; j++) {
						if (list2.get(j) != null) {
							list2.put(i, list2.get(j));
							break;
						}
					}
				} 
			}
			for (int i = 1; i <= 8; i++) {
				if (list2.get(i) == null) {
					for (int j = 1; j <= 8; j++) {
						if (list2.get(j) != null) {
							list2.put(i, list2.get(j));
						}
					}
				} 
			}


			

			return list2;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 막대 그래프(평균)
	 * @param 막대 그래프(평균) 필요한 값 받기
	 * @return 막대 그래프(평균) 필요한 값 반환
	 */
	public HashMap<Integer, String> graphavg(HashMap<String, String> map) {
		try {
			
			HashMap<Integer, String> list2 = new HashMap<Integer, String>();
			String sql = "select SUBSTR(regdate, 2, 1)as regdate, round(avg(cost)) as avg from vwseemarketprice where address like '%' || ? || '%' group by regdate order by regdate";
			pstat = conn.prepareStatement(sql);

		
			pstat.setString(1, map.get("graphadress"));
			rs = pstat.executeQuery();

			while (rs.next()) {
				double a = rs.getLong("avg");
				a = a /100000000;
			
				String a1= "";
				a1 = String.format("%.2f", a);
			
				list2.put(rs.getInt("regdate"), a1);
			}
			
			for (int i = 1; i <= 8; i++) {
				if (list2.get(i) == null) {
					for (int j = i; j <= 8; j++) {
						if (list2.get(j) != null) {
							list2.put(i, list2.get(j));
							break;
						}
					}
				} 
			}
			for (int i = 1; i <= 8; i++) {
				if (list2.get(i) == null) {
					for (int j = 1; j <= 8; j++) {
						if (list2.get(j) != null) {
							list2.put(i, list2.get(j));
						}
					}
				} 
			}


			

			return list2;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 분선표 구현
	 * @param 분선표에 필요한 값 받기
	 * @return 분선표에 필요한 값 반환
	 */
	public ArrayList<String> dopyo(HashMap<String, String> map) {
		try {
			String sql = "select b.score,c.itemname from TBL_HOUSE_POST a inner join TBL_FINAL_SCORE b on a.seq = b.pseq inner join  TBL_OPTION_SCORE c on b.itemseq = c.seq where a.seq=? order by c.itemname";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("seq"));
			ArrayList<String> list = new ArrayList<String>();
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				list.add(rs.getString("score"));
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 분선표(평균) 구현
	 * @param 분선표(평균)에 필요한 값 받기
	 * @return 분선표(평균)에 필요한 값 반환
	 */
	public ArrayList<String> dopyoavg(HashMap<String, String> map) {
		try {
			String sql = "select avg(b.score) as score, c.itemname from TBL_HOUSE_POST a inner join TBL_FINAL_SCORE b on a.seq = b.pseq inner join  TBL_OPTION_SCORE c on b.itemseq = c.seq INNER join TBL_HOUSE_BASIC d on a.hbasseq = d.seq INNER join TBL_HOUSE_INFO e on d.hinfoseq =e.seq where e.address like '%' || ? || '%' GROUP by c.itemname";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("graphadress"));
			ArrayList<String> list = new ArrayList<String>();
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				String a =String.format("%.2f", rs.getDouble("score"));
				list.add(a);
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 하트 처리에 필요한 매물의 번호 반환
	 * @param 매물번호반환에 필요한 값 받기
	 * @return 매물번호 반환
	 */
	public ArrayList<String> househeart(String memseq) {
		try {
			String sql = "select DISTINCT a.seq as pseq , b.seq as mseq, b.delflag from TBL_HOUSE_POST a inner join TBL_HEART b on a.seq = b.postseq inner join TBL_MEMBER c on b.memseq = c.seq  where b.delflag=0 and b.memseq = ?  order by a.seq ";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memseq);
			ArrayList<String> list = new ArrayList<String>();
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				list.add(rs.getString("pseq"));
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 해당 게시글 클릭 했을때 하트 delflag 1로 바꾸게 구현
	 * @param 하트 x 에 필요한 값 받기
	 */
	public void heartdel(HashMap<String, String> map) {
		try {
			String sql = "update TBL_HEART set delflag = '1' where memseq= ? and postseq = ? ";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("memseq"));
			pstat.setString(2, map.get("heartdel"));
			
		 pstat.executeUpdate();
			

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 하트 눌렀을떄 insert 구현
	 * @param 하트 추가에 필요한 값 받기
	 */
	public void heartAdd(HashMap<String, String> map) {
		try {
			String sql = "insert INTO tbl_heart VALUES (SEQ_HEART.nextval,?,?,DEFAULT)";
			pstat = conn.prepareStatement(sql);
			int a = Integer.parseInt(map.get("memseq"));
			int b = Integer.parseInt(map.get("heartdel"));
			pstat.setInt(1, a);
			pstat.setInt(2, b);
			
		 pstat.executeUpdate();
			

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * Ajax -> 회원번호 + 매물번호 일때 하트 눌렸는지 확인해서 상태에 맞게 하트 표시 구현
	 * @param 하트표시에 필요한 값 받기
	 * @return 하트표시에 필요한 값 반환
	 */
	public int heartget(HashMap<String, String> map) {
		try {
			String sql = "select DISTINCT a.seq as pseq , b.seq as mseq, b.delflag from TBL_HOUSE_POST a inner join TBL_HEART b on a.seq = b.postseq inner join TBL_MEMBER c on b.memseq = c.seq  where b.delflag=0 and b.memseq =? and a.seq =?  order by a.seq ";
			int num =0;
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("memseq"));
			pstat.setString(2, map.get("get"));
			
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
			num++;	
			}

			return num;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 문의하기 insert 구현
	 * @param 문의하기에 필요한 값 받기
	 */
	public void infoget(HashMap<String, String> map) {
		try {
			String sql = "insert into TBL_HOUSE_CONTACT VALUES (SEQ_HOUSE_CONTACT.nextval,?,?,?,'대기','대기',DEFAULT) ";
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, Integer.parseInt(map.get("memseq")));
			pstat.setInt(2, Integer.parseInt(map.get("seq")));
			pstat.setString(3, map.get("txt"));
			
			pstat.executeUpdate();
			
		

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 세션으로 seq만 받는 가정하에 이름 가져올수 있게 구현
	 * @param 이름 가져오기 필요한값 넣기
	 * @return 이름 가져오기 반환값
	 */
	public String selectname(String memseq) {
		try {
			String sql = "select name from TBL_MEMBER where seq = ? ";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memseq);
		
			
			
			rs = pstat.executeQuery();
			String name = "";
			while (rs.next()) {
				name = rs.getString("name");
			}

			return name;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 신고하기 기능 구현
	 * @param 신고하기 기능 구현에 필요한 값 받기
	 */
	public void Singo(HashMap<String, String> map) {
		try {
			String sql = "insert into tbl_false_house_report VALUES(SEQ_FALSE_HOUSE_REPORT.nextval,?,?,?,sysdate,'대기',DEFAULT) ";
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, Integer.parseInt(map.get("memseq")));
			pstat.setInt(2, Integer.parseInt(map.get("seq")));
			pstat.setString(3, map.get("txt"));
			
			pstat.executeUpdate();
			
		

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 선그래프에 필요한 값 가져오기
	 * @param 선그래프에 필요한 값 받기
	 * @return 선그래프에 필요한 값 반환
	 */
	public HashMap<Integer, String> typegraph(HashMap<String, String> map) {
try {
			
			HashMap<Integer, String> list2 = new HashMap<Integer, String>();
			String sql = "select SUBSTR(regdate, 2, 1)as regdate, round(avg(cost)) as avg from vwseemarketprice where stseq = ?  and address like '%' || ? || '%' group by regdate";
			pstat = conn.prepareStatement(sql);
			/*
			 * System.out.println(sql); System.out.println(map.get("num"));
			 * System.out.println(map.get("graphadress"));
			 */
			pstat.setString(1, map.get("num"));
			pstat.setString(2, map.get("graphadress"));
			rs = pstat.executeQuery();

			while (rs.next()) {
				double a = rs.getLong("avg");
				a = a /100000000;
			
				String a1= "";
				a1 = String.format("%.2f", a);
			
				list2.put(rs.getInt("regdate"), a1);

			}

			for (int i = 1; i <= 8; i++) {
				if (list2.get(i) == null) {
					for (int j = i; j <= 8; j++) {
						if (list2.get(j) != null) {
							list2.put(i, list2.get(j));
							break;
						}
					}
				} 
			}
			for (int i = 1; i <= 8; i++) {
				if (list2.get(i) == null) {
					for (int j = 1; j <= 8; j++) {
						if (list2.get(j) != null) {
							list2.put(i, list2.get(j));
						}
					}
				} 
			}


			

			return list2;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * HOT 매물에서 하트표시 처리 구현
	 * @param 하트표시에 필요한 값 받기
	 * @return 하트표시에 필요한 값 반환
	 */
	public int hotheart(String seq, int i) {
		try {
			String sql = "select DISTINCT a.seq as pseq , b.seq as mseq, b.delflag from TBL_HOUSE_POST a inner join TBL_HEART b on a.seq = b.postseq inner join TBL_MEMBER c on b.memseq = c.seq  where b.delflag=0 and b.memseq =? and a.seq =?  order by a.seq ";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setInt(2, i);
		
			
			
			rs = pstat.executeQuery();
			int a= 0;
			while (rs.next()) {
				a++;
			}

			return a;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	/*
	 * 백지현
	 * 인테리어 견적 상담을 위한 방정보 알아오는 메소드
	 */
	public HouseSearchDTO getHouseInfo(String roomseq) {
		
		try {
			String sql = "select * from vwForInteriorProudctinfo where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, roomseq);
			rs =pstat.executeQuery();
			
			HouseSearchDTO hsdto = new HouseSearchDTO();
			if(rs.next()) {
				hsdto.setSeq(rs.getInt("seq"));
				hsdto.setArea(rs.getString("area"));
				hsdto.setSubject(rs.getString("subject"));
				hsdto.setFilename(rs.getString("mainimg"));
				return hsdto;
			}
			
		} catch (Exception e) {
			System.out.println("HouseDAO.getHouseInfo()");
			e.printStackTrace();
		}
		return null;
	}



}
