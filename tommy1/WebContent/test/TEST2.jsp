<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
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
div {
    height:100px;
    width:100px;
    display: inline-block;
}

#red {
    background-color:#FF0000;
}

#blue {
    background-color:#0000FF;
}

#yellow {
    background-color:#E2BE22;
}

#green {
    background-color:#008800;
}

/*.header*/ 
.header{width:100%;height:95px;} 
.header .hTopIn{width:100%;background:#4999b4;color:#fff;} 
.header .hTopIn .adver{text-align:center;color:#fff;height:100px;line-height:100px;font-size:36px;} 
/*높이 잡아주고...*/
.header .hTopIn .down{width:100%;color:#fff; border:none;} /*버튼*/
</style> 
<script type="text/javascript" src="script.js"></script>
</head> 
<!-- *********************************************** -->
<body>
<header class="header"> 
   <div class="hTopIn"> 
     <div class="adver">광고등등..여기여기</div> 
     <input type="button" value="▼" class="down" title="메뉴"> 
   </div>
</header>
<!-- *********************************************** -->
      <div id="red"></div>
        <div id="blue"></div>
        <div id="yellow"></div>
        <div id="green"></div>


 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 