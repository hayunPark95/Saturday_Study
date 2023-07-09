<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message=(String)session.getAttribute("message");
	if(message==null){
		message="";
	}else{
		session.removeAttribute("message");
	}
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<br>
		<form action="member_login_action.jsp" id="jf" method="post">
			<ul>
				<li>
					<label>ID</label>
					<input type="text" id="id">
				</li>
				<li>
					<label>비밀번호</label>
					<input type="password" id="pw">
				</li>
			</ul>
			<button type="submit" id="loginB" onclick="location.href='member_mypage.jsp'">로그인</button>
			<button onclick="find_id()">아이디 찾기</button>
			<button onclick="find_pw()">비밀번호 찾기</button>
		</form>
	<script type="text/javascript">
		function find_id(){
			alert("화요일까지 만들어보기");
		}
		function find_pw(){
			alert("화요일까지 만들어보기");
		}
	</script>
</body>
</html>