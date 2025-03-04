<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>City List</title>
</head>
<body>

	<h1>CN | List City</h1>
	<div class="container mt-4">
		<h2 class="text-center mb-4">List of City</h2>

		<table
			class="table table-striped table-bordered table-hover table-dark ">
			<thead class="table-dark">
				<tr>
					<th>CityID</th>
					<th>City Name</th>
					<th>State Name</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${city}" var="c">
					<tr>
						<td>${c.cityId}</td>
						<td>${c.cityName }</td>
						<td>${c.stateName }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>



</body>
</html>