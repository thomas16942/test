package board;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import board.BoardDAO;
import board.BoardDTO;


public class BoardTest {
	public static void main(String[] args){
		BoardDAO dao = new BoardDAO();
	
	//list(dao);
		total(dao);
}

	private static void total(BoardDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
				
	 p("레코드갯수:"+dao.total(map));
		
	}
	
	private static void list(BoardDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 2);
		
		List<BoardDTO> list = dao.list(map);
		for(int i=0; i<list.size();i++){
			BoardDTO dto = list.get(i); //get 가져오기만함 
			p(dto);
			p("--------------"); //오버로딩
		}
	}
		private static void p(String string) {
			System.out.println(string);
			
		}

		private static void p(BoardDTO dto) {
			// TODO Auto-generated method stub
			p("번호:"+dto.getNum());
			p("제목:"+dto.getTitle());
			p("소제목:"+dto.getTitle2());
			p("내용:"+dto.getContent());
			p("태그:"+dto.getTag());
			p("여행기간:"+dto.getDate2());
			p("등록날짜:"+dto.getWdate());
			p("조회수:"+dto.getViewcnt());
			p("비번:"+dto.getPasswd());
			p("작성자:"+dto.getName());
			p("grpno:"+dto.getGrpno());		
			p("indent:"+dto.getIndent());
		}
		private static void create(BoardDAO dao) {
			BoardDTO dto = new BoardDTO();
			dto.setName("아로미");
	        dto.setTitle("한국전주");	
	        dto.setTitle2("바람을 피러가다");	
	        dto.setContent("과연걸릴건지");
	        dto.setTag("#korea,#한국");
	        dto.setDate2("2018.02.13-02.15");
	        dto.setPasswd("123");

		/*	if(dao.create(dto)){
				p("성공");
				
			}else{
				p("실패");
			}
			*/
		}
		
	}
