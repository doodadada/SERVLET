package com.himedia.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Foward_useServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Foward_useServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 현재 서블릿이 method="get"으로 호출 될때 실행되는 메서드
		// jsp 페이지에 있던 request 와 reponse 가 전송되어 와서 매개변수(request, reponse)에 저장됩니다.
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		if (id.equals("hong") && pwd.equals("1234")) {
			request.setAttribute("name", "홍길동");
			RequestDispatcher rd = request.getRequestDispatcher("CH02/082_LoginOk.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("ch02/081_Login_forward_servlet.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
