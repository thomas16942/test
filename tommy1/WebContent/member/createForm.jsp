<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
html {
	background: url("../images/gg.jpg") no-repeat center center fixed;
	background-size:cover;
	-ms-filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='bg7.png', sizingMethod='scale')";				
			}

</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function inCheck(f){
	if(f.id.value==""){
		alert("아이디를 입력해 주시기 바랍니다.");
		f.id.focus();
		return false;
	}	if(f.passwd.value==""){
		alert("비밀번호를 입력해 주시기 바랍니다.");
		f.passwd.focus();
		return false;
	}	if(f.repasswd.value==""){
		alert("비밀번호를 다시 한번 입력해 주시기 바랍니다.");
		f.repasswd.focus();
		return false;
	}   if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다.\n 다시 입력해 주시기 바랍니다 ");
		f.passwd.focus();
		return false;
	}   if(f.mname.value==""){
		alert("이름을 입력해 주시기 바랍니다.");
		f.mname.focus();
		return false;
	}	 if(f.email.value==""){
		alert("이메일을 입력해 주시기 바랍니다.");
		f.email.focus();
		return false;
	}	 if(f.job.value=="0"){
		alert("직업을 선택해주세요.");
		f.job.focus();
		return false;
	}	
}
function idCheck(id){
	if(id==""){
		alert("아이디를 입력하세요");
		document.frm.id.focus();
	}else{
		var url = "./id_proc.jsp";
		url += "?id=" +id;
		
		wr = window.open(url,"ID 검색","width=500","height=500");
		wr.movoTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	}
}
function emailCheck(email){
		if(email==""){
			alert("이메일을 입력하세요");
		    document.frm.email.focus();
		}else{
			var url = "./email_proc.jsp";
			url += "?email=" +email;
			
			wr = window.open(url,"Email 검색","width=500","height=500");
			wr.movoTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		
		}
}



</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>


</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원가입</DIV>
 
 
<FORM 
      name='frm'
      method='POST'
      action='./prcreateProc.jsp'
      enctype="multipart/form-data"
      onsubmit="return inCheck(this)">
  <TABLE>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fname"accept=".jpg,.png,.gif"><br>
      <marquee><h10>사진은 JPG,PNG,GIF파일만 올려주세요.</br></h10></marquee>
      </TD>
    </TR>
      <TR>
      <TH>*아이디</TH>
      <TD><input type="text" name="id" size="15"placeholder="필수입력" required>
      <button type="button" onclick="idCheck(document.frm.id.value)">ID 중복 확인</button>
      </TD>
    </TR>
    <TR>
      <TH>*비밀번호</TH>
      <TD><input type="password" name="passwd" size="15"placeholder="필수입력" required ><br>
      *비밀번호를 입력해주세요.
      </TD>
    </TR>
    <TR>
      <TH>*비밀번호 확인</TH>
      <TD><input type="password" name="repasswd" size="15"placeholder="필수입력" required><br>
      *비밀번호를 한번 더 입력해주세요.
      </TD>
    </TR>
      <TR>
      <TH>*이름</TH>
      <TD><input type="text" name="mname" size="15"placeholder="필수입력" required><br>
      *주민등록에 등록된 이름을 적어주세요.
      </TD>
    </TR>
        <TR>
      <TH>전화번호</TH>
      <TD><input type="text" name="tel" size="15" placeholder="000-0000-0000">
      </TD>
    </TR>
   <TR>
      <TH>*이메일</TH>
      <TD><input type="email" name="email" size="20" placeholder="sample@email.com" required>
      <button type="button" onclick="emailCheck(document.frm.email.value)">Email중복확인</button>
      </TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD><input type="text" name="zipcode" size="7"  id="sample6_postcode" placeholder="우편번호">
      <button type="button" onclick="sample6_execDaumPostcode()">주소 검색</button>
      </TD>
    </TR>
     <TR>
      <TH>주소</TH>
      <TD><input type="text" name="address1" size="40"id="sample6_address" placeholder="주소"><br>
    <input type="text" name="address2" size="40" id="sample6_address2" placeholder="상세주소">
      </TD>
      
    </TR>
      <TR>
      <TH>직업</TH>
      <TD><select name="job">
      <option value='0'>선택하세요</option>
      <option value='A01'>회사원</option>
      <option value='A02' selected>전산관련직</option>
      <option value='A03'>연구전문직</option>
      <option value='A04'>일반자영업</option>
      <option value='A05'>공무원</option>
      <option value='A06'>각종학교학생</option>
      <option value='A07'>의료인</option>
      <option value='A08'>법조인</option>
      <option value='A09'>종교/언론/예술인</option>
      <option value='A10'>기타</option>
      </select> * 직업을 선택하세요
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원가입'>
    <input type='reset' value='내용 초기화'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 