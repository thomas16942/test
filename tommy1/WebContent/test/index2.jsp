<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
 <table width="1000" height="200" align="center" border="1">
  <tr>
      <td  width="220" rowspan="2" ><img src="../images/hu.png" width='30px'><br><br>
      Hello. <br>
      Have a nice day! <br>
      </td>
      <td style="text-align: center;" width="110" height="100"><img src="../images/hel.png" width='30px'>
      <br><b>test</b>
      </td>
      <td style="text-align: center;" width="110" height="100"><img src="../images/info.png" width='30px'>
      <br><b>test</b>
      </td>
      <td  width="220" rowspan="2">콘텐츠</td>
      <td  width="360" rowspan="2"><img src="../images/i1.png" width="450px">
<!--           <img src="../images/h1.png" width="450px">
          <img src="../images/p1.png" width="450px"> -->
          </td>
          </tr>
          <tr>
       <td style="text-align: center;" width="110" height="100"><img src="../images/hel.png" width='30px'>
      <br><b>test</b>
      </td>
        <td style="text-align: center;" width="110" height="100"><img src="../images/hel.png" width='30px'>
      <br><b>test</b>
      </td>
      </tr>
     </table>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 