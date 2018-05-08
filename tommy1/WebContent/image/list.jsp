<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/>
<jsp:useBean id="dto" class="image.ImageDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	
	if(col.equals("total")) word="";
	
	//페이징관련 
	
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null)
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	
	int sno = ((nowPage-1) * recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	Map map = new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);

	
	List<ImageDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
.search{
/* 	width:80; */
/* 	text-align: center; */
/* 	margin: 2px auto; */
}


</style>

<script type="text/javascript">
function read(ino){
	
	var url = "read.jsp";
	url += "?ino="+ino;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}
/*JSP 코드 상에서 자바스크립트 변수는 직접적으로 사용 불가능하다. 그러므로 자바스크립트에서 따로 표시를 해줘야한다. 매개변수 선언 시
타입을 표시해주지 않는다.
링크에 색깔을 기본 파란색이 아닌 검정색으로 입히기 위해 a:link,visited 등을 사용했다
var로 변수 선언하고 url를 만들었다. location.href=url;은 get 방식이다. http://localhost:8000/jsptest/memo/read.jsp?memono=13 이런식으로 memono=13으로 가게된다.
*/
</script>

</head> 
<body> 
<jsp:include page="../menu/top.jsp"></jsp:include>

<div class="search">
<form action="./list.jsp" method="post">
<select name="col">
	<option value="title"
	<%if(col.equals("title")) out.print("selected");%>
	>제목</option>
	<option value="content"
	<%if(col.equals("content")) out.print("selected");%>
	>내용</option>
	<option value="total">전체출력</option>
</select>
<input type="search" name="word" value="<%=word %>" required>
<button>검색</button>
<button type="button" onclick="location.href='createForm.jsp'">등록</button>
</form>
</div>

<div class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>게시글 목록</h2>

<!-- <table class="table table-condensed"> -->
<table style ="border:0px solid ; text-align:center;">
<thead>
<tr>

<th> 번호 </th>
<th> 제목 </th>
<th> 내용 </th>
<th> 날짜 </th>
<th> 이미지 </th>

</tr>
</thead>

<%if(list.size()==0){ %>
<tbody>
<tr>

<td colspan="5"> 등록된 메모가 없습니다. </td>

</tr>
</tbody>
<tr>
<%} else{
	for(int i=0; i<list.size(); i++){
	dto= list.get(i);	
	
%>
<td> <%=dto.getIno() %> </td>

<td>
<a href="javascript:read('<%=dto.getIno() %>')"> <%=dto.getTitle()%></a> 
</td>

<td> <%=dto.getContent()%></td>

<td> <%=dto.getWdate() %> </td>

<td rowspan="5" width="30%">
	<img src="./storage/<%=dto.getFname()%>" width="70px" height="50px">
	</td>

</tr>
</tbody>
<%} 
}
%>
</table>


<div class="bottom">
<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>


</div>
</div>
</body> 
</html> 