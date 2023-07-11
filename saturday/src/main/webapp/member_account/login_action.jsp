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
		session.setAttribute("message", "잘못된 비밀번호 입력");
		session.setAttribute("id", id);
		response.sendRedirect("login.jsp");
		return;
	} 
	if(!login.getPassword().equals("password")){
		
	}
	session.setAttribute("password", password);
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토요일 스터디</title>
<script type="text/javascript">
function passwordError(){<%--버튼의 클릭이벤트 발생시에 해야하는 행동들을 적어놓은 함수--%>
	if(f.password.value==""){
		alert("비밀번호를 반드시 입력하세요");
		f.password.focus();
		return;
	}
	
	f.action="find_pw.jsp"; <%--위의 항목들을 클릭이벤트 발생시에 login_action.jsp로 전달--%>
	f.submit();
}

function idError(){
	if(f.id.value==""){
		alert("ID를 반드시 입력하세요");
		f.id.focus();
		return;
	}
	f.action="find_id.jsp";
	f.submit();
}
</script>
</head>
<body>
	<table>
		<tr>
			<td>
				<input type="button" value="잘못된 비밀번호 입력시" onclick="passwordError();">
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="잘못된 ID 입력시" onclick="idError();">
			</td>
		</tr>
	</table>
</body>
</html>