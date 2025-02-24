<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL Core Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Of Users</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">List of Users</h2>
    
    <table class="table table-striped table-bordered table-hover table-dark ">
        <thead class="table-dark">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userlist}" var="user">
                <tr>
                    <td>${user.firstName }</td>
                    <td>${user.lastName}</td>
                    <td>${user.email }</td>
                    <td>${user.gender }</td>
                    <td>${user.role }</td>
                    <td>
                        <a href="viewuser?userId=${user.userId}" class="btn btn-info btn-sm">View</a>
                        <a href="deleteuser?userId=${user.userId}" class="btn btn-danger btn-sm">Delete</a>
                        <a href="edituser?userId=${user.userId}" class="btn btn-warning btn-sm">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

<!-- Bootstrap JS (optional, for some features like modals) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
