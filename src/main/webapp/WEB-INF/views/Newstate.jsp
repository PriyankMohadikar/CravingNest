<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add State</title>
</head>
<body>
<h1>Add state</h1>
	<form action="savestate" method="post">
		<div>
			<label for="stateName"> Add State Name :</label>
			 <input type="text" name="stateName" id="stateName">
		</div>
		<button type="submit">Add state</button>
	</form>
</body>
</html>