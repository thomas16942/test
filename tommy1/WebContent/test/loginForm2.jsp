<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<link href="//vjs.zencdn.net/4.9/video-js.css" rel="stylesheet">
<script src="//vjs.zendcdn.net/4.9/video.js"></script>
<style type="text/css"> 
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
 
 
    html, body { height:100%; margin:0px; padding:0px; }
    .main { padding-top:1px;}
  /* .logo { width:200px; margin: 0 auto 10px auto;}   */
    .logo img { width:65%;}  
    .login_box { width:337px; height:200px; padding: 40px 39px 33px 39px; margin: 0 auto; background-color: #fff; 
                 opacity: 0.7; border-radius:5px;}
    .login_box .input_login { border-bottom: 2px solid #c4c5c4; padding: 20px 0 9px 0;}
    .login_box .input_login input { width: 100%; color: #828180; font-size: 15px; border:none; font-family: '돋움';}
    .login_box .check { color: #000; font-size: 14px; padding: 9px 0 15px 0;}
/* html {
	background: url("../menu/images/bb2.jpg") no-repeat center center fixed;
	background-size:cover;
	-ms-filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='bg7.png', sizingMethod='scale')";				
			}
 */
 
 #videobcg { 
    position: absolute;
     top: 0px;
     left: 0px;
     min-width: 90%;
     min-height: 90%;
     width: auto;
     height: auto;
     z-index: -1000;
     overflow: hidden;
} 
</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
				<div class="logo">
	<FORM name='frm' method='POST' action='./loginProc.jsp'>
		<div class="wrapper">
			<div class="main">
					<img src="../menu/images/logo2.png">
				</div>
				<div class="login_box">
					<div class="input_login">
						<td><input type="text" name="id" required placeholder="Please enter your ID">	</td>

					</div>
					<div class="input_login">
						<TD><input type="password" name="passwd" required placeholder="Please enter a password"></TD>
					</div>
		
				
					<td><br><br>
					<label><input type="checkbox">save ID</label> </td>
					<input type='submit' value='login'> <input type='button'
						value='Sign in' onclick="location.href='agreement.jsp'">
				</div>
			</div>
		</div>
		</div>
		<br>
		<br>
		<br>
	</FORM>
<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0"
class="video-js vjs-default-skin" data-setup="{}">
<source src="<%=root %>/images/video/bgb3.mp4" type="video/mp4"/>

	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 