<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"></jsp:useBean>
<%	
	int ino = Integer.parseInt(request.getParameter("ino"));
	ImageDTO dto = dao.read(ino);
	String content = dto.getContent();
	content = content.replace("\r\n","<br>");
	
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
function mupdate(ino){
var url ="./updateForm.jsp";
url += "?ino=<%=ino%>"; 
url += "&oldfile=<%=dto.getFname()%>"; 
location.href=url;
}

function mdel(ino){
var url ="./deleteForm.jsp";
url += "?ino=<%=ino%>";
url += "&oldfile=<%=dto.getFname()%>";
location.href=url;
}

function readGo(ino){
	var url = "./read.jsp";
	url = url +"?ino="+ino;
	
	location.href=url;
}

function fileDown(fname){
var url="<%=root%>/download";
url += "?filename="+fname;
url += "&dir=/image/storage";
location.href=url;
}


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 
  <TABLE style="width:50%">
    <TR>
      <TD colspan="2">
      <a href="javascript:fileDown('<%=dto.getFname() %>')"><img src="./storage/<%=dto.getFname() %>" width="100%">
      </a>
      </TD>
    </TR>
	
	<tr>
    <th>제목</th>
    <td><%=dto.getTitle() %></td>
    </tr>
	    
    <tr>
    <th>내용</th>
    <td><%=content %></td>
    </tr>
    
    <tr>
    <th>작성자</th>
    <td><%=dto.getMname() %></td>
    </tr>
    
    <tr>
    <th>날짜</th>
    <td><%=dto.getWdate() %></td>
    </tr>
  </TABLE>
  <table style="width:50%">
  <tr>
  <%
  List list = dao.imgRead(ino);
  String[] files = (String[])list.get(0);
  int[] noArr = (int[])list.get(1);
  for(int i=0; i<5; i++){
	  if(files[i]==null){
  %>
  <td class="td_padding">
  <img src="./storage/default.jpg" width="100%">
  <td>
  <%
  }else{
	  if(noArr[i]==ino){
  
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%
  		}else{
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%
  		}
  	}
  }
  %>
  </tr>
  </table>
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="mupdate(<%=dto.getIno()%>)">
    <input type='button' value='삭제'    onclick="mdel(<%=dto.getIno()%>)">
    <input type='button' value='목록'    onclick="location.href='./list.jsp'">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
