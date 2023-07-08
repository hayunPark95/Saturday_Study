<%@page import="xyz.saturday.dao.DAO"%>
<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	request.setCharacterEncoding("UTF-8");	

	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	
	DTO member=new DTO();
	member.setId(id);
	member.setPassword(password);
	member.setName(name);
	
	DAO.getdDao().insertMember(member);
	response.sendRedirect(request.getContextPath()+"member_login");
%>