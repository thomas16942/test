<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>

<%
	int memono = Integer.parseInt(request.getParameter("memono"));

 
     MemoDTO dto = dao.readReply(memono);
    
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
.search{
 width :80%;
 margin : 20px auto;
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
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style>
</head>
<script type="text/javascript">
function incheck(){
var f = document.frm;
if(f.title.value==""){
	 alert("제목을 입력하세요");
	 f.title.focus();
	 return ;
     }
if(f.content.value==""){
	 alert("내용을 입력하세요");
	 f.content.focus();
	 return ;
     }
     
     f.submit();
}
</script>

<body>
<jsp:include page="/menu/top2.jsp"></jsp:include>
<div class="title">
답변
</div>
<form  name="frm"action="replyProc.jsp" method="POST"> <!-- 사이트에서 직접 호출하면 안된다 -->
<input type="hidden" name="memono" value="<%=dto.getMemono() %>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%= request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%= request.getParameter("nowPage")%>">
<table>

  <tr>
  <th>제목</th>
  <td><input type="text" name="title" size="30" value='<%=dto.getTitle()%>'></td>
  </tr>
  <tr>
  <th>내용</th>
  <td><textarea rows="10" cols="35" name="content"></textarea>
</table>




<div class="bottom">
<button type = "button" onclick="incheck()">답변해용 <IMG src='../menu/images/plane.jpg' width='20px'></button>
</div>
</form>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body>


</html>





