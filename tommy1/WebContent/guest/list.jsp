<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:setProperty name = "dto" property="*"/>

<%	String id=(String)session.getAttribute("id");
	String name=dao.getName(id);

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));


	if(col.equals("total"))word=" ";
 
	int nowPage = 1;//현재 내가 지금 보고 있는 페이지.
	if(request.getParameter("nowPage")!=null) 	
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
	int recordPerPage = 5; //한 페이지당 보여줄 레코드 갯수 (나중에 프로젝트시 constant로 빼서 만들기!)

	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

 
	Map map = new HashMap();
 	map.put("col",col);
 	map.put("word",word);
 	map.put("sno", sno);
 	map.put("eno", eno);
 
	List<GuestDTO> list = dao.list(map);

	int totalRecord = dao.total(map);

%>


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<style type="text/css"> 
 .title{
  font-size: 28px;
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 30%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
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
table.table1{
 width : 600px;
}

th.a{
width:150px;
background-color:silver;
}
td.b{
width:450px;
}
td.c{
 text-align: center;
 }

</style> 

<script type="text/javascript">
	function gdelete(num) {
		var url = './deleteProc.jsp';
		url +="?num="+num;
		location.href=url;
	}

</script>
</head> 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top2.jsp" flush="false"/>

<!-- *********************************************** -->

 

<DIV class="title">방명록</DIV>

<FORM name='frm' method='POST' action='./guestProc.jsp'>
  <TABLE class="table1">

    <TR>
      <TH>이름</TH>
      <TD>
    	  <input type="text" name="name" 
    	  <%if(id!=null){ %>
    	  value="<%=name %>" 
    	  readonly="readonly"
    	  <%} %>
    	  placeholder="이름을 입력하세요">
		
      </TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea name="content" value="content" placeholder="내용을 입력하세요"resize:none;"></textarea></TD>
    </TR>
    <tr>
    <td class="c" colspan="2">
    <%if(id!=null){ %>
    <input type='submit' value='등록'>
    <input type='button' value='돌아가기' onclick="history.back()">
    <%}else{ %>
    	로그인해야 보이지롱
    <%} %>
    </td>
      </tr>
      
    
</table>
     <%for(int i = 0; i <list.size(); i++){ 

 		  dto = list.get(i);

 		  out.print("<br>");

   	%>

 	<table class="table1">
 		<tr>
 			<th class="a">글쓴이</th>
 			<td><%=dto.getName() %>
 	
 			</td>
 		</tr>
 		<tr>
 			<th class="a">내용</th>
 			<td><%=dto.getContent() %></td>
 		</tr>
 		<tr>
 			<th class="a">등록날짜</th>
 			<td><%=dto.getCreated() %></td>
 		</tr>
 		<tr>
 			<th class="a">글번호</th>
 			<td class="b"><%=dto.getNum() %></td>
 		</tr>
 		<tr class="c">
 		  <td class="c" colspan="2">
 		  <%if(id!=null&&dto.getName().equals(name)){ %>
          <input type="button" onclick="gdelete('<%=dto.getNum() %>')" value="글삭제">
          <%} %>
 		  </td>
 		  </tr>
 	</table>

  <%} %>

  </TABLE>


  <DIV class='bottom'>
   <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>
</FORM>

 


<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->

</html> 