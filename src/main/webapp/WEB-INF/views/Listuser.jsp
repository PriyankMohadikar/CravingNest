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
		<thead>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Email</th>
			<th>Gender</th>
			<th>Role</th>
			
		</thead>
		<c:forEach items="${userlist}" var="u">
			<tr>
				<td>${u.firstName }</td>
				<td>${u.lastName}</td>
				<td>${u.email }</td>
				<td>${u.gender }</td>
				<td>${u.role }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
