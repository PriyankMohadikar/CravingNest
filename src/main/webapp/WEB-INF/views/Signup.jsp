<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SignUp Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script>
        function toggleDarkMode() {
            document.body.classList.toggle("bg-dark");
            document.body.classList.toggle("text-white");
            let formElements = document.querySelectorAll(".form-control");
            formElements.forEach(el => el.classList.toggle("bg-dark"));
            formElements.forEach(el => el.classList.toggle("text-white"));
        }
    </script>
</head>
<body class="bg-dark text-white">
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card p-4 shadow-lg">
					<h1 class="text-center text-dark">Sign Up</h1>
					<form action="saveuser" method="post">
						<div class="mb-3">
							<label for="firstName" class="form-label">First Name:</label> <input
								type="text" class="form-control" name="firstName" id="firstName"
								required>
						</div>
						<div class="mb-3">
							<label for="lastName" class="form-label">Last Name:</label> <input
								type="text" class="form-control" name="lastName" id="lastName"
								required>
						</div>
						<div class="mb-3">
							<label for="contact" class="form-label">Contact
								Information:</label> <input type="number" class="form-control"
								id="contact" name="contact" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email:</label> <input
								type="email" class="form-control" name="email" id="email"
								required>
						</div>
						<div class="mb-3">
							<label class="form-label">Gender:</label>
							<div>
								<input type="radio" name="gender" value="male" required>
								Male <input type="radio" name="gender" value="female" required>
								Female
							</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password:</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
						<div class="mb-3">
							<label for="confirmPassword" class="form-label">Confirm
								Password:</label> <input type="password" class="form-control"
								id="confirmPassword" name="confirmPassword" required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Sign
							Up</button>
					</form>
					<div class="text-center mt-3">
						<h6>Already have an account?</h6>
						<a href="login" class="btn btn-outline-secondary">Login</a>
					</div>
					<div class="text-center mt-3">
						<button class="btn btn-dark" onclick="toggleDarkMode()">Toggle
							Dark Mode</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
