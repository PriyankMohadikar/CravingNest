<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
</head>
<body>
<h1>
Login page
</h1>
<form action="saveuser">
	<br>
		<div>
			<label for="email"> Email :</label> <input type="text"
				name="email" id="email">
		</div>
		<br>
		<div>
			<label for="password"> PassWord :</label> <input type="password"
				id="password" name="password">
		</div>
		<br>
		<a href="forgetpassword">Forget Password</a>
</form>
	<button type="submit">Login</button>
</body>
</html>