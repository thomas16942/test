<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="board.BoardDAO"/>

<%

  //검색관련---------------------------------------------------
  String col = Utility.checkNull(request.getParameter("col"));
  String word = Utility.checkNull(request.getParameter("word"));
 
  if(col.equals("total")) word ="";   //equals 쓰는 이유가 문자열 비교
  //검색관련 end ----------------------------------------------
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
  
  List<BoardDTO> list = dao.list(map);
    

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
function bcreate(){
	var url = "./createForm.jsp";
	location.href=url;
}

function read(name){
	var url="./read.jsp";
	url += "?name="+name;
	
	location.href=url;
}

</script>
<style type="text/css"> 
.search{
 width :80%;
 margin : 20px auto;
 text-align : center;
 }
table{
width: 50%;
font-color: black;
border:1px solid black;
margin : auto;
} 
table,td, th{
border:1px solid black;
text-align :center;
font-color: black;
 border-collapse: collapse;
}
caption{
padding-top:5px;
font-style: italic;
}
</style> 
<%--  <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<CENTER><h1>TOUR LIST</h1></CENTER>

<DIV CLASS="search">
<form action="./list.jsp" method="post">
<select name="col">
  <option value = "name"
  <%if(col.equals("name")) out.print("selected"); %>
  >성명</option>
  <option value = "title"
  <%if(col.equals("title")) out.print("selected"); %>
  >제목</option>
  <option value = "content"
  <%if(col.equals("content")) out.print("selected"); %>
  >내용</option>
  <option value = "tag"
  <%if(col.equals("tag")) out.print("selected"); %>
  >태그</option>
    <option value = "con"
  <%if(col.equals("con")) out.print("selected"); %>
  >국가</option>
  <option value = "total">전체출력</option>
</select>
  <input type="search" name="word" value="<%=word %>" required><!-- 검색어 -->
  <button>검색</button>
  <button type="button" onclick="location.href='./createForm.jsp'">등록</button>
 </form>
 
 
</DIV>


 <% for (int i=0; i<list.size(); i++){
	 BoardDTO dto = list.get(i);
	 
	 %>
 <table class="table">
    <TR>
      <TD ROWSPAN="4" width="30%"><a href="javascript:read('<%=dto.getName() %>')"><img src="./storage/<%=dto.getFname() %>"width="200px" height="150px"></a></TD>
     <TD COLSPAN="2"><%=dto.getTitle() %></TD>
    </TR>
    <TR>
  <TD COLSPAN="2"><%=dto.getTitle2() %></TD>
  </TR>
  <TR>
  <TD COLSPAN="2"><%=dto.getTag() %></TD>
  </TR>
  <TR>
  <TD COLSPAN="2"><%=dto.getWdate() %></TD>
  </TR>
  <TR>
  <TD><%=dto.getName() %></TD>
  <TD><%=dto.getViewcnt() %></TD>
  <td><%=dto.getNum() %></td>
  </TR>

  </TABLE>
  <%} %>  

  
 <DIV class='bottom'>
   <%=paging %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 