<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã�� ������</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<br>
<br>
�̸��Ϸ� ã��
<br>
�̸���: <input type="text" id="email" placeholder="�̸����� �Է����ּ���">
<input type="button" id="sendEmail" onclick="sendEmail()" value="������ȣ ����">
<br>
������ȣ :<input type="text" id="smsNum" placeholder="������ȣ�� �Է����ּ���">
<br>
<input type="button" id="goToServer" onclick="sendNumToServer()" value="Ȯ��">
<input type="button" id="reWrtiepHone" onclick="reWriteEmail()" value="�̸��� ����"> 
<br>
<br>
��ȭ�� ã��
<script type="text/javascript">
var xhr=new XMLHttpRequest();
function sendNumToServer() {
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
	        		 document.getElementById('goToServer').disabled=true;  
	        		 document.getElementById('reWrtiepHone').disabled=true;  
	        		 document.getElementById('smsNum').disabled=true;  
	        		 location.href="reWritePwdPage.jsp?email="+result.messege;
	        		return;
	        	}
	        	alert(result.messege);
	        	return;
	        }
	        alert('��� ����');
	    }
}
function reWritePhone() {
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
	        alert('��� ����');
	    }
}
</script>
</body>
</html>