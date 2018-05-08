<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:setProperty name="dto" property="*"/>

<%	String id=(String)session.getAttribute("id");
	String name=dao.getName(id);
	dto.setName(name);
	boolean flag = dao.create(dto);

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

		var url = "./list.jsp";

		

		location.href=url;

	}

</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

</head> 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->

 

<DIV class="title">방명록등록확인</DIV>

 

<div class = "content">

	<%

		if(flag){

			out.print("등록을 성공했습니다.");

		}else{

			out.print("등록을 실패했습니다.");

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

 

 