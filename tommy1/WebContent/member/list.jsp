<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% // 순서대로 작성 
  // 검색관련 -----
  String col = Utility.checkNull(request.getParameter("col"));
  String word = Utility.checkNull(request.getParameter("word"));
  if(col.equals("total")) word = ""; //빈문자가 들어왔는지 안왔는지 빈문자열 비교
  
  //페이징 관련
  int nowPage = 1;
  int recordPerPage= 3;
  if(request.getParameter("nowPage")!=null){
	 nowPage = Integer.parseInt(request.getParameter("nowPage"));
  } 
   
  //db에서 가져올 순번
  int sno = ((nowPage-1) * recordPerPage)+1;
  int eno = nowPage * recordPerPage;
  
  //dao 메소드 호출
  Map map = new HashMap();
  map.put("col",col);
  map.put("word",word);
  map.put("sno",sno);
  map.put("eno",eno);
  
  List<MemberDTO> list = dao.list(map);
    

	int totalRecord = dao.total(map);

	//페이징출력메소드 호출 

	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

%>
 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(id){
	var url="./read.jsp";
	url += "?id="+id;
	
	location.href=url;
}

</script>
<style type="text/css"> 
.search{
    width : 80%;
    margin: 5px auto;
    text-align : center;
}
.title{
  font-size: 28px;
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 30%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
 
/* 내용 */
.content{
  font-size: 24px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}
 
/* 하단 메뉴 */
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
 
 
/* 테이블에 CSS 적용 */
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
 
}
 
TH{
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  color: #FFFFFF;            /* 글자 색 */ 
  background-color: #668db4; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */
}
 
 
td{
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  color: #000000;            /* 글자 색 */ 
  background-color: #FFFFFF; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */  
}
 
 
.input{
  padding: 0px;
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  border-top-style: none;
  border-right-style: none;
  border-left-style: none; 
}
 
.textarea{
  padding: 0px;
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  border-top-style: none;
  border-right-style: none;
  border-left-style: none; 
}
</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>
<div class="search">
<form method="post" action="./list.jsp">
<select name="col">
   <option value ="mname"
    <%if(col.equals("mname")) out.print("selected"); %>
   >성명</option>
   <option value ="id"
    <%if(col.equals("id")) out.print("selected"); %>
   >아이디</option>
   <option value ="email"
    <%if(col.equals("email")) out.print("selected"); %>
   >이메일</option>
   
   <option value ="total">전체출력</option>
</select>
<input type="search" name="word" value="<%=word %>" required>
<button>검색</button>
<button type="button" onclick="location.href='./createForm.jsp'">회원가입</button>
</form>
</div>
 <% for (int i=0; i<list.size(); i++){
	 
	 MemberDTO dto = list.get(i);
	 
	 %>
 <table class="table">
 
 <tr>
  <td rowspan="5"width="30%"><img src="./storage/<%=dto.getFname() %>"width="200px" height="150px"></td>
  <th width="20%">아이디</th>
  <td width="50%"><a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a></td>
  </tr>
   <tr>
   <th>성명</th>
   <td><%=dto.getMname() %></td>
   </tr>
     <tr>
   <th>전화번호</th>
   <td><%=dto.getTel() %></td>
   </tr>
     <tr>
   <th>이메일</th>
   <td><%=dto.getEmail() %></td>
   </tr>
     <tr>
   <th>주소</th>
   <td>
      <%=Utility.checkNull(dto.getAddress1()) %>
      <%=Utility.checkNull(dto.getAddress2()) %>
   </td>
   </tr>
 </table>
<%} %>
  <DIV class='bottom'>
  
  <%=paging %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 