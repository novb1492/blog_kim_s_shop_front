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
<input type="hidden" id=email value="<%=s%>">
<input type="button"  onclick="test()">
<script type="text/javascript">
function test() {
	console.log(document.getElementById('email').value);
}
</script>
</body>
</html>