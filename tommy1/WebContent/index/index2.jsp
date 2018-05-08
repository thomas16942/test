<%@ page contentType="text/html; charset=UTF-8" %> 
<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title> 
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
			.img {
				width:100%;
				max-width:640px;
			}
			.top-slide{
			   
				margin:0 auto;
				width:640px;
			}
</style>
</head> 
<!-- *********************************************** -->
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->

<body>
	<div class="top-slide">
		<div class="carousel slide" id="photo">
			<ol class="carousel-indicators">
				<li data-target="#photo" data-slide-to="0" class="active"></li>
				<li data-target="#photo" data-slide-to="1"></li>
				<li data-target="#photo" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active"><a href="<%=root%>/info/lb.jsp">
					<img id="img" src="../menu/images/paris1.jpg" width="1000px"align="center"></a>
					<div class="carousel-caption">
						<h4>Le Jardin du Luxembourg</h4>
						<p>the Luxembourg Garden, located in the 6th arrondissement of Paris</p>
					</div>
				</div>
				<div class="item"><a href="https://en.wikipedia.org/wiki/Shanghai">
					<img id="img" src="../menu/images/shanghai.jpg"width="1000px"  align="center"></a>
					<div class="carousel-caption">
						<h4>Shanghai</h4>
						<p>Shanghai is the center of the economy </p>
					</div>				
				</div>
				<div class="item"><a href="https://en.wikipedia.org/wiki/New_York">
					<img id="img" src="../menu/images/newyork.jpg"width="1000px"align="center"></a>
					<div class="carousel-caption">
						<h4>New York</h4>
						<p>America's largest city </p>
					</div>				
				</div>			
			</div>
			
			<a class="left carousel-control" href="#photo" data-slide="prev">
				<span class="icon-prev"> 
			</a>
			<a class="right carousel-control" href="#photo" data-slide="next">
				<span class="icon-next">
			</a>		
		</div>
		</div>


 		<script src="js/jquery-2.1.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script> 
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 