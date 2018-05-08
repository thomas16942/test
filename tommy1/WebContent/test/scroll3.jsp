<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
 <link rel="stylesheet" href="reset.css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300" rel="stylesheet">
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
      background-image: url(../images/papa.jpg);
    }
    .scene.two{
      background-image: url(../images/paris_1.jpg);
    }
    .scene.three{
      background-image: url(../images/papa.jpg);
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
      font-size:2rem;
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
      <h1>Lorem ipsum dolor sit amet.</h1> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam suscipit sint ab beatae nihi
    </header>
  </section>
  <section class="scene two">
    <header>
      <h1>Lorem ipsum dolor sit amet.</h1> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam suscipit sint ab beatae nihi
    </header>
  </section>
  <section class="scene three">
    <header>
      <h1>Lorem ipsum dolor sit amet.</h1> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam suscipit sint ab beatae nihi
    </header>
  </section>
   
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 