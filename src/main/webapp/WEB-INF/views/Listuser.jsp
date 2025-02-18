<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- URI for JSTL which Support Java tab library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Of Users</title>
</head>
<body>
	<h1>ListUser</h1>
	<table border=1>
		<tr>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Email</th>
			<th>Gender</th>
			<th>Role</th>
			
		</tr>
		<c:forEach items="${userlist}" var="user">
			<tr>
				<td>${user.firstName }</td>
				<td>${user.lastName}</td>
				<td>${user.email }</td>
				<td>${user.gender }</td>
				<td>${user.role }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
