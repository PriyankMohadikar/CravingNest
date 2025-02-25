<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL Core Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add City</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body class="bg-light">
	<h1 class="container mt-5 text-secondary">
		Craving<span style="color: orange">Nest</span>
	</h1>
	<div class="container mt-5">
		<h3 class="text-success">NEW CITY</h3>
		<form action="savecity" method="post" class="mt-5">
			<div class="container">
				<label for="cityName">City Name: </label> <input type="text"
					name="cityName">
			</div>
			<br>
			<div class="container">
				<label for="stateId"> State Name: </label>
				 <select name="stateId">
					<option>Select State</option>
					<c:forEach items="${allstate}" var="s">
						<option value="${s.stateId}">${s.stateName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<div class="container">
				<input type="submit" value="Addcity">
			</div>

		</form>
	</div>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
