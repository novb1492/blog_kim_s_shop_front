<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 페이지</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<br>
이메일:<input type="text" id="email" placeholder="이메일을 적어주세요">
<br>
비밀번호:<input type="password" id="pwd" placeholder="비밀번호를 입력해 주세요">
<br>
<input type="button" onclick="doLogin()" value="로그인">&nbsp;<input type="button"onclick="goNaverLogin()"value="네이버 로그인">&nbsp;<input type="button"onclick="goKakaoLogin()"value="카카오톡 로그인">
<br>
<a href="findIdPage.jsp">이메일을 잊어 버리셨나요?</a>&nbsp;<a href="findPwdPage.jsp">비밀번호를 잊어 버리셨나요?</a>
<script>
var xhr=new XMLHttpRequest();
function doLogin() {
	 let data=JSON.stringify({
		 "email":""+document.getElementById('email').value+"",
		 "pwd":""+document.getElementById('pwd').value+""
		 });
	 xhr.open('POST','http://localhost:8080/login',true);
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.withCredentials = true;
	 xhr.send(data);
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	var result=JSON.parse(xhr.response);
	        	if(result.bool){
	        		jwt=xhr.getResponseHeader('Authorization');
		            localStorage.setItem('Authorization', jwt);
		            window.location.href = 'http://localhost:3030/kim_s_Shop/index.jsp';
	        		return;
	        	}	
	        	alert(result.messege);
	        	return;
	        }
	        	 alert('통신 실패');
	        }
}
function goNaverLogin(){
    xhr.open('POST', 'http://localhost:8080/auth/naver', true); //j쿼리 $ajax.({type,url},true가 비동기)
    xhr.send(); /// ajax data부분
    xhr.onload = function() { 
        if(xhr.status==200){
        	location.href=xhr.response;
        }else{
            alert('통신에 실패했습니다');
        }
    }  
}
</script>
</body>
</html>