<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
// updateMember_do.jsp
// 데이터베이스 연결하고, 전달된 내용을 레코드를 수정하세요
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

String sql = "UPDATE members SET pwd=?, name=?, phone=? where id=?";

//insertForm.jsp 에서 전송된 데이터들을 이용하여 Members 테이블에 레코드를 추가하세요

int result = 0;

try {
	Class.forName(driver);
	con = DriverManager.getConnection(url, id, pw);
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, (String)request.getParameter("pwd"));
	pstmt.setString(2, (String)request.getParameter("name"));
	pstmt.setString(3, (String)request.getParameter("phone"));
	pstmt.setString(4, (String)request.getParameter("id"));
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