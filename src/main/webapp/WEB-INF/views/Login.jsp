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
<form action="gotostate" method="post">
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
	<button type="submit">Login</button>
</form>
	<a href="addstate">Add State</a>
</body>
</html>