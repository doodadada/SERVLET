<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>92_JSP_ServletEx.jsp</title>
</head>
<body>
<%-- <h1>
<%=request.getAttribute("id") %>님 의 내역
</h1>
<table style="border:1px solid black;">
<tr>
<td>이름</td>
<td><%=request.getAttribute("name") %></td>
</tr>
<tr>
<td>성별</td>
<td><%=request.getAttribute("gender") %></td>
</tr>
<tr>
<td>가입 인사</td>
<td><%=request.getAttribute("content") %></td>
</tr>
<tr>
<td>구매 내역</td>
<td><%
	String[] item = request.getParameterValues("item");
	if(item == null){
%>없음
<%
	}else{
		for(int i = 0; i<item.length;i++){
			out.print(item[i]+" / ");
		}
	}
%></td>
</tr>
<tr>
<td>직업</td>
<td><%=request.getAttribute("job") %></td>
</tr>

</table> --%>
<%
String id = (String) request.getAttribute("id");
String pwd = (String) request.getAttribute("pwd");
String gender = (String) request.getAttribute("gender");
String content = (String) request.getAttribute("content");
String [] itemName = (String[]) request.getAttribute("item");
String job = (String) request.getAttribute("job");
%>
<h2>
	아이디 : <%=id %><br />
	암  호 : <%=pwd %><br />
	성  별 : <%=gender %><br />
	하고싶은 말 : <%=content %><br />
	구입하신 상품 :
<%
	 for(String i: itemName){
		 out.print(i+" ");
	 }
%><br />
직업 : <%=job %><br />
</h2>

</body>
</html>