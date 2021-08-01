
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<br>
<c:set var="email" value="${param.email}" />
<c:choose>
    <c:when test="${email==null }">
       	<a href="sinupPage.jsp">회원가입</a>
		<a href="loginPage.jsp">로그인</a>
    </c:when>
    <c:otherwise>
       ${param.email}님 환영 합니다
       <a href="#" onclick="goMypage()">마이페이지</a>
    </c:otherwise>
</c:choose>




</body>
<script type="text/javascript">
var params = new URLSearchParams(location.search);
var getType= params.get('token');
if(getType!=null){
	console.log(getType);
	localStorage.setItem('Authorization', getType);	
}
function goMypage() {
	var jwt=localStorage.getItem('Authorization');
	 var xhr = new XMLHttpRequest();
	 xhr.open('POST', 'http://localhost:8080/api/mypage');
	 xhr.setRequestHeader('Authorization', jwt);
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.withCredentials = true;
	 xhr.send();
	 xhr.onload=function(){
	        if(xhr.status==200){
	        	location.href="myPage.js";
	        }
	 }
}
</script>
</html>
