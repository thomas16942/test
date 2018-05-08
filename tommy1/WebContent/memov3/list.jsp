<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id ="dao" class="memo.MemoDAO" />
<%
	//검색 관련
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total")) word ="";   //equals 쓰는 이유가 문자열 비교

	//페이징 관련
	int nowPage = 1;
	int recordPerPage = 5;
	
	if (request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	  int sno = ((nowPage-1) * recordPerPage)+1;
	  int eno = nowPage * recordPerPage;
 
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<MemoDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
</style>
<script type="text/javascript">
function read(memono){
	/* alert(memono+"번째 글입니다"); */
	var url="read.jsp";
	url += "?memono="+memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";

	location.href=url;
}

</script>
</head> 
<body>

<jsp:include page="/menu/top2.jsp"></jsp:include>
<center><hr style="border: 1px solid silver;" width="90%"></center>
 <br><marquee> Please choose your language / Veuillez choisir votre langue /</p></marquee>
<div style="float:right;">
<label><a href="./list.jsp"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png"border="0" width='60px'></a></label>
<label><a href="./list.jsp"><img src="https://upload.wikimedia.org/wikipedia/commons/6/62/Flag_of_France.png"border="0" width='50px'></a></label>
<label><a href="./list.jsp"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANIAAACMCAMAAAA+wwf3AAAAOVBMVEUAAADdAAD/zgD/1wD/zADvcgDhAAA/AAD/3ADnAAD/2AD/zwD+yQD/1ABBAAD/4QD/5gD1eADrAAD8BvSXAAAAsklEQVR4nO3a0VECURREwQcLCquImn+wFFnsudWdwan5nbUAAAAAAAAAAAA4uM9pftbHNP/rNM1dUoCkAkkFkgokFUgqkFQgqUBSgaQCSQWSCiQVSCqQVCCpQFKBpAJJBZIKJBVIKriv6zR/6zbN77oM8/1Y52Eum6Tjk1QgqUBSgaQCSQWSCiQVSCqQVCCpQFKBpAJJBZIKJBVIKpBUIKlAUsG8pK/zPu1w815pm2Xfni8N5IpppXJQRwAAAABJRU5ErkJggg=="border="0" width='50px'></a></label>
</div>
<br><br>


 

<div class="title">list</div>
<div class="search">
<form action="./list.jsp" method="post">
<select name="col">
<option value="title"
<%if(col.equals("title")) out.print("selected"); %>
>제목</option>
<option value="content"
<%if(col.equals("content")) out.print("selected"); %>
>내용</option>
<option value="total">전체출력</option>
</select>
<input type="search" name="word" value="<%=word%>"required>
<button>검색</button>
<button type="button" onclick="location.href='memoCreate.jsp'">등록</button>
</form>
</div>

 <table class="table">
<tr>
<th>번호</th>
<th>제목</th>
<th>날짜</th>
<th>조회수</th>
</tr>
<%if(list.size()==0){ %>
<!-- DCL 결과값을 가져오는것 -->
<tr>
<td colspan="7">등록된 메모가 없습니더</td>
</tr>
<%}else{
	for(int i=0;i<list.size();i++){
		MemoDTO dto = list.get(i);
	%>
	<tr align = center>
	<td><%=dto.getMemono()%></td>
	<td> <% if(dto.getIndent()>0) { 

         for(int r=0; r<dto.getIndent();r++){
              out.print("&nbsp;&nbsp;");
         }
    out.print("<img src='../images/re.jpg' width='20px'>");
    }
    
    %>
	<a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a>
	<%
     if(Utility.compareDay(dto.getWdate())){ %>
     <img src="../menu/images/new.png"width='40px'>  	 
<% } %>
</td>
	<td><%=dto.getWdate()%></td>
	<td><%=dto.getViewcnt() %></td>

	</tr>
<%  }
 } //if-end
%>
</table><br><br>


<div class="bottom">
<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>


<br>
<center><hr style="border: 1px solid silver;" width="90%"><center>
<br>
<iframe width="280" height="157" src="https://www.youtube.com/embed/AQ6GmpMu5L8" frameborder="0" allow="autoplay; encrypted-media" ></iframe>
<iframe width="280" height="157" src="https://www.youtube.com/embed/v-ahlbWNZPk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
<iframe width="280" height="157" src="https://www.youtube.com/embed/1fT4_fAwv_0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
  <iframe width="280" height="157" src="https://www.youtube.com/embed/1N1d1CE6ThQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
 </center>
 </div>
 <jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 





