<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
  <jsp:useBean id="dao" class="member.MemberDAO"/>
  <%
      String id = request.getParameter("id");
      String fname = request.getParameter("fname");
      
      boolean flag = dao.delete(id);
      
      if(flag){
    	  if(fname!=null && !fname.equals("member.jpg"))
    	  UploadSave.deleteFile(upDir, fname);  
    	  
    	  session.invalidate();
      } 
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
 
<DIV class="title">탈퇴확인</DIV>
 
<div class="content">
<%
  if(flag){
	  out.print("너 이제 우리 고객아냐 꺼져");
  }else{
	  out.print("나갈땐 아니란다.");
  }

%>

</div>
  
  <DIV class='bottom'>
    <input type='submit' value='홈'onclick="location.href='./list.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 