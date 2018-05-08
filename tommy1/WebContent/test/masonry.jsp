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
   .item {
        width: 150x;
        height: 150px;
        float: left;
        margin: 5px;
 background-color: #2195c9; 
      }
</style> 
 <script src="masonry.pkgd.min.js"></script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 
 <div id="container">
      <div class="item">Lorem</div>
      <div class="item">Ipsum</div>  <div class="item">Lorem</div>
      <div class="item">Ipsum</div>  <div class="item">Lorem</div>
      <div class="item">Ipsum</div>  <div class="item">Lorem</div>
      <div class="item">Ipsum</div>  <div class="item">Lorem</div>
      <div class="item">Ipsum</div>  <div class="item">Lorem</div>
      <div class="item">Ipsum</div>
  
    </div>
    <script>
      var container = document.querySelector( '#container' );
      var msnry = new Masonry( container, {
        // options
        columnWidth: 110,
        itemSelector: '.item',
      } );
    </script>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 