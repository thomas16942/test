<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/ssi/ssi.jsp" %>
 <jsp:useBean id="dao" class="memo.MemoDAO" />
 <jsp:useBean id="dto" class="memo.MemoDTO" />
 <jsp:setProperty name="dto" property="*" /> <!-- 같으면 좋은데 다르면 따로 추가 할수 있음 param =""-->
 <%

  
  boolean flag = dao.create(dto);
  
  
 %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</style>

</head>
<body>
 <div class="title">
 <%
 if(flag){
 out.print("메모를 등록했습니다.");
 }else{
 out.print("메모 등록이 실패했습니다.");
 }
 
 %>
 <br>
 <input type="button" value="계속 등록" onclick="location.href='./memoCreate.jsp'">
 <input type="button" value="목록" onclick="location.href='./list.jsp'">
 </div>


   
        
         <hr style="border: 1px solid silver;" width="90%">
<center>
<iframe width="280" height="157" src="https://www.youtube.com/embed/AQ6GmpMu5L8" frameborder="0" allow="autoplay; encrypted-media" ></iframe>
<iframe width="280" height="157" src="https://www.youtube.com/embed/v-ahlbWNZPk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
<iframe width="280" height="157" src="https://www.youtube.com/embed/1fT4_fAwv_0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
<iframe width="280" height="157" src="https://www.youtube.com/embed/1N1d1CE6ThQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
</center>
</div>


</body>
</html>