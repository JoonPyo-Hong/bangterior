package com.test.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import com.test.common.DBUtil;

public class CompanyDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public CompanyDAO() {

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

	/**
	 * 백지현 로그인 시 id,pw가 일치하는지 검사하는 메소드
	 * 
	 * @param dto 로그인시 입력받은 id,pw가 들어있는 CompanyDTO
	 * @return id,pw가 일치하는 값이 DB에 있으면 1을 return
	 */
	public int companyLogin(CompanyDTO dto) {

		try {

			String sql = "select count(*) as cnt from tbl_Company where id=? and pw=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("CompanyDAO.companyLogin()");
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 백지현 로그인시 업체의 seq값을 세션에 저장하기 위해 얻어오는 메소드
	 * 
	 * @param id 로그인시 입력받은 id값
	 * @return 입력받은 id에 해당되는 seq값을 return
	 */
	public String getCompanySeq(String id) {

		try {

			String sql = "select seq from tbl_Company where id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("seq");
			}
		} catch (Exception e) {
			System.out.println("CompanyDAO.getCompanySeq()");
			e.printStackTrace();
		}
		return null;
	}

	public CompanyDTO companyInfo(String seq) {

		try {

			String sql = "select * from tbl_Company where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {
				Calendar cal = Calendar.getInstance();
				CompanyDTO dto = new CompanyDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setIntro(rs.getString("intro").replace(".", ".<br>").replace("\\r\\n", "<br>"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setNoticnt(rs.getString("noticnt"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				dto.setPic(rs.getString("pic"));
				dto.setConfirm(rs.getString("confirm"));
				dto.setYear(rs.getString("year").substring(0, 4));
				dto.setDelflag(rs.getString("delflag"));
				dto.setCeoname(rs.getString("ceoname"));
				int career = cal.get(Calendar.YEAR) - (Integer.parseInt(rs.getString("year").substring(0, 4)));
				dto.setCareer(career);
				return dto;
			}

		} catch (Exception e) {
			System.out.println("CompanyDAO.companyInfo()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<PossibleServiceDTO> possibleservice(String seq) {
		try {

			String sql = "select * from vwPossible_service where comseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<PossibleServiceDTO> serlist = new ArrayList<PossibleServiceDTO>();
			while (rs.next()) {
				PossibleServiceDTO psdto = new PossibleServiceDTO();

				psdto.setComseq(rs.getString("comseq"));
				psdto.setSerseq(rs.getString("serseq"));
				psdto.setComname(rs.getString("comname"));
				psdto.setSername(rs.getString("sername"));
				serlist.add(psdto);
			}
			return serlist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.possibleservice()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ProductDTO> productInfo(String seq) {

		try {

			String sql = "select * from vwproduct where comseq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			while (rs.next()) {

				ProductDTO pdto = new ProductDTO();

				pdto.setSeq(rs.getString("seq"));
				pdto.setComseq(rs.getString("comseq"));
				pdto.setSerseq(rs.getString("serseq"));
				pdto.setMainimg(rs.getString("mainimg"));
				pdto.setDetailimg(rs.getString("detailimg"));
				pdto.setSubject(rs.getString("subject"));
				pdto.setCost(rs.getString("cost"));
				pdto.setRegdate(rs.getString("regdate"));
				pdto.setDelflag(rs.getString("delflag"));

				list.add(pdto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("CompanyDAO.productInfo()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<PossibleRegionDTO> possibleregion(String seq) {
		try {

			String sql = "select * from vwPossible_region where comseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<PossibleRegionDTO> reglist = new ArrayList<PossibleRegionDTO>();
			while (rs.next()) {
				PossibleRegionDTO prdto = new PossibleRegionDTO();

				prdto.setComseq(rs.getString("comseq"));
				prdto.setRegseq(rs.getString("regseq"));
				prdto.setComname(rs.getString("comname"));
				prdto.setRegname(rs.getString("regname").substring(0, 2));
				System.out.println(prdto.getRegname());

				reglist.add(prdto);
			}
			return reglist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.possiblregion()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ProductThemeDTO> productTheme(String seq) {

		try {

			String sql = "select * from vwproduct_theme where proseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<ProductThemeDTO> ptlist = new ArrayList<ProductThemeDTO>();
			while (rs.next()) {
				ProductThemeDTO ptdto = new ProductThemeDTO();

				ptdto.setProseq(rs.getString("proseq"));
				ptdto.setTheseq(rs.getString("theseq"));
				ptdto.setThename(rs.getString("thename"));

				ptlist.add(ptdto);
			}
			return ptlist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.productTheme()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ProductDTO> productService(String seq) {

		try {

			String sql = "select seq,comseq,serseq,(select name from tbl_service where seq=a.serseq) as sername from tbl_product a where seq=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<ProductDTO> pslist = new ArrayList<ProductDTO>();
			if (rs.next()) {
				ProductDTO pdto = new ProductDTO();

				pdto.setSername(rs.getString("sername"));

				pslist.add(pdto);
			}
			return pslist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.productService()");
			e.printStackTrace();
		}
		return null;
	}

	public ProductDTO productOneInfo(String seq) {
		try {
			String sql = "select * from vwproduct where seq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();

			if (rs.next()) {
				ProductDTO pdto = new ProductDTO();

				pdto.setSeq(rs.getString("seq"));
				pdto.setComseq(rs.getString("comseq"));
				pdto.setComname(rs.getString("comname"));
				pdto.setSerseq(rs.getString("serseq"));
				pdto.setSername(rs.getString("sername"));
				pdto.setCost(rs.getString("cost"));
				pdto.setMainimg(rs.getString("mainimg"));
				pdto.setDetailimg(rs.getString("detailimg"));
				pdto.setSubject(rs.getString("subject"));
				pdto.setRegdate(rs.getString("regdate"));
				pdto.setDelflag(rs.getString("delflag"));

				return pdto;
			}
		} catch (Exception e) {
			System.out.println("CompanyDAO.productOneInfo()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ThemeDTO> allTheme() {

		try {
			String sql = "select * from tbl_theme";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<ThemeDTO> tlist = new ArrayList<ThemeDTO>();
			while (rs.next()) {
				ThemeDTO tdto = new ThemeDTO();
				tdto.setSeq(rs.getString("seq"));
				tdto.setName(rs.getString("name"));
				tdto.setDelflag(rs.getString("delflag"));

				tlist.add(tdto);
			}
			return tlist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.allTheme()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ColorDTO> allColor() {
		try {
			String sql = "select * from tbl_color";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<ColorDTO> clist = new ArrayList<ColorDTO>();
			while (rs.next()) {
				ColorDTO cdto = new ColorDTO();
				cdto.setSeq(rs.getString("seq"));
				cdto.setColor(rs.getString("color"));
				cdto.setDelflag(rs.getString("delflag"));

				clist.add(cdto);
			}
			return clist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.allColor()");
			e.printStackTrace();
		}
		return null;
	}

	public int insertProduct(HashMap<String, String> pmap) {
		try {
			String sql = "insert into tbl_product values (seq_product.nextval,?,?,?,?,?,?,default,default)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, pmap.get("seq"));
			pstat.setString(2, pmap.get("pser"));
			pstat.setString(3, pmap.get("pcost"));
			pstat.setString(4, pmap.get("thumb_file"));
			pstat.setString(5, pmap.get("detail_file"));
			pstat.setString(6, pmap.get("thumb_title"));

			return pstat.executeUpdate();
		} catch (Exception e) {
			System.out.println("CompanyDAO.insertProduct()");
			e.printStackTrace();

		}
		return 0;
	}

	public ArrayList<PossibleColorDTO> productColor(String seq) {
		try {

			String sql = "select * from vwPossible_color where proseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<PossibleColorDTO> pclist = new ArrayList<PossibleColorDTO>();
			while (rs.next()) {
				PossibleColorDTO pcdto = new PossibleColorDTO();

				pcdto.setProseq(rs.getString("proseq"));
				pcdto.setColseq(rs.getString("colseq"));
				pcdto.setColname(rs.getString("colname"));

				pclist.add(pcdto);
			}
			return pclist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.productColor()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ReviewDTO> getReview(String seq) {

		try {

			String sql = "select * from vwInterior_review where proseq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();

			ArrayList<ReviewDTO> revlist = new ArrayList<ReviewDTO>();
			while (rs.next()) {
				ReviewDTO rdto = new ReviewDTO();
				rdto.setSeq(rs.getString("seq"));
				rdto.setMemseq(rs.getString("memseq"));
				rdto.setMemname(rs.getString("memname"));
				rdto.setProseq(rs.getString("proseq"));
				rdto.setSername(rs.getString("sername"));
				rdto.setComname(rs.getString("comname"));
				rdto.setContent(rs.getString("content"));
				rdto.setRegdate(rs.getString("regdate").substring(0, 11).replace("-", "/"));
				rdto.setStar(rs.getString("star"));

				revlist.add(rdto);

				System.out.println(rdto.getSeq());
			}
			return revlist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.getReview()");
			e.printStackTrace();

		}
		return null;
	}

	public ArrayList<ReviewDTO> starCnt(String seq) {

		try {

			String sql = "select lv as star, nvl(cnt, 0) as cnt from (select level lv from dual connect by level <= 5) a left outer join (select count(*) as cnt,star from vwInterior_review where proseq=? group by star) b on a.lv = b.star order by star desc";
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			rs = pstat.executeQuery();

			ArrayList<ReviewDTO> starlist = new ArrayList<ReviewDTO>();
			while (rs.next()) {
				ReviewDTO rdto = new ReviewDTO();
				rdto.setStarCnt(rs.getString("cnt"));
				rdto.setStar(rs.getString("star"));
				starlist.add(rdto);

			}

			return starlist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.starCnt()");
			e.printStackTrace();

		}
		return null;
	}

	public ArrayList<MyHeartRoomDTO> myheartroom(String seq) {
		
		try {
			String sql = "select * from vwMyHeartRoom where memseq=?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			rs =pstat.executeQuery();
			ArrayList<MyHeartRoomDTO> mhrlist = new ArrayList<MyHeartRoomDTO>();
			
			while(rs.next()) {
				MyHeartRoomDTO mhrdto = new MyHeartRoomDTO();
				mhrdto.setSeq(rs.getString("seq"));
				mhrdto.setMemseq(rs.getString("memseq"));
				mhrdto.setPostseq(rs.getString("postseq"));
				mhrdto.setMainimg(rs.getString("mainimg"));
				mhrdto.setSubject(rs.getString("subject"));
				mhrdto.setCost(rs.getString("cost"));
				
				mhrlist.add(mhrdto);
			}
			return mhrlist;
		} catch (Exception e) {
			System.out.println("CompanyDAO.myheartroom()");
			e.printStackTrace();
		}
		return null;
	}


}
