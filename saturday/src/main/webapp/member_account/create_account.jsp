<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String createMassage=(String)session.getAttribute("createMessage");
	if(createMassage==null){
		createMassage="";
	}else{
		session.removeAttribute(createMassage);
	}
	
	DTO create=(DTO)session.getAttribute("create");
	if(create==null){
		create=new DTO();
		create.setId("");
		create.setPassword("");
		create.setName("");
	}else{
		session.removeAttribute("create");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극혐</title>
<script type="text/javascript" language="Javascript">
function createArea(){
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return;
	}
	if(f.password.value==""){
		alert("비밀번호를 입력하세요");
		f.password.focus();
		return;
	}
	if(f.name.value==""){
		alert("이름를 입력하세요");
		f.name.focus();
		return;
	}
	
	f.action="create_account_action.jsp";
	f.submit();
}
</script>
</head>
<body></body>
	<hr>
	<table>
		<tr>
			<td></td>
			<td><%=create %></td>
		</tr>
	</table>
</body>
</html>