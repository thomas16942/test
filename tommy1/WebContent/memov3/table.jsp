<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<style type="text/css">
table {
      width:50%;
       margin:auto;}
table,th,tr{
align:center;
      border:1px solid black;
      border:solid 1px red;
      padding:20px;
      border-spacing:5px;}
</style>
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
</head> 
<body> 
<table>
 <TR>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
     <TH rowspan='5' bgcolor='#AAFFAA'> 6% </TH>    
<!--         병합합니다 -->
  </TR>
  <TR>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH rowspan='4' bgcolor='#AAFFAA'> 5% </TH>
  </TR>
  <TR>
    <TH> </TH>
    <TH> </TH>
    <TH rowspan='3' bgcolor='#AAFFAA'> 3% </TH>
    <TH> </TH>
   
  </TR>
  <TR>
    <TH> </TH>
    <TH rowspan='2' bgcolor='#AAFFAA'> 2% </TH>
    <TH rowspan='2' bgcolor='#AAFFAA'> 4% </TH>
  </TR>
  <TR>
    <TH rowspan='1' bgcolor='#AAFFAA'> 1% </TH>
  </TR>
 
</TABLE>


</body> 
</html> 
