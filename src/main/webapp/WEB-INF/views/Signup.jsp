<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp page</title>
</head>
<body>
	<h1>Sign Up</h1>
	<form action="saveuser" method="post">
		<div>
			<label for="firstname"> FirstName :</label> <input type="text"
				name="firstName" id="firstName">
		</div>
		<br>
		<div>
			<label for="lastname"> LastName :</label> <input type="text"
				name="lastName" id="lastName">
		</div>
		<br>
		<div>
			<label for="contact"> Contact Information :</label> <input
				type="number" id="contact" name="contact">
		</div>
		<br>
		<div>
			<label for="email"> Email :</label> <input type="text" name="email"
				id="email">
		</div>
		<br>
		<div>
		<label for="gender"> Gender :</label>
		 Male<input type="radio" name="gender" value="male">
		 Female<input type="radio" name="gender" value="female"> 
		</div> 
			<br>
		<div>
			<label for="password"> PassWord :</label> <input type="password"
				id="password" name="password">
		</div>
		<br>
		<div>
			<label for="conformpassword">Confirm PassWord :</label> <input
				type="password" id="conformpassword" name="conformpassword">
		</div>
		<br> &nbsp;
		<button type="submit">Submit</button>

	</form>
	<br>
	<br> &nbsp; &nbsp; &nbsp;
	<h3>Already created account?</h3>
	<a href="login"><button>Login</button></a>
</body>
</html>