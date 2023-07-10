<%@page import="xyz.saturday.dao.DAO"%>
<%@page import="xyz.saturday.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("id")==null){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	String id=request.getParameter("id");
	
	DTO member=DAO.getdDao().selectMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%if(member==null) {%>
		<div><span class="id">[<%=id %>]</span>는 사용 가능한 아이디</div>
		<div>
			<button type="button" onclick="useId();">아이디 사용하기</button>
		</div>
		<script type="text/javascript">
		function useId(){
			opener.join.id.value="<%=id%>";
			opener.join.id.idCheckResult.value="1";
			window.close();
		}
		</script>
	<%}else{ %>
		<div><span class="id">[<%=id %>]</span>는 이미 사용중
		<br>새로운 아이디를 입력하세요</div>
		<div>
			<form name="checkForm" action="" method="POST">
				<input type="text" name="id">
				<button type="button" onclick="checkId();">중복확인하기</button>
			</form>
		</div>
		<div id="message"></div>
		<script type="text/javascript">
		function checkId(){
			var id=check.id.value;
			if(id==""){
				document.getElementById("message").innerHTML="아이디를 입력하세요";
				return;
			}else{
			checkForm.submit();
			}
		}
		
		</script>
	<%} %>
</body>
</html>
