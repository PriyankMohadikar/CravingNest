<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForgetPassword</title>
</head>
<body>

	<!-- After giving email id then it send Otp via email and  navigate to ChangePassword page
 -->
	<form action="sendotp" method="post">
		<div>
			<label for="email"> Email :</label> <input type="text" name="email"
				id="email">
		</div>
		<div>

			<a href="login">Return to login</a> <input type="submit"
				value="Send Otp" />
		</div>
	</form>
</body>
</html>