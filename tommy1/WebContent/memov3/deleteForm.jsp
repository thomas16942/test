<%@ page contentType="text/html; charset=UTF-8" %> 
 <jsp:useBean id="dao" class="memo.MemoDAO" />
<% request.setCharacterEncoding("utf-8"); 
    int memono = Integer.parseInt(request.getParameter("memono"));
    
    boolean flag = dao.checkRefnum(memono);

%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="stylesheet">
<script type="text/javascript">
function mlist(){
	var url="list.jsp";
	location.href=url;
}

</script>
</head> 
<body> 
<jsp:include page="/menu/top2.jsp"></jsp:include>
<%if(flag){ %>
<div class = "content">
부모글 이므로 삭제 할수 없습니다.
<DIV class='bottom'>
    <input type='button' value='뒤로가기' onclick="history.back()">
    <input type='button' value='목록' onclick="mlist()">

 </div>
 <%}else{ %>


 </div>


<div class="title">삭제 확인</div>

<div>
<div class="content">
<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memono" value="<%=memono %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%= request.getParameter("nowPage")%>">
<!--  
창에 memono가 보이기 떄문에 이것을 히든처리해서 안보이게한다 무조건 input이 있어야 전달을 한다-->

<br>
삭제를 하면 복부가 될수 없습니다.<br>
삭제를 하려면 삭제버튼을 클릭하세요.<br>
취소는 목록버튼을 누르세요<br>

<button>삭제처리</button>
<button type="button" onclick="mlist()">목록가기</button>

</form>

<%} %>

</div>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 
