<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add State</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body class="bg-light">
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card p-4 shadow-lg">
					<h2 class="text-center text-dark">Add State</h2>
					<form action="savestate" method="post">
						<div class="mb-3">
							<label for="stateName" class="form-label">State Name:</label> <input
								type="text" class="form-control" name="stateName" id="stateName"
								required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Add
							State</button>
					</form>
					<h4>
					<a href="addcity">AddCity</a>
					</h4> 
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
