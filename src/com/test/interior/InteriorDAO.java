package com.test.interior;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.common.DBUtil;
import com.test.company.CompanyDTO;
import com.test.company.ProductDTO;

public class InteriorDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public InteriorDAO() {

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

	public ArrayList<RegionDTO> region() {

		try {
			String sql = "select * from tbl_region";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<RegionDTO> reglist = new ArrayList<RegionDTO>();
			while (rs.next()) {
				RegionDTO rdto = new RegionDTO();

				rdto.setSeq(rs.getString("seq"));
				rdto.setName(rs.getString("name"));
				rdto.setDeflag(rs.getString("delflag"));
				reglist.add(rdto);
			}
			return reglist;
		} catch (Exception e) {
			System.out.println("InteriorDAO.region()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ServiceDTO> service() {

		try {

			String sql = "select * from tbl_service";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<ServiceDTO> serlist = new ArrayList<ServiceDTO>();
			while (rs.next()) {
				ServiceDTO sdto = new ServiceDTO();

				sdto.setSeq(rs.getString("seq"));
				sdto.setName(rs.getString("name"));
				sdto.setDelflag(rs.getString("delflag"));
				serlist.add(sdto);
			}
			return serlist;
		} catch (Exception e) {
			System.out.println("InteriorDAO.service()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<CompanyDTO> allCompanyInfo() {

		try {

			String sql = "select * from tbl_company";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<CompanyDTO> comlist = new ArrayList<CompanyDTO>();
			while (rs.next()) {
				CompanyDTO cdto = new CompanyDTO();

				cdto.setSeq(rs.getString("seq"));
				cdto.setName(rs.getString("name"));
				cdto.setIntro(rs.getString("intro").replace("\\r\\n", "<br>"));
				cdto.setPic(rs.getString("pic"));

				comlist.add(cdto);
			}
			return comlist;
		} catch (Exception e) {
			System.out.println("InteriorDAO.allCompanyInfo()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ProductDTO> newpro(String seq) {

		try {

			String sql = "select rownum as rnum, a.* from (select * from tbl_product where serseq = ? order by regdate desc) a ";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			ArrayList<ProductDTO> plist = new ArrayList<ProductDTO>();

			while (rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setMainimg(rs.getString("mainimg"));
				pdto.setSubject(rs.getString("subject"));
				pdto.setCost(rs.getString("cost"));
				plist.add(pdto);
			}
			return plist;
		} catch (Exception e) {
			System.out.println("InteriorDAO.newpro()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<StarDTO> calcStar(HashMap<Integer, String> map) {

		try {
			String sql = "select sum(multi) as multiSum,sum(cnt) as cntSum, sum(multi)/sum(cnt) as avg from (select count(*) as cnt,star,count(*)*star as multi from vwinterior_review where comseq =? group by star) ";
			pstat = conn.prepareStatement(sql);

			ArrayList<StarDTO> starlist = new ArrayList<StarDTO>();
			for (int i = 0; i < map.size(); i++) {
				pstat.setString(1, map.get(i));
				rs = pstat.executeQuery();
				StarDTO sdto = new StarDTO();
				if (rs.next()) {
					sdto.setMultisum(rs.getString("multisum"));
					sdto.setCntsum(rs.getString("cntsum"));
					sdto.setAvg(rs.getString("avg"));
					starlist.add(sdto);
				}
			}
			return starlist;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public ArrayList<CompanyDTO> allCompanyPage(String begin, String end) {
		try {

			String sql = "select a.*,rownum as rnum from (select * from tbl_company) a where rownum >=? and rownum <=? ";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,begin);
			pstat.setString(1,end);
			rs = pstat.executeQuery();
					

			ArrayList<CompanyDTO> comlist = new ArrayList<CompanyDTO>();
			while (rs.next()) {
				CompanyDTO cdto = new CompanyDTO();
				cdto.setSeq(rs.getString("seq"));
				cdto.setName(rs.getString("name"));
				cdto.setIntro(rs.getString("intro").replace(".", ".<br>").replace("\\r\\n", "<br>"));
				cdto.setPic(rs.getString("pic"));

				comlist.add(cdto);
			}
			return comlist;
		} catch (Exception e) {
			System.out.println("InteriorDAO.allCompanyInfo()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ProductDTO> bestProductByService() {
		
		try {
			
			String sql = "select  a.* from (select * from vwproduct where serseq =? order by seq asc) a where rownum=1";
			pstat = conn.prepareStatement(sql);
			ArrayList<ProductDTO> plist = new ArrayList<ProductDTO>();
			for(int i=1; i<=4; i++) {
				pstat.setInt(1, i);
				rs = pstat.executeQuery();
				if(rs.next()) {
					ProductDTO pdto = new ProductDTO();
					pdto.setSeq(rs.getString("seq"));
					pdto.setSerseq(rs.getString("serseq"));
					pdto.setSername(rs.getString("sername"));
					pdto.setCost(rs.getString("cost"));
					pdto.setSubject(rs.getString("subject"));
					pdto.setMainimg(rs.getString("mainimg"));
					
					plist.add(pdto);
				}
			}
			return plist;
		} catch (Exception e) {
			System.out.println("InteriorDAO.bestProductByService()");
			e.printStackTrace();
		}
		return null;
	}
}
