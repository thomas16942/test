<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
 

<%	

	int num = Integer.parseInt(request.getParameter("num"));

	boolean flag = dao.delete(num);

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

</style> 

<script type="text/javascript">

	function glist() {

		var url ="list.jsp";

		

		location.href=url;

	}

</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

</head> 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->

 

<DIV class="title">삭제확인</DIV>

<div class="content">

	<%

		if(flag){

			out.print("글이 삭제 되었습니다.");

		}else{

			out.print("글 삭제가 취소 되었습니다.");

		}

	%>

</div> 

 

  

  <DIV class='bottom'>

  

    <input type='button' value='목록' onclick="glist()">

  </DIV>

 

 

 

<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->

</html> 

 

 

 