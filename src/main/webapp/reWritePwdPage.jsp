<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String s=request.getParameter("email");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ �缳�� ������</title>
</head>
<body>
<a href=index.jsp>Kim's Shop</a>
<input type="password" id="newPwd" placeholder="�� ��й�ȣ�� �Է����ּ���">
<br>
<input type="password" id="newPwd2" placeholder="�� ��й�ȣ�� �ѹ��� �Է����ּ���">
<br>
<input type="button"  onclick="updatePwd()" value="�����ϱ�">
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
	        alert('��� ����');
	    }
}
</script>
</body>
</html>