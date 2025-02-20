<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- URI for JSTL which Support Java tab library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View User</title>
</head>
<body>
<h1>View User Details</h1>

<h3>
First Name : ${user.firstName} <br>
Last Name : ${user.lastName} <br>
Email : ${user.email} <br>
Gender : ${user.gender} <br>
Role : ${user.role}
</h3>

</body>
</html>