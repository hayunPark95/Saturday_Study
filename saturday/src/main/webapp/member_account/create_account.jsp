<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// id 중복체크 자체를 Oracle에 떠넘기는식으로 진행
	// id가 중복된다면 pk로 걸린 createaccount 테이블에서 걸러낼거기 때문에 따로 JSP로 만들지는 않음
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
<title>토요일 스터디</title>
<script type="text/javascript">
function createAccount(){<%--버튼의 클릭이벤트 발생시에 해야하는 행동들을 적어놓은 함수--%>
	if(createForm.id.value==""){
		alert("아이디를 입력하세요");
		createForm.id.focus();
		return;
	}
	if(createForm.password.value==""){
		alert("비밀번호를 입력하세요");
		createForm.password.focus();
		return;
	}
	if(createForm.name.value==""){
		alert("이름를 입력하세요");
		createForm.name.focus();
		return;
	}
	
	createForm.action="create_account_action.jsp"; <%--위의 항목들을 클릭이벤트 발생시에 create_accoutn_action.jsp로 전달--%>
	createForm.submit();
}
</script>
</head>
<body>
	<form name="createForm" method="post">
	<table>
		<tr>
			<td width=100 align="center">아이디</td>
			<td width=600>
				<input type="text" id="id" value="<%=create.getId()%>">
			</td>
		</tr>
		<tr>
			<td width=100 align="center">비밀번호</td>
			<td width=600>
				<input type="password" id="password" value="<%=create.getPassword()%>">
			</td>
		</tr>
		<tr>
			<td width=100 align="center">이름</td>
			<td width=600>
				<input type="text" id="name" value="<%=create.getName()%>">
			</td>
		</tr>
	</table>
	</form>
	<hr>
	<table>
		<tr>
			<td align="center">
				<input type="button" value="계정생성" onclick="createAccount();">
				<input type="button" value="로그인" onclick="location.href='login.jsp'">
			</td> 
		</tr>
	</table>
</body>
</html>