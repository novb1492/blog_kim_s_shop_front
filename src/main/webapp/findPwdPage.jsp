<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기 페이지</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<br>
<br>
이메일로 찾기
<br>
이메일: <input type="text" id="email" placeholder="이메일을 입력해주세요">
<input type="button" id="sendEmail" onclick="sendEmail()" value="인증번호 전송">
<br>
인증번호 :<input type="text" id="smsNum" placeholder="인증번호를 입력해주세요">
<br>
<input type="button" id="goToServer" onclick="sendNumToServer()" value="확인">
<input type="button" id="reWrtiepHone" onclick="reWriteEmail()" value="이메일 수정"> 
<br>
<br>
전화로 찾기
<script type="text/javascript">
var xhr=new XMLHttpRequest();
function sendNumToServer() {
	 document.getElementById('goToServer').disabled=true;  
	 document.getElementById('reWrtiepHone').disabled=true;  
	 document.getElementById('smsNum').disabled=true;  
	 let data=JSON.stringify({
		 "email":""+document.getElementById('email').value+"",
		 "tempNum":""+document.getElementById('smsNum').value+""
		 });
	 xhr.open('POST','http://localhost:8080/auth/cofrimEmailNum',true);
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.send(data);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	var result=JSON.parse(xhr.response);
	        	if(result.bool){
	        		alert(result.messege);
	        		 location.href="loginPage.jsp";
	        		return;
	        	}
	       		 document.getElementById('goToServer').disabled=false;  
	    		 document.getElementById('sendEmail').disabled=false;  
	    		 document.getElementById('smsNum').disabled=false;  
	        	alert(result.messege);
	        	return;
	        }
   		 	document.getElementById('goToServer').disabled=false;  
		 	document.getElementById('reWrtiepHone').disabled=false;  
		 	document.getElementById('smsNum').disabled=false;  
	        alert('통신 실패');
	    }
}
function reWriteEmail() {
	 document.getElementById('sendEmail').disabled=false;
	 document.getElementById('email').disabled=false;  
}
function sendEmail() {
	 document.getElementById('sendEmail').disabled=true;  
	 let data=document.getElementById('email');
	 xhr.open('POST','http://localhost:8080/auth/sendEmail',true);
	 xhr.setRequestHeader("Content-Type",'application/x-www-form-urlencoded');
	 xhr.send('email='+data.value);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	var result=JSON.parse(xhr.response);
	        	if(result.bool){
	        		 document.getElementById('sendEmail').disabled=true;
	        		 document.getElementById('email').disabled=true;  
	        		alert(result.messege);
	        		return;
	        	}
	        	alert(result.messege);
	        	 document.getElementById('sendEmail').disabled=false;  
	        	return;
	        }
	        document.getElementById('sendEmail').disabled=false;  
	        alert('통신 실패');
	    }
}
</script>
</body>
</html>