<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="container">
<h3>등록</h3>


<script type="text/javascript">
function incheck(f){
if(f.title.value==""){
	 alert("제목을 입력하세요");
	 f.title.focus();
	 return false;
	 
     }
if(f.content.value==""){
	 alert("내용을 입력하세요");
	 f.content.focus();
	 return false;
     }
}
</script>

</head>
<body>
<jsp:include page="/menu/top2.jsp"></jsp:include>
<div class="title">
등록
</div>
<form action="createProc.jsp" 
      method="POST"
      onsubmit="return incheck(this)"> <!-- 사이트에서 직접 호출하면 안된다 -->

<table class="table table-bordered">
  <tr>
  <th>제목</th>
  <td><input type="text" name="title" size="30"></td>
  </tr>
  <tr>
  <th>내용</th>
  <td><textarea rows="10" cols="35" name="content"></textarea>
<!--   <iframe width="280" height="157" src="https://www.youtube.com/embed/AQ6GmpMu5L8" frameborder="0" allow="autoplay; encrypted-media" ></iframe>
<iframe width="280" height="157" src="https://www.youtube.com/embed/45ETZ1xvHS0" frameborder="0" allow="autoplay; encrypted-media" ></iframe>
 --></table>




<div class="bottom">
<button>전송해용 <IMG src='../gallery/plane.jpg' width='20px'></button>
</div>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body>
</form>
</div>
</html>