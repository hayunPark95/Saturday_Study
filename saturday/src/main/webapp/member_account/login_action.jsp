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
	}
	session.setAttribute("password", password);
	response.sendRedirect("login.jsp");
%>
