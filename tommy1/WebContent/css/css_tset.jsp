<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

#idcss{
  color: #FF0000;             /* 빨간색 */
  background-color: #FFFF00;  /* 노란색 */
  font-size: 50px;
  text-align: center;
  width: 35%;
  margin: 0 auto;
}

</style> 
<link href = "./style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
<DIV class = 'title'>게시판  Version 2.0</DIV>

<TABLE class='table'>
<tr>
<th>번호</th>
<th>제목</th>
<th>내용</th>
</tr>
<tr>
<td align='center'>1</td>
<td align='center'>월요일</td>
<td>첫눈</td>
    </TR>
    <TR>
      <TD align='center'>2</TD>
      <TD align='center'>화요일</TD>
      <TD>메모장 제작</TD>
    </TR>
    <TR>
      <TD align='center'>3</TD>
      <TD align='center'>수요일</TD>
      <TD>메모장 테스트</TD>
    </TR>
  </TABLE>

<div class='content'>
<a href ='http://www.kma.go.kr'>기상철</a><br>
</div>
<DIV id='idcss'>
    <br>
    고유한 CSS 적용
    <br><br>
  </DIV>
  <DIV class='bottom'>하단 메뉴</DIV>
</body> 
</html> 