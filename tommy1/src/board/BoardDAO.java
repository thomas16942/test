package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import board.BoardDTO;
import board.BoardDTO;
import db.DBClose;
import db.DBOpen;

public class BoardDAO {
    
	public int total(Map map){
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");


		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member  ");
		if(word.trim().length()>0)
		sql.append(" where "+col+" like '%'||?||'%'  ");

		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
			pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
			   total = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}


		return total; 

	}
	
	
	
	
	public List<BoardDTO> list(Map map){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("  SELECT  num, name, title, title2, content, tag, date2, viewcnt, wdate,fname, grpno, indent, ansnum, r	  ");
		sql.append("  from(  ");
		sql.append("  	SELECT  num, name, title, title2, content, tag, date2, viewcnt, wdate, grpno, fname, indent, ansnum, rownum r  ");
		sql.append("  	from(  ");
		sql.append("      SELECT  num, name, title, title2, content, tag, date2,  viewcnt, grpno, fname, indent, ansnum,  ");
		sql.append("      to_char(wdate, 'yyyy-mm-dd') wdate  ");
		sql.append("      FROM board  ");
		
		if(word.trim().length()>0)   //trim은 빈공간을 줄이는 메소드
			sql.append("    where "+col+" like '%'||?||'%' ");
		
		sql.append(" 	ORDER BY grpno DESC, ansnum   ");
		
		sql.append("        )  ");
		sql.append("    )  ");
		sql.append("  where r >= ? and r <=  ?  ");

		
		try {
			pstmt = con.prepareStatement(sql.toString());
	
			int i = 0;
			
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setTitle2(rs.getString("title2"));
				dto.setTag(rs.getString("tag"));
				dto.setDate2(rs.getString("date2"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFname(rs.getString("fname"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));

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

	}


	

	

