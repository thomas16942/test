<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
    String id = request.getParameter("id");

    if(id==null) id = (String)session.getAttribute("id");
    String fname = dao.getFname(id);

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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원 탈퇴..</DIV>
 
<FORM name='frm' 
      method='POST' 
      action='./deleteProc.jsp'>
 <input type="hidden" name="id" value="<%=id %>">
 <input type="hidden" name="fname" value="<%=fname %>">


<div class="content">

개새끼야! 가지마......<br>
내가 잘못했어.. 그래도 갈거야?

</div>

 <div class='bottom'>
     <input type='submit' value='탈퇴'>
    <input type='button' value='취소' onclick="history.back()")">
 </div>
 </FORM>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 