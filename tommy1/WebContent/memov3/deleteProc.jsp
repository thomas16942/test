<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>    
<jsp:useBean id="dao" class="memo.MemoDAO"/>

<% int memono = Integer.parseInt(request.getParameter("memono"));
  

   boolean flag = dao.delete(memono);
   

%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
div{
   text-align: center;
   margin-top:10px;
   
}

</style> 
<script type="text/javascript">
function mlist(){
	var url = "list.jsp";
	
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>"; 
	
    location.href=url;
}
</script>

</head> 
<body> 
<div>삭제 확인</div>
<%
if(flag){
	out.print("메모를 삭제했습니다");
}else{
	out.print("메모를 삭제를 실패했슈");
}

%>

<br>

<button type="button" onclick="mlist()">목록</button>


</body> 
</html> 
