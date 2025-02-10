<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForgetPassword</title>
</head>
<body>

	<form action="saveuser" method="post">
		<div>
			<label for="email"> Email :</label> <input type="text" name="email"
				id="email">
		</div>
		<div>
			<button type="submit">Submit</button>
			<a href="login">Return to login</a>
		</div>
	</form>
</body>
</html>