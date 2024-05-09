<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>071_LoginForm.jsp</title>
</head>
<body>
	<%
	if (session.getAttribute("loginUser") == null) {
	%>
	<form method="post" action="072_Login_do.jsp">
		<label for="id">아이디 : </label><input type="text" id="id" name="id"
			value="scott"><br /> <label for="pwd">암 &nbsp; 호 : </label><input
			type="password" name="pwd" value="1234"><br /> <input
			type="submit" value="로그인">
	</form>
	<%
	}else{
		response.sendRedirect("073_main.jsp");
	}
	%>

</body>
</html>