package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberTest {

	public static void main(String[] args){
		MemberDAO dao = new MemberDAO();
		//duplicateId(dao);
		//duplicateEmail(dao);
		//create(dao);
		//list(dao);
		//total(dao);
		
		//read(dao);

		//update(dao);
		
		//getFname(dao);
		//delete(dao);
		//loginCheck(dao);
		getGrade(dao);
		
}
	
	
	
	private static void getGrade(MemberDAO dao) {
		p("파일명명"+dao.getGrade("user1"));
		}



	private static void loginCheck(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "mname");
		map.put("pw", "1231");
		if(dao.loginCheck(map)) {
		p("성공");
		}else {
			p("실패");
		}
		
	}



	private static void delete(MemberDAO dao) {
	 if(dao.delete("chuwoyo")) {
		    	 p("성공");
		     }else {
		    	 p("실패");
		     }
		    
	}



	private static void getFname(MemberDAO dao) {
		p("파일명명"+dao.getFname("chuwoyo"));
	}



	private static void update(MemberDAO dao) {
	 MemberDTO dto = dao.read("chuwoyo");
		// 변경 할 값 임의로 임력
	 dto.setTel("1112-1111");
	 dto.setZipcode("00000");
	 dto.setAddress1("서울시 서울");
	 dto.setAddress2("서울");
	 dto.setEmail("dsfds@naver.com");
     dto.setJob("A01");	
	//업데이트 처리
     if(dao.update(dto)) {
    	 p("성공");
     }else {
    	 p("실패");
     }
     
	}



	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user1");
		p(dto);
		
	}



	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
				
	 p("레코드갯수:"+dao.total(map));
		
	}

	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 4);
		
	 List<MemberDTO> list  = dao.list(map);
	for(int i = 0; i<list.size();i++) {
		MemberDTO dto = list.get(i);
		p(dto);
		p("----");
	}
	 
	}
	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(MemberDTO dto) {
		p("아이디:"+dto.getId());
		p("이름:"+dto.getMname());
		p("전번:"+dto.getTel());
		p("메일:"+dto.getEmail());
		p("우번:"+dto.getZipcode());
		p("주소1:"+dto.getAddress1());
		p("주소2:"+dto.getAddress2());
		p("직업:"+dto.getJob());
		p("사진:"+dto.getFname());
		p("날짜:"+dto.getMdate());
		
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("test");
		dto.setPasswd("1234");
		dto.setTel("010-1111-1111");
		dto.setEmail("doremi@naver.com");
		dto.setMname("홍길동");
		dto.setZipcode("123456");
		dto.setAddress1("서울시 종로구 관철동");
		dto.setAddress2("13-13");
		dto.setJob("A01");
		dto.setFname("dorema.jpg");
		
		if(dao.create(dto)){
			p("성공");
		}else {
			p("실패");
			
		}
		
	}

	private static void duplicateEmail(MemberDAO dao) {
		String email = "email1@mail.com";
		if(dao.duplicateEmail(email)) {
		    p("중복");
		    }else {
		    	p("사용가능");
		    }
		}
	

	private static void duplicateId(MemberDAO dao) {
	    String id="user1";
	    
	    if(dao.duplicateId(id)) {
	    p("중복");
	    }else {
	    	p("사용가능");
	    }
	}

	
	
}
