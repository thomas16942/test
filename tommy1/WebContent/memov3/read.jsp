<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<%
   int memono = Integer.parseInt(request.getParameter("memono"));
   

   dao.upViewcnt(memono);
   MemoDTO dto = dao.read(memono);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
  
   
   %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mreply(memono){
	var url = "replyForm.jsp";
	url += "?memono="+memono;
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>"; 
	
	location.href=url;
}
function mcreate(){
	var url = "memoCreate.jsp";
	location.href=url;
	}
function mlist(){
	var url="list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>"; 
	location.href=url;
}

function mupdate(memono){
	var url = "updateForm.jsp";
	url += "?memono="+memono;
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>"; 

	location.href=url;
	}
function mdelete(memono){
	var url = "deleteForm.jsp";
	url += "?memono="+memono;
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>"; 
	
	location.href=url;
	}


</script>
<style type="text/css"> 
.search{
 width :80%;
 margin : 20px auto;
 text-align : center;
 }
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
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
}
TH{
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  color: #FFFFFF;            /* 글자 색 */ 
  background-color: #668db4; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */
}
td{
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  color: #000000;            /* 글자 색 */ 
  background-color: #FFFFFF; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */  
}
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style>

</head> 
<body> 
<jsp:include page="/menu/top2.jsp"></jsp:include>
<div class = "title">조회</div>
<table>
<tr>
<th>제목</th>
<td><%=dto.getTitle() %></td>
</tr>
<tr>
  <th>내용</th>
  <td><%=content%><br>
      
       </td>
       
       </tr>
       <tr>
       <th> 조회수</th>
       <td><%=dto.getViewcnt() %></td>
       </tr>
       <tr>
       <th>등록일</th>
       <td><%=dto.getWdate() %></td>
       </tr>
</table>
<div class = "bottom">
<button type="button" onclick="mreply('<%=memono %>')">답변</button>
<button type="button" onclick="mcreate()">등록</button>
<button type="button" onclick="mupdate('<%=memono %>')">수정</button>
<button type="button" onclick="mdelete('<%=memono %>')">삭제</button>
<button type="button" onclick="mlist()">목록</button>


</div>

<jsp:include page="/menu/bottom.jsp"></jsp:include>

</body> 
</html> 
