package guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import db.DBClose;
import db.DBOpen;
import jdk.nashorn.internal.ir.SetSplitState;
public class GuestDAO {

	public String getName(String id) {
		String name="";
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select mname from member where id=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				name=rs.getString("mname");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
	
		
		return name;
		
	}
	
	public boolean create(GuestDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guest(num, name, content, created) ");
		sql.append(" values((select nvl(max(num),0)+1 bbsno from guest),?,?,sysdate) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);

		}

		return flag;

	}

	public GuestDTO read(int num) {
		GuestDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select name, content, created ");
		sql.append(" from guest ");
		sql.append(" where num = ?  ");

		try {

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {

				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;

	}

	public boolean update(GuestDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update guest  ");
		sql.append(" set content = ? , created = ? ");
		sql.append(" where num = ? ");

		try {

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getCreated());
			pstmt.setInt(3, dto.getNum());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		} finally {

			DBClose.close(con, pstmt);

		}

		return flag;

	}

	public boolean delete(int num) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from guest ");
		sql.append(" where num = ?  ");

		try {

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		} finally {

			DBClose.close(con, pstmt);

		}

		return flag;

	}

	public List<GuestDTO> list(Map map) {

		List<GuestDTO> list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select num, name, content, to_char(created, 'yyyy-mm-dd')created  ");
		sql.append("from guest");

		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {

				GuestDTO dto = new GuestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				list.add(dto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;

	}
	public int total(Map map) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		String col = (String) map.get("col");
		String word = (String) map.get("word");

		sql.append(" select count(*) as cnt from guest   ");
		if (word.trim().length() > 0) {
			sql.append("  where " + col + " like '%'||?||'%'  ");
		}
		try {

			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) {
				pstmt.setString(1, word);
			}

			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return total;

	}

}