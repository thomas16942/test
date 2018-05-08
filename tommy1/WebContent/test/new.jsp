<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
.modal {
  opacity: 0;
  visibility: hidden;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  text-align: left;
  background: rgba(0,0,0, .6);
  transition: opacity .25s ease;
}
.modal_bg {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  cursor: pointer;
}
.modal-state {
  display: none;
}
.modal-state:checked + .modal {
  opacity: 1;
  visibility: visible;
}

.modal-state:checked + .modal .modal__inner {
  top: 0;
}

.modal_inner {
  transition: top .25s ease;
  position: absolute;
  top: -20%;
  right: 0;
  bottom: 0;
  left: 0;
  width: 50%;
  margin: auto;
  overflow: auto;
  background: #fff;
  border-radius: 5px;
  padding: 1em 2em;
  height: 50%;
}

.modal_close {
  position: absolute;
  right: 1em;
  top: 1em;
  width: 1.1em;
  height: 1.1em;
  cursor: pointer;
}

.modal_close:after,
.modal_close:before {
  content: '';
  position: absolute;
  width: 2px;
  height: 1.5em;
  background: #ccc;
  display: block;
  transform: rotate(45deg);
  left: 50%;
  margin: -3px 0 0 -1px;
  top: 0;
}

.modal_close:hover:after,
.modal_close:hover:before {
  background: #aaa;
}

.modal_close:before {
  transform: rotate(-45deg);
}

@media screen and (max-width: 768px) {
	
  .modal_inner {
    width: 90%;
    height: 90%;
    box-sizing: border-box;
  }
}

.btn {
  cursor: pointer;
  background: #EAEAEA;
  display: inline-block;
  padding: .5em 1em;
  color: #fff;
  border-radius: 3px;
}

.btn:hover,
.btn:focus {
  background: #2ecc71;
}

</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div>
  <p>
    <label class="btn" for="open-pop">열기</label>
  </p>
</div>


<input class="modal-state" id="open-pop" type="checkbox" />
<div class="modal">
  <label class="modal_bg" for="open-pop"></label>
  <div class="modal_inner">
    <label class="modal_close" for="open-pop"></label>
    <h2>popup 제목</h2>
    <p>내용</p>
  </div>
</div>

</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 