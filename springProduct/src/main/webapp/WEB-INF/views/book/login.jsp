<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="menu.jsp" />
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron">
			<h1 class="displat-3">로그인</h1>
			</div>
	</div>
	<div class="contatiner" align="center">
		<div class="col-md-4 col-md-offset-4"> 
			<h3 class="form-signin-heading">Please sign in</h3>
		</div>
	
	</div>
	<form name="loginForm" action="j_security_check" method="get" style="width:200px">
			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label>
				<input type="text" class="form-control" placeholder="ID" name='j_username' required autofocus>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" class="form-control" placeholder="Password" name='j_password' required>
			</div>
		<button class="btn btn btn-1g btn-success btn-block" type="submit">로그인</button>			
	</form>
	


</body>
<jsp:include page="footer.jsp" />
</html>