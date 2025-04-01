<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home Page - CravingNest</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Navbar Styles */
        .navbar-brand {
            font-size: 28px;
            font-weight: bold;
        }
        .navbar-brand span {
            color: orange;
        }
        .profile-pic {
            width: 45px;
            height: 45px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #fff;
        }
        .nav-item {
            display: flex;
            align-items: center;
        }
        .user-name {
            margin-left: 10px;
            font-weight: bold;
            color: white;
        }
        
        /* Banner */
        .banner {
            background: url('banner.jpg') no-repeat center center/cover;
            height: 250px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: bold;
        }

        /* Card Styles */
        .food-card img {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
   <jsp:include page="Navbar.jsp"></jsp:include>
   
    <!-- Food Deals Banner -->
    <div class="banner">
		<img src="assets/img/Foodbanner.jpeg" alt="CravingNest Banner" class="img-fluid" style="height: 70vh;width: 100%;">
    </div>

    <!-- Food Deals Section -->
    <div class="container mt-4">
        <h2 class="font-weight-bold fs-1 text-center mb-4">Current Food Deals & Offers</h2>

        <div class="row">
            <c:forEach var="location" items="${locations}">
                <div class="col-md-4">
                    <div class="card food-card">
                        <img src="${location.foodPicPath}" class="card-img-top" alt="Food Image">
                        <div class="card-body">
                            <h5 class="card-title">${location.title}</h5>
                            <p class="card-text">${location.description}</p>
                            <p><b>Category:</b> ${location.category} | <b>Food Type:</b> ${location.foodType}</p>
                            <p><b>Timings:</b> ${location.timings}</p>
                            <p><b>Contact:</b> ${location.contactNumber}</p>
                            <a href="locationdetails?locationId=${location.locationId}" class="btn btn-primary w-100 mt-2">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
