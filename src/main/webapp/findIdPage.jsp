<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>이메일 찾기 페이지</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<br>
전화번호:<input type="text" id="phoneNum" placeholder="전화번호를 입력해주세요">
<input type="button" id="sendsms" onclick="sendsms()" value="인증번호 전송">
<br>
인증번호 :<input type="text" id="smsNum" placeholder="인증번호를 입력해주세요">
<br>
<input type="button" id="goToServer" onclick="sendNumToServer()" value="확인">
<input type="button" id="reWrtiepHone" onclick="reWritePhone()" value="전화번호 수정"> 
<input type="button" id="findEmail" onclick="findEmail()" value="찾기" disabled="disabled">
<script type="text/javascript">
var xhr=new XMLHttpRequest();
function findEmail() { 
	 let data=document.getElementById('phoneNum');
	 xhr.open('POST','http://localhost:8080/auth/findEmail',true);
	 xhr.setRequestHeader("Content-Type",'application/x-www-form-urlencoded');
	 xhr.send('phoneNum='+data.value);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	var result=JSON.parse(xhr.response);
	        	if(result.bool){
	        		alert(result.messege);
	        		location.href="loginPage.jsp";
	        		return;
	        	}
	        	alert(result.messege);
	        	return;
	        }
	        alert('통신 실패');
	    }
}
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
	        		 document.getElementById('findEmail').disabled=false;
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
</script>
</body>
</html>