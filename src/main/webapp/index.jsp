
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<a href="sinupPage.jsp">회원가입</a>
<a href="loginPage.jsp">로그인</a>
</body>
<script type="text/javascript">
var params = new URLSearchParams(location.search);
var getType= params.get('token');
if(getType!=null){
	console.log(getType);
	localStorage.setItem('Authorization', getType);	
}
</script>
</html>
