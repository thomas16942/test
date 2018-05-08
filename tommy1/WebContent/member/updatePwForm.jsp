<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 <%
 String id = request.getParameter("id");
 String oldpw = request.getParameter("oldpw");
 
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
<script type="text/javascript">
function inCheck(f){
	if(f.oldpw.value != f.repasswd.value){
		alert("패스워드가 일치 하지 않습니다, \n 다시 입력해주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("변경할 패스워드를 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("기존 패스워드를 입력하세요");
		f.repasswd.focus();
		return false;
	}

}
</script> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">패스워드 변경</DIV>
 
 
<FORM name='frm' 
      method='POST' 
      action='./updatePwProc.jsp'
      onsubmit="return inCheck(this)">
      
  <input type="hidden" name="id" value="<%=id%>">
  <input type="hidden" name="oldpw" value="<%=oldpw%>">
  
  <TABLE>
     <TR>
      <TH>기존 패스워드</TH>
      <TD><input type="password" name="repasswd" ></TD>
    </TR>
 
    <TR>
      <TH>새로운 패스워드</TH>
      <TD><input type="password" name="passwd" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='패스워드 수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 