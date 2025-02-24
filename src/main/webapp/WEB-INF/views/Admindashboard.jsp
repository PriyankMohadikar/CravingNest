<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- URI for JSTL which Support Java tab library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>

	<h1>
		Craving<span style="color:orange">Nest</span>
	</h1>
	<br><br>
	<h3>Admin panel </h3>
<h4 class="text-primary">CN , ${user.firstName} ${user.lastName}</h4>

<br><br>
<a href="logout">LOGOUT</a>	
</body>
</html>