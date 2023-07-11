<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DTO login=(DTO)session.getAttribute("login");
	
	String loginMessage=(String)session.getAttribute("loginMessage");
	if(loginMessage==null){
		loginMessage="";
	}else{
		session.removeAttribute("loginMessage");
	}
	
	String id=(String)session.getAttribute("id");
	if(id==null){
		id="";
	}else{
		session.removeAttribute("id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토요일 스터디</title>
<script type="text/javascript">
function loginAccount(){<%--버튼의 클릭이벤트 발생시에 해야하는 행동들을 적어놓은 함수--%>
	if(loginForm.id.value==""){
		alert("아이디를 반드시 입력하세요");
		loginForm.id.focus();
		return;
	}
	if(loginForm.password.value==""){
		alert("비밀번호를 반드시 입력하세요");
		loginForm.password.focus();
		return;
	}
	
	loginForm.action="login_action.jsp"; <%--위의 항목들을 클릭이벤트 발생시에 login_action.jsp로 전달--%>
	loginForm.submit();
}
</script>
</head>
<body>
	<table>
		<%if(login==null) {%>
			<form name="loginForm" method="post">
				<table>
					<tr>
						<td width=100 align="center">아이디</td>
						<td width=600>
							<input type="text" id="id" value="<%=id%>">
						</td>
					</tr>
					<tr>
						<td width=100 align="center">비밀번호</td>
						<td width=600>
							<input type="password" id="password"><%--이부분 에러나서 답지봤는데 이해가 잘안됨 왜 value를 안넣어 비밀번호에는? --%>
						</td>
					</tr>
				</table>
			</form>
			<hr>
			<table>
				<tr>
					<td>
						<input type="button" value="로그인하기" onclick="loginAccount();">
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<button type="button" onclick="location.href='create_account.jsp'">계정만들기</button>
					</td>
				</tr>
			</table>
		<%} else {%>
			<table>
				<tr>
					<td>
						<%=login.getName() %>님이 접속하였습니다
					</td>
				</tr>
			</table>
		<%} %>
	</table>
</body>
</html>