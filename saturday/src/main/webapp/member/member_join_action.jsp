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
	
	DTO saturdaymember=new DTO();
	saturdaymember.setId(id);
	saturdaymember.setPassword(pw);
	saturdaymember.setName(name);
	
	DAO.getdDao().insertMember(saturdaymember);
	
	response.sendRedirect("member_main.jsp");
%>