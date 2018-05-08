<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<style>
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
    .main { padding-top:148px;}
    
    .login_box { width:337px; height:200px; padding: 45px 44px 38px 44px; margin: 0 auto; background-color: #fff; 
                 opacity: 0.7; border-radius:5px;}
    .login_box .input_login { border-bottom: 2px solid #c4c5c4; padding: 20px 0 9px 0;}
    .login_box .input_login input { width: 100%; color: #828180; font-size: 15px; border:none; font-family: '돋움';}
    .login_box .check { color: #000; font-size: 14px; padding: 9px 0 15px 0;}
html {
	background: url("../menu/images/bb.jpg") no-repeat center center fixed;
	background-size:cover;
	-ms-filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='bg7.png', sizingMethod='scale')";				
			}

</style>
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
  <FORM name='frm' method='POST' action='./loginProc.jsp'>
  
    <div class="wrapper">
        <div class="main">
            <div class="logo">
                <img src="logo.png">
            </div>
            <div class="login_box">
                <div class="input_login">
                    <input type="text" name="id" placeholder="아이디를 입력하세요">
                </div>
                <div class="input_login">
                    <input type="password" name="password" placeholder="비밀번호를 입력하세요">
                </div>
                <div class="check">
                    <label><input type="checkbox">아이디 저장</label>
                       <input type='submit' value='로그인'>
                       <input type='button' value='회원가입' onclick="location.href='agreement.jsp'"> 
                </div>
            </div>
        </div>
    </div>
    <br><br><br>
    </FORM>
</body>
</html>