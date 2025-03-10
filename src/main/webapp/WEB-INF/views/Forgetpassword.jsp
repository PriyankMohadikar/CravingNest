<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        .forgot-box {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            background-color: #ffffff;
        }
    </style>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle("bg-dark");
            let box = document.querySelector(".forgot-box");
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
                <div class="forgot-box p-4 shadow-lg">
                    <h3 class="text-center mb-4"><i class="fas fa-key me-2"></i>Forgot Password</h3>
                    <p class="text-center text-muted mb-4">Enter your email to receive an OTP</p>
                    <form action="sendotp" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label"><i class="fas fa-envelope me-2"></i>Email:</label>
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-paper-plane me-2"></i>Send OTP</button>
                    </form>
                    <div class="text-center mt-3">
                        <a href="login" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Return to Login</a>
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