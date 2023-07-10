<%@page import="xyz.saturday.dao.DAO"%>
<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendRedirect("member_login.jsp");
		return;
	}
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	
	DTO saturdaymember=DAO.getdDao().selectMember(id);
	if(saturdaymember==null||saturdaymember.getPassword().equals(password)){
		session.setAttribute("message", "검색된 회원정보가 없습니다");
		response.sendRedirect("member_login.jsp");
		return;
	}
%>