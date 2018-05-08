package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;
public class MemoDAO {
	
	public boolean checkRefnum(int memono){
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		 
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum)  from memo ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int cnt = rs.getInt(1);
				if(cnt>0) flag = true;
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
			
		} return flag;

		

	}
	
	public int total(Map map){
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from memo ");
		if(word.trim().length()>0)		
		sql.append(" where " + col + " like '%'||?||'%' ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return total;
		
	}
	
    public boolean createReply(MemoDTO dto){
       boolean flag = false;
       
       Connection con = DBOpen.open();
       PreparedStatement pstmt = null;
       
       StringBuffer sql = new StringBuffer();
       sql.append(" insert into memo ");
       sql.append(" (memono, title, content, wdate, grpno, indent, ansnum, refnum ) ");
       sql.append(" values((SELECT NVL(MAX(memono), 0)+1 as memono FROM memo),  ");
       sql.append("  ?,?,sysdate,?,?,?,?) ");

       try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getContent());
		pstmt.setInt(3, dto.getGrpno());
		pstmt.setInt(4, dto.getIndent()+1);
		pstmt.setInt(5, dto.getAnsnum()+1);
		pstmt.setInt(6, dto.getMemono());
		
		int cnt = pstmt.executeUpdate();
		if(cnt>0)flag = true;
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBClose.close(con, pstmt);
	}
       
       
       return flag;
       
    }
    
    public void upAnsnum(Map map){
     	int grpno = (Integer)map.get("grpno");
        int ansnum = (Integer)map.get("ansnum");
    
        Connection con = DBOpen.open();
        PreparedStatement pstmt = null;
        
        StringBuffer sql = new StringBuffer();
        sql.append(" update MEMO ");
        sql.append(" set ansnum = ansnum + 1 ");
        sql.append(" where grpno= ?  ");
        sql.append("  and ansnum > ? ");
        

        try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt);
		}
        
   
    }
    
    
	
	
	public MemoDTO readReply(int memono){
		MemoDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("  select memono, grpno, indent, ansnum, title  ");
		sql.append("   from memo   ");
		sql.append("  where memono = ? ");
		
        
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
                dto.setGrpno(rs.getInt("grpno"));
                dto.setIndent(rs.getInt("indent"));
                dto.setAnsnum(rs.getInt("ansnum"));
                dto.setTitle(rs.getString("title"));                
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return dto;
		
	}
	
	public boolean create(MemoDTO dto){
		boolean flag = false; //처음에 가져올 값
		   
		 Connection con = DBOpen.open();
		 PreparedStatement pstmt = null;
		
		  StringBuffer sql = new StringBuffer();
		  sql.append(" insert into memo(memono, title, content, wdate,grpno) ");
		  sql.append(" values(memo_seq.nextval,?,?,sysdate,  ");
		  sql.append(" (select nvl(max(grpno),0)+1 from memo)) ");
		  
		  
		  try{	
			  pstmt = con.prepareStatement(sql.toString()); //1 앞에 prepareStatement 지우기
			  pstmt.setString(1,dto.getTitle());
		      pstmt.setString(2,dto.getContent());
		      
		      int cnt = pstmt.executeUpdate();
		      
		      if(cnt>0) flag=true;
		  
		  }catch (SQLException e){
			  e.printStackTrace();
		  }finally{
			  DBClose.close(con,pstmt);
		  }
		  
		  return flag;
	}
	public MemoDTO read(int memono){ //DTO에서 저장된 애들중 int memono 를 이용해서 1건씩 가져옴
	  MemoDTO dto = null;
	  Connection con = DBOpen.open();
	  PreparedStatement pstmt = null;
	  ResultSet rs= null;
	  
	  StringBuffer sql = new StringBuffer();
	   sql.append(" select memono, title, content, ");
	   sql.append(" to_char(wdate,'yyyy-mm-dd')wdate,viewcnt ");
	   sql.append(" from memo ");
	   sql.append(" where memono= ?  ");
	   
	   try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1,memono);
		rs = pstmt.executeQuery(); //전송하고 받아오는 커리문
		if(rs.next()){
			dto = new MemoDTO();
		    dto.setContent(rs.getString("content"));
		    dto.setTitle(rs.getString("title"));
		    dto.setWdate(rs.getString("wdate"));
		    dto.setViewcnt(rs.getInt("viewcnt"));
		    dto.setMemono(rs.getInt("memono"));
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {//전송객체를 보내기위해 커리문을 미리 작성되어있어야 한다.
	 DBClose.close(con, pstmt, rs); //rs는 try를 벗어나면 사용할수 없으니.PreparedStatement 밑에 Resultset rs=null;로 선언함
	}
	  return dto;
	}
	
	public boolean update(MemoDTO dto){
		boolean flag = false;
	       Connection con = DBOpen.open();
	       PreparedStatement  pstmt = null;
	       
	       StringBuffer sql = new StringBuffer();
	       sql.append("  update memo  ");
	       sql.append("  set title = ?  ,  ");
	       sql.append("      content =  ?   ");
	       sql.append("  where       ");
	       sql.append("  memono  =  ?  ");
	 	       
	      try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getMemono());
			

		    int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;	
	}
	
	public boolean delete(int memono){
		boolean flag = false;
		   Connection con = DBOpen.open();
		   PreparedStatement pstmt = null;
		   
		   
		  StringBuffer sql = new StringBuffer();
		  sql.append(" delete from memo ");
		  sql.append(" where memono=? ");
		  
		  try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con,pstmt);
		}
		  
		  
		return flag;
	}
	public List<MemoDTO> list(Map map){ //제너릭 클래스 리스트를 사용하겠다.
        List<MemoDTO> list = new ArrayList<MemoDTO>();
        Connection con = DBOpen.open();
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");

        
        StringBuffer sql = new StringBuffer();
        
        sql.append(" select memono, title, wdate, viewcnt,grpno, indent, ansnum, r ");
        sql.append(" from( ");
        sql.append(" 	select memono, title, wdate, viewcnt,grpno, indent, ansnum, rownum r ");
        sql.append(" 	from( ");
        
        
        
        sql.append("     select memono,title, ");
        sql.append("     to_char(wdate,'yyyy-mm-dd')wdate,viewcnt, grpno, indent, ansnum ");
        sql.append("     from memo ");
        
        if(word.trim().length()>0)   //trim은 빈공간을 줄이는 메소드
			sql.append("where "+col+" like '%'||?||'%' ");

        sql.append("         order by grpno DESC, ansnum ");
        
        sql.append("     ) ");
        sql.append("   ) ");
        sql.append(" where r>=? and r<=? ");
        

       try {
		pstmt = con.prepareStatement(sql.toString());
		
		int i=0;
		if(word.trim().length()>0)
			pstmt.setString(++i, word);
		
          pstmt.setInt(++i, sno);
          pstmt.setInt(++i, eno);
		
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			MemoDTO dto = new MemoDTO();
			dto.setMemono(rs.getInt("memono"));
			dto.setTitle(rs.getString("title"));
			dto.setWdate(rs.getString("wdate"));
			dto.setViewcnt(rs.getInt("viewcnt"));
			dto.setGrpno(rs.getInt("grpno"));
			dto.setIndent(rs.getInt("indent"));
			dto.setAnsnum(rs.getInt("ansnum"));
		
			list.add(dto); // <<꼭 넣어주자
	
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		DBClose.close(con, pstmt,rs);
	}
        
        return list;
   }
	
	public void upViewcnt(int memono){
	       Connection con = DBOpen.open();
	       PreparedStatement  pstmt = null;
	       
		   
		
		   StringBuffer sql = new StringBuffer();
		   sql.append(" update memo ");
		   sql.append(" set viewcnt = viewcnt + 1 ");
		   sql.append(" where memono = ? ");
		   
		   try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		 
		
		
	}
 }
