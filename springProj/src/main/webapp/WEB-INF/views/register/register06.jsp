<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="/registerFile06" method="post" enctype="multipart/form-data">
		<p><input type="file" name="picture" ></p>
		<p> <input type="submit" value="업로드~"></p>
	</form>
	<hr />
	<form action="/registerFile02" method="post" enctype="multipart/form-data">
		<p>userId : <input type="text" name="userId" value="gaeddong"/> </p>
		<p>password : <input type="text" name="password" value="java"/> </p>
		<p><input type="file" name="picture" ></p>
		<p> <input type="submit" value="업로드~"></p>
	</form>
	<hr />
	<form action="/registerFile03" method="post" enctype="multipart/form-data">
		<p>userId : <input type="text" name="userId" value="gaeddong"/> </p>
		<p>password : <input type="text" name="password" value="java"/> </p>
		<p><input type="file" name="picture" ></p>
		<p> <input type="submit" value="업로드~"></p>
	</form>
	<hr />
	<form action="/registerFile05" method="post" enctype="multipart/form-data">
		<p>userId : <input type="text" name="userId" value="gaeddong"/> </p>
		<p>password : <input type="text" name="password" value="java"/> </p>
		<p><input type="file" name="picture" ></p>
		<p><input type="file" name="picture2" ></p>
		<p> <input type="submit" value="업로드~"></p>
	</form>
	<form action="/registerFile07" method="post" enctype="multipart/form-data">
	<div>07</div>
		<p>userId : <input type="text" name="userId" value="gaeddong"/> </p>
		<p>password : <input type="text" name="password" value="java"/> </p>
		<p><input type="file" name="picturelist" ></p>
		<p><input type="file" name="picturelist" ></p>
		<p> <input type="submit" value="업로드~"></p>
	</form>
	<form action="/registerFile08" method="post" enctype="multipart/form-data">
	<div>08</div>
		<p>userId : <input type="text" name="userId" value="gaeddong"/> </p>
		<p>password : <input type="text" name="password" value="java"/> </p>
		<p><input type="file" name="pictureArray" multiple ></p>
		<p> <input type="submit" value="업로드~"></p>
	</form>
	
</body>
</html>