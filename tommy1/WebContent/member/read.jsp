<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 <jsp:useBean id="dao" class="member.MemberDAO"/>
 <%
  String id = request.getParameter("id"); //list.jsp

  if(id==null) id = (String)session.getAttribute("id"); //일반사용자
  MemberDTO dto = dao.read(id);
 
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mdelete(){
	var url = "./deleteForm.jsp";
	url += "?id=<%=id%>";
	 
	location.href=url;
}
function mupdate(){
	var url = "./updateForm.jsp";
	url += "?id=<%=id%>";
	
	location.href=url;
}
function updateFile(){
	var url = "./updateFileForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";

	location.href=url;
}
function updatePw(){
	var url = "./updatePwForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldpw=<%=dto.getPasswd()%>";

	location.href=url;
}

</script>
<style type="text/css"> 
.search{
    width : 80%;
    margin: 5px auto;
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
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
 
/* 내용 */
.content{
  font-size: 24px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}
 
/* 하단 메뉴 */
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
 
 
/* 테이블에 CSS 적용 */
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
 
 
.input{
  padding: 0px;
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  border-top-style: none;
  border-right-style: none;
  border-left-style: none; 
}
 
.textarea{
  padding: 0px;
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  border-top-style: none;
  border-right-style: none;
  border-left-style: none; 
}
</style> 

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 
 
  <TABLE>
    <TR>
      <TD colspan="2">
      <img src="./storage/<%=dto.getFname() %>">
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD>
      <%=dto.getId() %>
      </TD>
    </TR>
    
      <TR>
      <TH>성명</TH>
      <TD>
      <%=dto.getMname() %>
      </TD>
    </TR>
    
      <TR>
      <TH>전화번호</TH>
      <TD>
      <%=dto.getTel()%>
      </TD>
    </TR>
        
      <TR>
      <TH>이메일</TH>
      <TD>
      <%=dto.getEmail()%>
      </TD>
    </TR>
        <TR>
      <TH>우편번호</TH>
      <TD>
     <%=Utility.checkNull(dto.getZipcode()) %>
      </TD>
    </TR>
    
         <TR>
      <TH>주소</TH>
      <TD>
     <%=Utility.checkNull(dto.getAddress1()) %>
     <%=Utility.checkNull(dto.getAddress2()) %>
      </TD>
    </TR>

         <TR>
      <TH>직업</TH>
      <TD>
          직업코드:<%=dto.getJob() %>
          (<%=Utility.getCodeValue(dto.getJob()) %>)
      </TD>
    </TR>
       <TR>
      <TH>가입날짜</TH>
      <TD>
      <%=dto.getMdate() %>
      </TD>
    </TR>
    
    
  </TABLE>
  

  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="mupdate()">
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='비번변경' onclick="updatePw()">
    <input type='button' value='회원탈퇴' onclick="mdelete()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 