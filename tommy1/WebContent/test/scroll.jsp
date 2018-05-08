<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
    <style media="screen">
      *{margin: 0; padding: 0;
       text-align: center;}
      .d_1{
        /*background-image: url(img/name7.png);*/
        background-repeat: no-repeat;
        background-size: cover;
        height: 80vh;
        overflow: hidden;
        background-attachment: fixed;
      }
      .d_1 header{
        text-align: center;
        max-width: 50%; color: white;
        position: relative; left: 50%; top: 50%;
        transform: translateX(-50%) translateY(-50%);
      }
      .d_1 header h1{
        margin-bottom: 15px; color: white;
      }
      .v1{background-image: url(../images/paris_1.jpg);}
      .v2{background-image: url(../images/t2-2.png);}
      .v3{background-image: url(../images/t3.png);}
      .img{
      text-align: center;
      }
    </style>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

 <div class="d_1 v1">
    <header>
      <a href="../index.jsp"><img src="../images/tt1.png" width="150px"></a> 
      <p>bonjour. comment? cava? </p>
    </header>
  </div>
  <div class="d_1 v2">
    <header>
    <a href="https://www.youtube.com/embed/iVEdjdpNMGc"target="_self");"><img src="../images/tt2.png" width="150px"></a> 
    </header>
  </div>
  <div class="d_1 v3">
    <header>
    </header>
  </div>
   
      <img src="http://t1.daumcdn.net/liveboard/realfood/169587ba92624a4e979fa35a07d9138f.JPG" width="150px">
      <img src="http://t1.daumcdn.net/liveboard/realfood/169587ba92624a4e979fa35a07d9138f.JPG" width="150px">
      <img src="http://t1.daumcdn.net/liveboard/realfood/169587ba92624a4e979fa35a07d9138f.JPG" width="150px">


 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 