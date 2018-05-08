<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
    h1 {
            text-align: center;
        }
        #menubar {
            margin: 0 auto;
            width: 960px;
        }
        a {
            text-decoration: none;
            color: black;
        }
        .menu ul,
        .menu .menu ul {
            list-style: none;
            padding: 0;
        }
        .menu li {
            float: left;
            width: 150px;
            background-color: white;
            line-height: 2em;
            font-weight: 600;
            font-size: 22px;
            text-align: center;
        }

        div.menu li:hover {
            background-color: white;
        }
        div.menu div.menu {
            display: none;
        }
       
        div.menu li:hover div.menu {
            display: block;
        }

</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

    <div id="menubar" class="menu">
        <ul>
            <li><a href="#"><span>Home</span></a></li>

            <li><a href="#"><span>Business</span></a>



                <div class="menu">
                    <ul>
                        <li><a href="#"><span>Java</span></a></li>
                        <li><a href="#"><span>.NE</span></a></li>
                        <li><a href="#"><span>HTML</span></a></li> 
                        <li><a href="#"><span>Java</span></a></li>
                        <li><a href="#"><span>.NE</span></a></li>
                        <li><a href="#"><span>HTML</span></a></li>
                    </ul>

                    <div class="clear"></div>

                </div>

            </li>

            <li><a href="#"><span>Services</span></a></li>

            <li><a href="http://www.naver.com"><span>Support</span></a></li>

        </ul>

        <div clas="clear"></div>

    </div>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 