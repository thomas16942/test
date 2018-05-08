<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 

 String id = (String) session.getAttribute("id");
    
%>


<!DOCTYPE html> 
<html> 
<head> 
<title>top</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
<!--  NO.1_Add a meta tag to automatically convert to a suitable size on mobile screen.
 순번1_ 모바일 화면에서도 알맞은 크기로 자동으로 변환 될수 있또록 메타태그를 추가. -->
<style>
     * {
			margin:0;
			padding:0;
		}
/*        순번4. nav li에 정의 했던 flaot:left를 해제 하기 위해 nav와 ul클리어 픽스핵 css를 지정
       클리어 픽스 핵css는 스타일 위에 넣어주면 구분 하기가 쉽다.
       클리어 픽스핵은 float로 지정했떤 요소의 플로팅을 해제하기 위한 방법
       NO 4. Specify nav and ul clearfix nucleus css to release flaot: left defined in nav li
        Clear Fix Nucleus css is easy to distinguish by putting it on style. */
        .clearfix:before,
		.clearfix:after {
			content: "";
			display: table;
		}

		.clearfix:after {
			clear: both;
		}

		.clearfix {
			zoom: 1;
		}
	     body {
            background: url('windmill.jpg') no-repeat center center fixed;
            background-size:cover;
        }
   /*      순번3_ <STYLE>태그 안에 내비게이션을 전체 정의 하는 <NAV> 태그와 실제 메뉴 링크를 묶고 있는
        UL 태그에 대한 스타일을 정의 
        NO.3_ <STYLE> tag, <NAV> tag which defines the navigation in full and the actual
        menu link Define styles for UL tags */
   nav {
			height: 40px;
			width: 100%;
			background: #34495e;
			font-size: 1em;
			font-family: 'PT Sans', Arial, sans-serif;
			font-weight: bold;
			position: relative;
			border-bottom: 2px solid #34495e;
		}

			nav ul {
				padding: 0;
				margin: 0 auto;
				width: 600px;
				height: 40px;
			}

			nav li {
				display: inline;
				float: left;
			}
		/* 	순번 5. 메뉴 항목에 대한 스타일을 만듬.
			NO.5 Make a style for menu items.
		 */	nav a {
				color: #fff;
				display: inline-block;
				width: 100px;
				text-align: center;
				text-decoration: none;
				line-height: 40px;
				text-shadow: 1px 1px 0px #283744;
			}

			nav li a {
				border-right: 1px solid #576979;
				box-sizing: border-box;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
			}

			nav li:last-child a {
				border-right: 0;
			}

			nav a:hover, nav a:active {
				background-color: #8c99a4;
			}

			nav a#trigger {
				display: none;
			}
			/* 순번 6. 미디어 쿼리를 이용하면 화면의 너비에 따라 메뉴 배치를 적절하게 조절할수 있다.
			NO.6 Media queries allow you to adjust the menu layout accordingly, 
			depending on the width of the screen. */
		@media screen and (max-width: 600px) {
			nav {
				height: auto;
			}

				nav ul {
					width: 100%;
					display: block;
					height: auto;
				}

				nav li {
					width: 50%;
					float: left;
					position: relative;
				}

					nav li a {
						border-bottom: 1px solid #576979;
						border-right: 1px solid #576979;
					}

				nav a {
					text-align: left;
					width: 100%;
					text-indent: 25px;
				}
		}

  /*      순번 7 . 스마트폰을 위한 미디어 쿼리에 스타일 소스를 추가
       NO.7 Add style sources to media queries for smartphones */
       
		@media only screen and (max-width : 320px) {
			nav {
				border-bottom: 0;
			}

				nav ul {
					display: none;
					height: auto;
				}

				nav li {
					display: block;
					float: none;
					width: 100%;
				}

					nav li a {
						border-bottom: 1px solid #576979;
					}

				nav a#trigger {
					display: block;
					background-color: #283744;
					width: 100%;
					position: relative;
				}

					nav a#trigger:after {
						content: "";
						background: url('nav.png') no-repeat;
						width: 30px;
						height: 30px;
						display: inline-block;
						position: absolute;
						right: 15px;
						top: 10px;
					}
		}
		#panel, #flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}
 
#panel {
    padding: 50px;
}
			
</style>
<!-- 순번9. 트리거를 선택하면 메뉴가 나타났다가 한번더 누르면 메뉴가 사라지는 메뉴.
NO.9 When the trigger is selected, the menu is displayed. -->
<script src="js/jquery-2.1.3.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(function () {
	var trigger = $('#trigger');
	var menu = $('nav ul');
	$(trigger).on('click', function (e) {
		e.preventDefault();
		menu.slideToggle();
	});
	$(window).resize(function () {
		var w = $(window).width();
		if (w > 320 && menu.is(':hidden')) {
			menu.removeAttr('style');
		}
	});
});
$(document).ready(function(){
    $("#panel").click(function(){
        $(this).slideUp("slow");
    });

});
</script>

</head> 
<body> 
<!-- NO.2 Add markup to create navigation / Tablet with two columns / menu consists of 6 items
순번2_ 네비게이션을 만드는 마크업 추가/ 태블릿에서 2개의 열로 표시 하기 때문에/ 메뉴 6개 항목으로 구성 -->
<!-- <div id="panel">Hello world!</div>
 -->
<nav class="clearfix">
   <ul class="clearfix">
    <li><a href="<%=root %>/index/scroll.jsp">Home</a></li>
  
   <li><a href="<%=root %>/memov3/list.jsp">Memo</a></li>
   <%if(id==null){ %>
     <li><a href="<%=root %>/member/agreement.jsp">Join</a></li>
     <li><a href="<%=root %>/member/loginForm.jsp">Sign in</a></li>
     <%}else{ %>
     <li><a href="<%=root %>/member/read.jsp">Information</a></li>
     <li><a href="<%=root %>/member/logout.jsp">Sign out</a></li>
     <%} %>
    <li><a href="<%=root %>/guest/list.jsp">Guest</a></li>
   </ul>
   <a href="#" id="trigger">MENU</a><!--  모바일에서 접혀지는 메뉴 구현  -->
</nav>


  <%--  <div style="text-align: center;">
       <a href="<%=root %>/index.jsp"><img src="<%=root%>/images/sam2.png" width="70%"></a> 
  </div> --%>
 
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 0px;">

