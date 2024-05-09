<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

Connection con = null;
PreparedStatement pstmt = null;
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/scott";
String id = "root";
String pw = "adminuser";

String sql = "INSERT INTO members(id, name, pwd, phone) VALUES(?,?,?,?)";

//insertForm.jsp 에서 전송된 데이터들을 이용하여 Members 테이블에 레코드를 추가하세요

int result = 0;

try {
	Class.forName(driver);
	con = DriverManager.getConnection(url, id, pw);
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, (String)request.getParameter("userid"));
	pstmt.setString(2, (String)request.getParameter("name"));
	pstmt.setString(3, (String)request.getParameter("pwd"));
	pstmt.setString(4, (String)request.getParameter("phone"));
	result = pstmt.executeUpdate();
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	try {
		if (con != null)
	con.close();
		if (pstmt != null)
	pstmt.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

if(result == 1){
	response.sendRedirect("MemberMGR.jsp");
}
%>

