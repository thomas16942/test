<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 <jsp:useBean id="dao" class="member.MemberDAO"/>
 <jsp:useBean id="dto" class="member.MemberDTO"/>
 <%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
 
Map map = new HashMap();
map.put("id", id); 
map.put("passwd", passwd);

boolean flag = dao.loginCheck(map);
String grade = null;//회원등급
if(flag){//회원인경우
grade = dao.getGrade(id);
   session.setAttribute("id", id);
   session.setAttribute("grade", grade);
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
 
<DIV class="title">로그인처리</DIV>
 
<div class="content">
<%
if(flag){
out.print("로그인 되었습니다.");
}else{
out.print("아이디/비밀번호를 잘못 입력하셨거나 <br>");
out.print("회원이 아닙니다. 회원가입을 하세요");
}
%>
</div>
  
<DIV class='bottom'>
  <input type='button' value='다시시도'  onclick="history.back()">
  <input type='button' value='홈' onclick="location.href='../index.jsp'">
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 