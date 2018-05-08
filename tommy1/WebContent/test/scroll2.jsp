<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
    <style media="screen">
* {
	margin: 0;
	padding: 0;
	text-align: center;
}

.d_1 {
	/*background-image: url(img/name7.png);*/
	background-repeat: no-repeat;
	background-size: cover;
	height: 80vh;
	overflow: hidden;
	background-attachment: fixed;
}

.d_1 header {
	text-align: center;
	max-width: 50%;
	color: white;
	position: relative;
	left: 50%;
	top: 50%;
	transform: translateX(-50%) translateY(-50%);
}
.d_1 header h1 {
	margin-bottom: 15px;
	color: white;
}
.v1 {
	background-image: url(../images/paris_1.jpg);
}
.v2 {
	background-image: url(../images/t2-2.png);
}
.img {
	text-align: center;
}

.m {
	font-family: "돋움", font-size : 20px;
	font-style: normal;
	color: orange;
	font-weight: bold;
}
.m2 {
	font-family: "굴림", font-size : 10px;
	font-style: normal;
	color:silver;
	font-weight: bold;
}
#aside{
 width:500px;
 float:left;
 text-align: center;
}
#section{
width:500px;
float:left;
text-align: center;
}
#wrap{overflow:hidden;}

TABLE{
  margin: 0 auto;     
  border-color: white;    
  border-width: 1px;       
  border-style: solid;       
  border-collapse: collapse; 
  text-align: center;
}
TH{
  border-color: white;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  color: black;            /* 글자 색 */ 
  background-color:white;   /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */
}
td{
  border-color: white;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  text-align: left
  ;
 
  background-color: white; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */  
}
 

</style>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->

 <div class="d_1 v1">
    <header>
     <img src="../images/tra.png" width="700px"></a><br><br>
     <img src="../images/where.png" width="400px"></a><br><br>
     <a href="../index.jsp"><img src="../images/more.png" width="100px"></a><br>
    </header>
  </div>
  <br><br><br><br>
 <div class="m">
 낯선 세상으로 떠나는 설렘 그리고 끌림, 달콤한 여행
 </div><br><br>
 <div class="m2">
 눈부실 정도로 아름다웠던 여행이 보여주는 멋진 추억! 설렘으로 잠 못 이루었던 지난 날들. <br><br>
 우연히 시작된 여행에서 이제 일상처럼 생활의 일부가 된 여행은 아름다운 추억이다.<br><br>
 어느 순간 여행의 사진만 바라봐도 멀쩡했던 가슴이 두근거리고 감춰뒀던 여행의 추억이 떠오르는 여행처럼 ...<br><br>
 </div>
 
<table>
   <TR>
   <TH>
   <a href="../index.jsp"><img src="../images/papa.jpg" width="500px"></a>&nbsp;&nbsp;</TH>
   <TD>
   <a href="../index.jsp"><img src="../images/jiu.jpg" width="500px"></a></TD>
   </TR>
   <tr>
   <th> It's like tasting a slice of your heaven</th>
   <th> Our coffee news is a weekly publication</th>
   </tr>
   <tr>
   <td></td>
   <td></td>
   </tr>
   <tr>
   <td>따뜻한 내려온 충분히 있는 있다. 청춘은 피어나기 얼마나 부패뿐이다. <br>봄바람을 가장 천자만홍이 이 그것은 바로 보라. </td>
   <td>따뜻한 내려온 충분히 있는 있다. 청춘은 피어나기 얼마나 부패뿐이다. <br>봄바람을 가장 천자만홍이 이 그것은 바로 보라. </td>
   </tr>
   <tr>
   <td><a href="../index.jsp">읽기</a></td>
   <td><a href="../index.jsp">읽기</a></td>
   </tr>
      </table>

  
<!--   <div class="d_1 v2">
    <header>
    <a href="https://www.youtube.com/embed/iVEdjdpNMGc"target="_self");"><img src="../images/tt2.png" width="150px"></a> 
    </header>
  </div> -->
  

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 