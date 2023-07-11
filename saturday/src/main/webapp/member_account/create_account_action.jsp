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
	String name=request.getParameter("name");
	
	DTO create=new DTO();
	create.setId(id);
	create.setPassword(password);
	create.setName(name);
	
	int rows=DAO.getDao().createAccount(create);
	
	if(rows>0) {
		response.sendRedirect("login.jsp");
	} else {
		session.setAttribute("createMessage", "중복되는 아이디입니다. 다른 아이디를 선택해주세요"); 
		session.setAttribute("create", create);
		response.sendRedirect("create_account.jsp");
	}
%>