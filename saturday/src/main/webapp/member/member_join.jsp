<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
~~~
</style>
<form id="join" action="<%=request.getContextPath() %>/member/member_join_action.jsp" method="post">
<input type="hidden" id="idCheck" value="0">
<fieldset>
	<legend>회원가입</legend>
	<ul>
		<li>
			<label for="id">ID</label>
			<input type="text" class="id"><span id="idCheck">ID 중복검사</span>	<%--아이디 체크... --%>
			<div id="idEnter">ID를 입력하세요</div>
			<div id="idCehckEnter">ID 중복검사를 실행해주세요</div>	
		</li>
		<li>
			<label for="pw">비밀번호</label>
			<input type="password" class="password">
				<div id="passwordEnter">비밀번호 입력</div>
		</li>
		<li>
			<label for="name">이름</label>
			<input type="text" class="name">
				<div id="nameEnter">이름 입력</div>
		</li>
	</ul>
</fieldset>
</form>
<script type="text/javascript">
	$.("#id").focus();
	$.("#join").submit(function(){
		var submitResult=true;
		
		// 에러페이지 출력? 
	})
</script>