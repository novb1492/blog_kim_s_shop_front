<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ������</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<br>
�̸���:<input type="text" id="email" placeholder="�̸����� �����ּ���">
<br>
��й�ȣ:<input type="password" id="pwd" placeholder="��й�ȣ�� �Է��� �ּ���">
<br>
<input type="button" onclick="doLogin()" value="�α���"> 
<br>
<input type="button"onclick="goNaverLogin()"value="���̹� �α���">

<script>
var xhr=new XMLHttpRequest();
function doLogin() {
	 let data=JSON.stringify({
		 "email":""+document.getElementById('email').value+"",
		 "pwd":""+document.getElementById('pwd').value+""
		 });
	 xhr.open('POST','http://localhost:8080/login',true);
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.send(data);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        		return;
	        	}
	        	alert(result.messege);
	        	return;
	        }
	        alert('��� ����');
}
function goNaverLogin(){
    xhr.open('POST', 'http://localhost:8080/auth/naver', true); //j���� $ajax.({type,url},true�� �񵿱�)
    xhr.send(); /// ajax data�κ�
    xhr.onload = function() { 
        if(xhr.status==200){
        	location.href=xhr.response;
        }else{
            alert('��ſ� �����߽��ϴ�');
        }
    }  
}
</script>
</body>
</html>