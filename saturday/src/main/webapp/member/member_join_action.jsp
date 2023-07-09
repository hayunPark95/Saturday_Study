<%@page import="xyz.saturday.dao.DAO"%>
<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("error.jsp");
		return;
	}

	String id=request.getParameter("id");
	String pw=request.getParameter("password");
	String name=request.getParameter("name");
	
	DTO member=new DTO();
	member.setId(id);
	member.setPassword(pw);
	member.setName(name);
	
	DAO.getdDao().insertMember(member);
	
	response.sendRedirect("member_main.jsp");
%>