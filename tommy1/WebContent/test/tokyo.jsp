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
          <h1>Tokyo</h1> 
     <p>一緒に初めて行った東京<br> 
        あなたのことが好きなのに<br> 
        私にまるで興味ない....</p> 
          <ul> 
              <li>天気：思ったより晴天だった</li> 
              <li>期間：20171017-20171021</li> 
              <li>気持ち：友達と一緒においしい寿司食事良かった.</li> 
              <br>
            <h2>AKB48 - 恋するフォーチュンクッキー</h2>
      <iframe width="280" height="157" src="https://www.youtube.com/embed/dFf4AgBNR1E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
         </ul> 
        
     </div><!--.left--> 
     
      <div class="right"> 
          <section><img src="http://www.att-japan.net/entry_ex_af/graphs_dev/2/5/entry_ex_af.11858/thm/a1380_001026_m__FT_440_250__.jpg"></section> 
          <section><img src="https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/wlQ/image/IhghIfC8UpxDbvRYVN73YCjGCqU.jpg"></section> 
          <section><img src="https://www.gotokyo.org/kr/kanko/sumida/spot/images/skytree_40011_01.jpg"></section> 
          <section><img src="https://img-wishbeen.akamaized.net/plan/1473242747229_shibuya-tokyo-backgrounds-wallpaper-japan-travel-161104.jpg"></section> 
          <section><img src="https://img-wishbeen.akamaized.net/plan/1451874221583_Japan.JPG"></section> 
          <section><img src="https://c-lj.gnst.jp/public/article/detail/a/00/00/a0000716/img/basic/a0000716_main.jpg?20180115171843"></section> 
          <section><img src="https://www.tokyo-dome.co.jp/tourists/img/mainvisual_index_005.jpg"></section> 
          <section><img src="https://c-lj.gnst.jp/public/article/detail/a/00/01/a0001016/img/basic/a0001016_main.jpg?20171114132849"></section>  </div><!--.right--> 
</div><!--#wrap-->

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 