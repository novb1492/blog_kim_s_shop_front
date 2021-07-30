<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String s=request.getParameter("email");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 재설정 페이지</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<input type="password" id="newPwd" placeholder="새 비밀번호를 입력해주세요">
<br>
<input type="password" id="newPwd2" placeholder="새 비밀번호를 한번더 입력해주세요">
<br>
<input type="button"  onclick="updatePwd()" value="변경하기">
<input type="hidden" id=email value="<%=s%>">

<script type="text/javascript">
function updatePwd() {
	 let data=JSON.stringify({
		 "email":""+document.getElementById('email').value+"",
		 "newPwd":""+document.getElementById('newPwd').value+"",
		 "newPwd2":""+document.getElementById('newPwd').value+""
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
	        alert('통신 실패');
	    }
}
</script>
</body>
</html>