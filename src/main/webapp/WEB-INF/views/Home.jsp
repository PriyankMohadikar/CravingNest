<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home - CravingNest</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    

<style>
.hero-banner {
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.6)),
		url('assets/img/foodbanner1.jpg') no-repeat center center/cover;
	height: 75vh;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	padding: 20px;
}

.hero-banner h1 {
	font-size: 3rem;
	font-weight: bold;
}

.hero-banner p {
	font-size: 1.2rem;
	margin-top: 15px;
}

.feature-card {
	border-radius: 15px;
	padding: 30px;
	transition: 0.3s;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.feature-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
}

.feature-icon {
	font-size: 2.5rem;
	color: orange;
	margin-bottom: 15px;
}


</style>
</head>
<body>

	<!-- Navbar -->
	<jsp:include page="Navbar.jsp"></jsp:include>
	<jsp:include page="Banner.jsp"></jsp:include>



	<!-- Features Section -->
	<section class="container my-5">
		<div class="row text-center">
			<div class="col-md-4 mb-4">
				<div class="feature-card bg-white h-100">
					<div class="feature-icon">
						<i class="bi bi-geo-alt-fill"></i>
					</div>
					<h5>Location-Based Search</h5>
					<p>Find the best restaurants and offers near your location
						effortlessly.</p>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="feature-card bg-white h-100">
					<div class="feature-icon">
						<i class="bi bi-star-fill"></i>
					</div>
					<h5>Rated Restaurants</h5>
					<p>View user ratings and reviews before choosing your favorite
						place to eat.</p>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="feature-card bg-white h-100">
					<div class="feature-icon">
						<i class="bi bi-tags-fill"></i>
					</div>
					<h5>Exclusive Offers</h5>
					<p>Unlock special discounts and food deals available only
						through CravingNest.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
