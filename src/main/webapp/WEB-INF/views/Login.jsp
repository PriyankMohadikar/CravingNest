<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        .login-box {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            background-color: #ffffff;
            position: relative; /* Added for positioning the toggle button */
        }
        .dark-mode-toggle {
            position: absolute;
            top: 10px;
            left: 10px;
        }
        .signup-section {
            background-color: #0d6efd; /* Bootstrap primary blue */
            color: white;
            padding: 10px;
            border-radius: 5px;
        }
        .signup-section a {
            color: white;
            text-decoration: underline;
        }
    </style>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle("bg-dark");
            let box = document.querySelector(".login-box");
            box.classList.toggle("bg-dark");
            box.classList.toggle("text-white");
            let formElements = document.querySelectorAll(".form-control");
            formElements.forEach(el => el.classList.toggle("bg-dark"));
            formElements.forEach(el => el.classList.toggle("text-white"));
        }
    </script>
</head>
<body class="bg-light">
                   
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="login-box p-4 shadow-lg">
                    <h1 class="text-center mb-4">Craving<span class="text-warning">Nest</span></h1>
                    <h3 class="text-center mb-4"><i class="fas fa-sign-in-alt me-2"></i>Login</h3>
                    <form action="authenticate" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label"><i class="fas fa-envelope me-2"></i>Email:</label>
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><i class="fas fa-lock me-2"></i>Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <a href="forgetpassword" class="text-decoration-none"><i class="fas fa-question-circle me-1"></i>Forgot Password?</a>
                            <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt me-2"></i>Login</button>
                        </div>
                    </form>
                    
                    <div class="text-center mt-3">
                        <p class="text-danger">${error} ${errors}</p>
                        <div class="signup-section">
                            <p class="mb-0">New user? <a href="signup"><i class="fas fa-user-plus me-1"></i>Create an account</a></p>
                        </div>
                    </div>

                    <div class="dark-mode-toggle">
                        <button class="btn btn-link p-0" onclick="toggleDarkMode()">
                            <i class="fas fa-moon"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>