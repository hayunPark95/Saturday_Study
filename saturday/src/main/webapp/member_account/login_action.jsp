<%@page import="xyz.saturday.dao.DAO"%>
<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("error.jsp");
		return;
	}
	request.setCharacterEncoding("utf-8");
	
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	
	DTO login=DAO.getDao().selectAccount(id);
	if(login==null)  {
		session.setAttribute("message", "잘못된 ID 입력");
		session.setAttribute("id", id);
		response.sendRedirect("login.jsp");
		return;
	} 
	if(!login.getPassword().equals("password")){
		session.setAttribute("message", "잘못된 비밀번호 입력");
		session.setAttribute("id", id);
		response.sendRedirect("login.jsp");
		return;
	}
	session.setAttribute("login", login);//로그인상태유지를 위한 권한 관련 객체 세션에다가 저장
	/*
	RequestDispatcher goMain=request.getRequestDispatcher("main.jsp");
	request.setAttribute("id", id);
	request.setAttribute("password", password);
	goMain.forward(request, response);
	*/
	response.sendRedirect("main.jsp");//redirct를 쓰면안되나? main.jsp로 안감;; 
%>
