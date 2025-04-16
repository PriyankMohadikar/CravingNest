<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View User</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
        }
        .card {
            max-width: 500px;
            margin: 80px auto;
            border-radius: 1rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #212529;
            color: white;
            font-weight: 600;
            text-align: center;
            border-radius: 1rem 1rem 0 0;
        }
        .card-body p {
            margin-bottom: 12px;
            font-size: 16px;
        }
        .label {
            font-weight: 600;
            color: #495057;
        }
    </style>
</head>
<body>

    <div class="card">
        <div class="card-header">
            User Details
        </div>
        <div class="card-body">
            <p><span class="label">First Name:</span> ${user.firstName}</p>
            <p><span class="label">Last Name:</span> ${user.lastName}</p>
            <p><span class="label">Email:</span> ${user.email}</p>
            <p><span class="label">Gender:</span> ${user.gender}</p>
            <p><span class="label">Role:</span> ${user.role}</p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
