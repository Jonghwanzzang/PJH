<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>upload Form</title>
</head>
<body>
	<form action="/item/uploadFormAction" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" multiple/>
		<button type="submit">submit</button>
	</form>

</body>
</html>