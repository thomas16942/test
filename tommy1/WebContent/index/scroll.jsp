<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
 String id = (String) session.getAttribute("id");
%>
 
<!DOCTYPE html> 
<html> 
 <link rel="stylesheet" href="reset.css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300" rel="stylesheet">
  <head>
  <style>
  
    body {
      margin: 0;
    }
    .scene {
      height: 100vh;
      overflow: hidden;
      background-attachment: fixed;
      background-size: cover;
      font-family: 'Source Sans Pro', sans-serif;
      font-weight: 200;
    }
    .scene.one{
      background-image: url(./img/t1.jpg);
    }
    .scene.two{
      background-image: url(./img/t2.jpg);
    }
    .scene.three{
      background-image: url(./img/t3.jpg);
    }
    .scene.four{
      background-image: url(./img/t4.jpg);
    }
       .scene.five{
      background-image: url(./img/t5.jpg);
    }
    .scene header{
      color:white;
      max-width: 80%;
      position: relative;
      left:50%;
      top:50%;
      transform:translateX(-50%) translateY(-50%);
      font-size:1.5rem;
      text-align: center;
    }
    .scene header h1{
      font-size:3rem;
      margin-bottom: 1rem;
      font-weight: 300;
    }
    .scene header h1:after{
      content:'';
      border-bottom:1px solid white;
      width:8rem;
      display: block;
      margin:0 auto;
      margin-top:1rem;
    }
  </style>
  </head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<section class="scene one">
    <header>
   <h1>Travel for me / with Tommy</h1> 
      <%if(id==null){ %>
      <a href="<%=root %>/member/loginForm.jsp"><img src="./img/l1.png"width="200px"></a>
   
        <%}else{ %>
     여행은 언제나 돈의 문제가 아니고 용기의 문제다.<br><br>
      <a href="<%=root%>/index/index2.jsp"><img src="./img/e1.png"width="200px"></a>
      <%} %>
    </header>
  </section>
  <section class="scene two">
    <header>
    <h1>Travel for me / with Tommy</h1>  
       <%if(id==null){ %>
      <a href="<%=root %>/member/loginForm.jsp"><img src="./img/l1.png"width="200px"></a>
        <%}else{ %>
     인생은 짧고 세상은 넓다.<br>세상 탐험은 빨리 시작하는 것이 좋다.<BR><br>
      <a href="<%=root%>/index/index3.jsp"><img src="./img/e1.png"width="200px"></a>
         <%} %>
      </header>
  </section>
  <section class="scene three">
    <header>
     <h1>Travel for me / with Tommy</h1>  
        <%if(id==null){ %>
      <a href="<%=root %>/member/loginForm.jsp"><img src="./img/l1.png"width="200px"></a>
      <a href="<%=root%>/index/index4.jsp"><img src="./img/e1.png"width="200px"></a>
     
        <%}else{ %>
     행복하게 여행하려면 가볍게 여행해야한다.<br><br>
      <a href="<%=root%>/index/index4.jsp"><img src="./img/e1.png"width="200px"></a>
         <%} %>
      </header>
  </section>
    <section class="scene four">
    <header>
     <h1>Travel for me / with Tommy</h1>   
       <%if(id==null){ %>
      <a href="<%=root %>/member/loginForm.jsp"><img src="./img/l1.png"width="200px"></a>
       <a href="<%=root%>/kupe/kupe.html"><img src="./img/e1.png"width="200px"></a>
        <%}else{ %>
     많은 사람은 행복이 미래에 있다고 생각한다.<br><br>
      <a href="<%=root%>/kupe/kupe.html"><img src="./img/e1.png"width="200px"></a>
         <%} %>
      </header>
      </section>
        <section class="scene five">
    <header>
     <h1>Travel for me / with Tommy</h1>   
       <%if(id==null){ %>
      <a href="<%=root %>/member/loginForm.jsp"><img src="./img/l1.png"width="200px"></a>
       <a href="<%=root%>/leon/index2.html"><img src="./img/e1.png"width="200px"></a>
        <%}else{ %>
     "사는 게 항상 이렇게 힘든가요? 아니면 어릴 때만 그래요?"<br><br>
      <a href="<%=root%>/leon/index2.html"><img src="./img/e1.png"width="200px"></a>
         <%} %>
      </header>
  </section>
</body>
<!-- *********************************************** -->
</html> 