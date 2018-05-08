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
          <h1>Paris</h1> 
     <p>tu te rappelles de notre premier jour<br> 
        je pense tres souvent a ce moment<br> 
         embrasse-moi comme le jour</p> 
          <ul> 
              <li>Weather : It was colder than I thought.</li> 
              <li>Date : 20170929-20171013</li> 
              <li>Feeling : It was so good.</li> 
              <br>
            <h2>The Chainsmokers - Paris</h2>
      <iframe width="280" height="157" src="https://www.youtube.com/embed/fRNkQH4DVg8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
         </ul> 
        
     </div><!--.left--> 
     
      <div class="right"> 
          <section><img src="https://cache-graphicslib.viator.com/graphicslib/thumbs360x240/2050/SITours/eiffel-tower-dinner-and-seine-river-cruise-in-paris-459739.jpg"></section> 
          <section><img src="http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1507649620/paris-france-louvre-pyramid-PARISCHEAPFLIGHT1017.jpg?itok=4SrEAFAz" ></section> 
          <section><img src="https://media.timeout.com/images/103817003/image.jpg" ></section> 
          <section><img src="https://media.architecturaldigest.com/photos/5931758bf368f9234dedb534/master/pass/Paris_Personalities_GettyImages-546896176-2.jpg" ></section> 
          <section><img src="https://www.frankfurt-airport.com/content/dam/airport/IK_Airlines/AF/AF-banner.jpg/_jcr_content/renditions/cq5dam.web.1280.1280.jpeg./cq5dam.web.1280.1280.jpeg" ></section> 
          <section><img src="https://cdn.fodors.com/ee/files/slideshows/5-20-Things-To-Do-Paris-Summer-2016-Seine-river-cruise.jpg" ></section> 
          <section><img src="https://www.thelocal.fr/userdata/images/article/51f908b9c7ec273623b0fbe474ddd6ea3325151c7d173b80a40a02b7e27667f5.jpg" ></section> 
          <section><img src="http://static-v3a.raileurope-world.com/local/cache-vignettes/L760xH518/istock_72921869_xxlarge-dffde.jpg" ></section> 
      </div><!--.right--> 
</div><!--#wrap-->

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 