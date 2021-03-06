<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<br>
이메일:<input type="text" id="email" onkeyup="checkEmail()" placeholder="이메일을 입력해주세요">
<br>
이름:<input type="text" id="name" placeholder="이름을 입력해 주세요">
<br>
비밀번호:<input type="password" id="pwd" placeholder="비밀번호를 입력해주세요"> 
<br>
비밀번호 확인:<input type="password" id="pwd2" placeholder="비밀번호를 다시 입력해주세요"> 
<br>
<br>
전화번호:<input type="text" id="phoneNum" onkeyup="checkPhone()" placeholder="전화번호를 입력해주세요">
<input type="button" id="sendsms" onclick="sendsms()" value="인증번호 전송">
<br>
인증번호 :<input type="text" id="smsNum" placeholder="인증번호를 입력해주세요">
<br>
<input type="button" id="goToServer" onclick="sendNumToServer()" value="확인">
<input type="button" id="reWrtiepHone" onclick="reWritePhone()" value="전화번호 수정"> 
<br>
<br>
주소를 입력해주세요
<br>
<input type="text" id="sample6_postcode" placeholder="우편번호" disabled>
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
<br>
<input type="text" id="sample6_address" placeholder="주소" disabled>
<br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목" disabled>
<br>
<input type="button" onclick="insertUser()" value="회원가입">
<br>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var xhr = new XMLHttpRequest();
function sendNumToServer() {
	 let data=JSON.stringify({
		 "phoneNum":""+document.getElementById('phoneNum').value+"",
		 "tempNum":""+document.getElementById('smsNum').value+""
		 });
	 xhr.open('POST','http://localhost:8080/auth/cofrimSmsNum',true);
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.send(data);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	var result=JSON.parse(xhr.response);
	        	if(result.bool){
	        		 document.getElementById('goToServer').disabled=true;
	        		 document.getElementById('sendsms').disabled=true;  
	        		 document.getElementById('reWrtiepHone').disabled=true;  
	        		 document.getElementById('smsNum').disabled=true;  
	        		alert(result.messege);
	        		return;
	        	}
	        	alert(result.messege);
	        	return;
	        }
	        alert('통신 실패');
	    }
}
function reWritePhone() {
	 document.getElementById('sendsms').disabled=false;
	 document.getElementById('phoneNum').disabled=false;  
}
function sendsms() {
	 document.getElementById('sendsms').disabled=true;  
	 let data=document.getElementById('phoneNum');
	 xhr.open('POST','http://localhost:8080/auth/sendSms',true);
	 xhr.setRequestHeader("Content-Type",'application/x-www-form-urlencoded');
	 xhr.send('phoneNum='+data.value);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	var result=JSON.parse(xhr.response);
	        	if(result.bool){
	        		 document.getElementById('sendsms').disabled=true;
	        		 document.getElementById('phoneNum').disabled=true;  
	        		alert(result.messege);
	        		return;
	        	}
	        	alert(result.messege);
	        	 document.getElementById('sendsms').disabled=false;  
	        	return;
	        }
	        document.getElementById('sendsms').disabled=false;  
	        alert('통신 실패');
	    }
}
function checkPhone() {
	let data=document.getElementById('phoneNum');
	 xhr.open('POST','http://localhost:8080/auth/confrimPhoneNum',true);
	 xhr.setRequestHeader("Content-Type",'application/x-www-form-urlencoded');
	 xhr.send('phoneNum='+data.value);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	let color,messege;
	        	console.log(xhr.response);
	        	if(xhr.response=='true'){
	        		color='blue';
	        		messege='';
	        	}else{
	        		color='red';
	        		messege='abc';
	        	}
	        	data.style.backgroundColor=color;
	        	return;	
	        }
	        alert('통신 실패');
	    }
}
function checkEmail(){
	 let data=document.getElementById('email');
	 xhr.open('POST','http://localhost:8080/auth/confrimEmail',true);
	 xhr.setRequestHeader("Content-Type",'application/x-www-form-urlencoded');
	 xhr.send('email='+data.value);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	let color,messege;
	        	console.log(xhr.response);
	        	if(xhr.response=='true'){
	        		color='blue';
	        		messege='';
	        	}else{
	        		color='red';
	        		messege='abc';
	        	}
	        	data.style.backgroundColor=color;
	        	return;	
	        }
	        alert('통신 실패');
	    }
}
function insertUser(){
	 let data=JSON.stringify({
		 "email":""+document.getElementById('email').value+"",
		 "pwd":""+document.getElementById('pwd').value+"",
		 "pwd2":""+document.getElementById('pwd2').value+"",
		 "name":""+document.getElementById('name').value+"",
		 "postcode":""+document.getElementById('sample6_postcode').value+"",
		 "address":""+document.getElementById('sample6_address').value+"",
		 "detailAddress":""+document.getElementById('sample6_detailAddress').value+"",
		 "extraAddress":""+document.getElementById('sample6_extraAddress').value+"",
		 "phoneNum":""+document.getElementById('phoneNum').value+""
		 });
	 console.log(data);
	 xhr.open('POST','http://localhost:8080/auth/insertUser',true);
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.send(data);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	var result=JSON.parse(xhr.response);
	        	if(result.bool){
	        		alert(result.messege);
	        		return;
	        	}
	        	alert(result.messege);
	        	return;
	        }
	        alert('통신 실패');
	    }
}
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</body>
</html>
