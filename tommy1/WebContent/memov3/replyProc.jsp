<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
 Map map = new HashMap();
 map.put("grpno", dto.getGrpno());
 map.put("ansnum", dto.getAnsnum());

 dao.upAnsnum(map);
   // 답변 을 추가  
 boolean flag = dao.createReply(dto);

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
 .title{
  font-size: 28px;
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 30%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style> 
<script type="text/javascript">
function mlist(){
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>"; 
	location.href=url;
}


</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">답변확인</DIV>
 <div class="bottom">
<%
   if(flag){
	   out.print("답변을 생성했습니다.");
   }else{
	   out.print("답변 생성 실패했습니다");
   }
 
%> 

</div>
 
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="mlist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 