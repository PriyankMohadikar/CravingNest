<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Offer Ratings</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Add Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
.offer-img {
	width: 100%;
	height: 400px;
	object-fit: cover;
	border-radius: 10px;
	background: #f3f3f3; /* Placeholder background */
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	color: #888;
}

.rating-star {
	color: orange;
}
</style>
</head>
<body>
	<%@ include file="Navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6">
				<c:choose>
					<c:when test="${not empty offerinfo.offerPicPath}">
						<img src="${offerinfo.offerPicPath}" class="offer-img"
							alt="Offer Image">
					</c:when>
					<c:otherwise>
						<div class="offer-img">No Image Available</div>
					</c:otherwise>
				</c:choose>
				<h3 class="mt-3">${offerinfo.title}</h3>
				<p>${offerinfo.description}</p>
				<p>
					<strong>Food Type:</strong> ${offerinfo.foodType}
				</p>
				<p>
					<strong>Start Date:</strong> ${offerinfo.startDate}
				</p>
				<p>
					<strong>End Date:</strong> ${offerinfo.endDate}
				</p>
			</div>
			<div class="col-md-6">
				<h4>Comments & Ratings</h4>
				<c:forEach var="rating" items="${details}">
					<div class="card mb-3 p-3 shadow">
						<p>${rating.comments}</p>
						<p>
							<c:forEach begin="1" end="${rating.rating}">
								<i class="fas fa-star rating-star"></i>
							</c:forEach>
						</p>
					</div>
				</c:forEach>
				<hr>
				<h5>Add your rating:</h5>
				<form action="saveofferratings" method="post">
					<input type="hidden" name="offerId" value="${offerinfo.offerId}">
					<div class="mb-3">
						<label for="comments">Comments:</label>
						<textarea class="form-control" name="comments" required></textarea>
					</div>
					<div class="mb-3">
						<label for="rating">Rating (1-5):</label> <select
							class="form-control" name="rating" required>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
					<button type="submit" class="btn btn-success w-100">Submit
						Rating</button>
				</form>
			</div>
		</div>
	</div>

	<script src="https://kit.fontawesome.com/a076d05399.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
