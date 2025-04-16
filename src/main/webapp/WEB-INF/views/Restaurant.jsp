<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Restaurants - CravingNest</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    
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
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* Filter Section */
        .filter-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .filter-section .form-label {
            font-weight: 600;
            color: #333;
        }
        .filter-section .form-select, .filter-section .btn {
            border-radius: 8px;
        }
        .filter-section .btn-primary {
            background-color: #ff6f00;
            border-color: #ff6f00;
            transition: background-color 0.3s ease;
        }
        .filter-section .btn-primary:hover {
            background-color: #e65c00;
            border-color: #e65c00;
        }
        .filter-section .btn-reset {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .filter-section .btn-reset:hover {
            background-color: #5a6268;
            border-color: #5a6268;
        }

        /* Card Styles */
        .food-card {
            height: 450px;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color: #fff;
            border: 1px solid #ddd;
        }
        .food-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .food-card .image-container {
            height: 200px;
            overflow: hidden;
            position: relative;
        }
        .food-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .food-card img:hover {
            transform: scale(1.1);
        }
        .card-body {
            height: 250px;
            overflow-y: auto;
            padding: 15px;
            display: flex;
            flex-direction: column;
        }
        .card-body::-webkit-scrollbar {
            width: 6px;
        }
        .card-body::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 3px;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .card-text {
            font-size: 0.9rem;
            color: #333;
            margin-bottom: 10px;
        }
        .category-text {
            font-size: 0.85rem;
            color: #666;
            margin-bottom: 10px;
        }
        .star-rating {
            color: #ffc107;
            font-size: 1rem;
            margin-bottom: 10px;
        }
        .view-details-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 25px;
            font-size: 0.9rem;
            text-align: center;
            text-decoration: none;
            margin-top: auto;
        }
        .view-details-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="Navbar.jsp"></jsp:include>
   
    <!-- Banner -->
    <jsp:include page="Banner.jsp"></jsp:include>
     
    <!-- Filter Section -->
    <div class="container mt-5">
        <div class="filter-section">
            <h3 class="text-center mb-4">Find Your Favorite Restaurants</h3>
            <form method="get" action="restaurants" class="mb-4">
                <div class="row g-3">
                    <div class="col-md-3">
                        <label for="stateId" class="form-label">State</label>
                        <select name="stateId" id="stateId" class="form-select">
                            <option value="">All States</option>
                            <c:forEach var="state" items="${states}">
                                <option value="${ state.stateId }" ${ param.stateId == state.stateId ? 'selected' : '' }>
                                    ${ state.stateName }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="cityId" class="form-label">City</label>
                        <select name="cityId" id="cityId" class="form-select">
                            <option value="">All Cities</option>
                            <c:forEach var="city" items="${cities}">
                                <option value="${ city.cityId }" ${ param.cityId == city.cityId ? 'selected' : '' }>
                                    ${ city.cityName }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="areaId" class="form-label">Area</label>
                        <select name="areaId" id="areaId" class="form-select">
                            <option value="">All Areas</option>
                            <c:forEach var="area" items="${areas}">
                                <option value="${ area.areaId }" ${ param.areaId == area.areaId ? 'selected' : '' }>
                                    ${ area.areaName }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="foodType" class="form-label">Food Type</label>
                        <select name="foodType" id="foodType" class="form-select">
                            <option value="">All Food Types</option>
                            <c:forEach var="foodType" items="${foodTypes}">
                                <option value="${ foodType }" ${ param.foodType == foodType ? 'selected' : '' }>
                                    ${ foodType }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-12 d-flex justify-content-center mt-3">
                        <button type="submit" class="btn btn-warning me-2">Apply Filters</button>
                        <a href="restaurants" class="btn btn-dark reset">Reset Filters</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Food Deals Section -->
    <div class="container mt-5">
        <h2 class="font-weight-bold fs-1 text-center mb-4">Current Food Deals & Offers</h2>
        <div class="row">
            <c:forEach var="location" items="${locations}">
                <div class="col-md-4 mb-4">
                    <div class="card food-card">
                        <div class="image-container">
                            <img src="${location.foodPicPath}" class="card-img-top" alt="Food Image">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${location.title}</h5>
                            <p class="card-text">${location.description}</p>
                            <p class="category-text">
                                <b>Category:</b> ${location.category} | <b>Food Type:</b> ${location.foodType}
                            </p>
                            <p class="star-rating">
                                <b>Rating:</b> 
                                <span>
                                    <c:set var="avgRating" value="${ratingsMap[location.locationId]}"/>
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:choose>
                                            <c:when test="${i <= avgRating}">
                                                <i class="bi bi-star-fill"></i>
                                            </c:when>
                                            <c:when test="${i - 0.5 <= avgRating}">
                                                <i class="bi bi-star-half"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-star"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${avgRating != null}">(${avgRating})</c:if>
                                    <c:if test="${avgRating == null}">(0.0)</c:if>
                                </span>
                            </p>
                            <a href="locationdetails?locationId=${location.locationId}" class="view-details-btn">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        $(document).ready(function() {
            $('#stateId').change(function() {
                var stateId = $(this).val();
                $('#cityId').empty().append('<option value="">All Cities</option>');
                $('#areaId').empty().append('<option value="">All Areas</option>');
                if (stateId) {
                    $.get('/getCities', { stateId: stateId }, function(cities) {
                        $.each(cities, function(index, city) {
                            $('#cityId').append('<option value="' + city.cityId + '">' + city.cityName + '</option>');
                        });
                    });
                }
            });

            $('#cityId').change(function() {
                var cityId = $(this).val();
                $('#areaId').empty().append('<option value="">All Areas</option>');
                if (cityId) {
                    $.get('/getAreas', { cityId: cityId }, function(areas) {
                        $.each(areas, function(index, area) {
                            $('#areaId').append('<option value="' + area.areaId + '">' + area.areaName + '</option>');
                        });
                    });
                }
            });
        });
    </script>
</body>
</html>