<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<br>
	<form action="member_join_action.jsp" id="jf" method="post">
	<input type="hidden" id="idCheckResult" value="0">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" id="id">
				<button type="submit" id="checkB" onclick="location.href='id_check.jsp'" method="post">중복검사</button>
				<div id="message_id" class="error">아이디 입력은 필수입니다</div>
				<div id="cehckM" class="error">반드시 중복검사를 실행햐아 합니다</div>
			</li>
			<li>
				<label for="password">비밀번호</label>
				<input type="password" id="pw" maxlength="4">
				<div id="message_pw" class="error">비밀번호는 4글자 이내로 입력해주세요</div>
			</li>
			<li>
				<label for="name">이름</label>
				<input type="text" id="name">
				<div id="message_name" class="error">이름입력은 필수입니다</div>
			</li>
		</ul>
		<button type="submit" id="joinB">회원가입</button>
		<button type="reset">재입력</button>
	</form>
	
	<script type="text/javascript">
	$("#id").focus();
	
	$("#jf").submit(function(){
		var submitResult=true;
		
		$(".error").css("display","none");
		
		if($("#id").val()==""){
			$("#message_id").css("display", "block");
			submitResult=false;
		}
		if($("#pw").val()==""){
			$("#message_pw").css("display", "block");
			submitResult=false;
		}	
		if($("#name").val()==""){
			$("#message_name").css("display", "block");
			submitResult=false;
		}
		return submitResult;
	});
	$("#idCheck").click(function(){
		$("#message_id").css("display","none");
		
		if($("#id").val()==""){
			$("#message)id").css("display","block");
			return;
		}
		window.open("<%=request.getContextPath()%>/member/id_check.jsp?id="+$("#id").val(),"idCheck");
	});
	$("#id").chage(function(){
		$("#idCheckResult").val("0");	
	});
	</script>
</body>
</html>