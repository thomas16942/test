<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css"> 
#wrap{width:100vw;height:100vh;background:#000;} 
.black{width:100vw;height:100vh; background:#000;position:fixed;} 
.left{width:90%;hegith:400px; position:fixed;top:40%;left:50px; color:#fff;z-index:100;} 
.left h1{font-size:30pt;line-height:30pt;} 
.left p{font-size:10pt;padding:10px 0;} 
.left ul{padding:20px 0;} 
.left li{font-size:8pt;width:500px; height:30px;line-height:30px; border-bottom:1px #9E9E9E dotted; } 
.right{width:50%;float:right; position:relative;text-align:center;} 
.right img{width:450px;hegith:auto;}


</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 
<div id="wrap"> 
      <div class="black"><!--검은색배경--></div> 
      <div class="left"> 
          <h1>Shanghai</h1> 
     <p>你问我爱你有多深<br> 
        我爱你有几分<br> 
        我的情也真， 我的爱也真， 月亮代表我的心</p> 
          <ul> 
              <li>天气：我希望你得到一个晴朗的天空。</li> 
              <li>期間：- </li> 
              <li>我希望这将是一次愉快的旅程</li> 
              <br>
            <h2>鄧麗君 - 甛蜜蜜</h2>
      <iframe width="280" height="157" src="https://www.youtube.com/embed/axfdk2JtEPg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
         </ul> 
        
     </div><!--.left--> 
     
      <div class="right"> 
          <section><img src="http://cfile8.uf.tistory.com/image/27481334573BD8F806BA5D"></section> 
          <section><img src="http://mblogthumb3.phinf.naver.net/MjAxNzAxMDRfMTIz/MDAxNDgzNTIxMzAwMDgz.5QVyMsgxaQ_BV-wGVOJIPosHqiWigt_w7BpKvd3_Nf4g.hWbZnsHUDueug-qNuh74Jt6cVzUoh4ioXKlfEJv0ZZAg.JPEG.sineee/%EC%83%81%ED%95%B4%EB%82%A0%EC%94%A8.jpg?type=w800"></section> 
          <section><img src="https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/7gx/image/43kUbcjAZeh3ZMu5_hzaqbWpRdM"></section> 
          <section><img src="http://daitso.kds.co.kr/wp-content/uploads/2016/05/seanpyo_%EC%98%88%EC%9B%90_17.jpg"></section> 
          <section><img src="http://www.shanghaitrip.net/data/file/s2_ms/565933015_b739f146_12.jpg"></section> 
          <section><img src="http://image.chosun.com/sitedata/image/201310/24/2013102401196_2.jpg"></section> 
          <section><img src="http://cfile25.uf.tistory.com/image/200A0350515EEDF30E28A4"></section> 
          <section><img src="https://imagescdn.gettyimagesbank.com/500/17/124/899/0/839890066.jpg"></section> 
       </div><!--.right--> 
</div><!--#wrap-->

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 