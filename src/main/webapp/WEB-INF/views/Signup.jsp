<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SignUp Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        .signup-box {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            background-color: #ffffff;
        }
    </style>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle("bg-dark");
            let box = document.querySelector(".signup-box");
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
            <div class="col-md-4 col-lg-6">
                <div class="signup-box p-4 shadow-lg">
			     <h1 class="text-center mb-4">Craving<span class="text-warning">Nest</span></h1>
                    <h3 class="text-center mb-4">Sign Up</h3>
                    <form action="saveuser" method="post">
                        <div class="mb-3">
                            <label for="firstName" class="form-label"><i class="fas fa-user me-2"></i>First Name:</label>
                            <input type="text" class="form-control" name="firstName" id="firstName" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label"><i class="fas fa-user me-2"></i>Last Name:</label>
                            <input type="text" class="form-control" name="lastName" id="lastName" required>
                        </div>
                        <div class="mb-3">
                            <label for="contact" class="form-label"><i class="fas fa-phone me-2"></i>Contact:</label>
                            <input type="number" class="form-control" id="contact" name="contact" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label"><i class="fas fa-envelope me-2"></i>Email:</label>
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-venus-mars me-2"></i>Gender:</label>
                            <div>
                                <input type="radio" name="gender" value="male" required> 
                                <i class="fas fa-mars me-1"></i>Male
                                <input type="radio" name="gender" value="female" required class="ms-3"> 
                                <i class="fas fa-venus me-1"></i>Female
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><i class="fas fa-lock me-2"></i>Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label"><i class="fas fa-lock me-2"></i>Confirm Password:</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-user-check me-2"></i>Sign Up</button>
                    </form>
                    <div class="text-center mt-3">
                        <h6>Already have an account?</h6>
                        <a href="login" class="btn btn-outline-secondary"><i class="fas fa-sign-in-alt me-2"></i>Login</a>
                    </div>
                    <div class="text-center mt-3">
                        <button class="btn btn-secondary" onclick="toggleDarkMode()">
                            <i class="fas fa-moon me-2"></i>Toggle Dark Mode
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>