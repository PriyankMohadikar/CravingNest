<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>CravingNest - Restaurant Offers</title>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .offer-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .offer-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
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
    </style>
</head>
<body>
    <jsp:include page="Navbar.jsp"></jsp:include>

    <div class="container mt-5">
        <div class="filter-section">
            <h3 class="text-center mb-4">Explore the Best Offers</h3>
            <form method="get" action="activeoffers" class="mb-4">
                <div class="row g-3">
                    <div class="col-md-3">
                        <label for="stateId" class="form-label">State</label>
                        <select name="stateId" id="stateId" class="form-select">
                            <option value="">All States</option>
                            <c:forEach var="state" items="${states}">
                                <option value="${state.stateId}" ${param.stateId == state.stateId ? 'selected' : ''}>
                                    ${state.stateName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="cityId" class="form-label">City</label>
                        <select name="cityId" id="cityId" class="form-select">
                            <option value="">All Cities</option>
                            <c:forEach var="city" items="${cities}">
                                <option value="${city.cityId}" ${param.cityId == city.cityId ? 'selected' : ''}>
                                    ${city.cityName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="areaId" class="form-label">Area</label>
                        <select name="areaId" id="areaId" class="form-select">
                            <option value="">All Areas</option>
                            <c:forEach var="area" items="${areas}">
                                <option value="${area.areaId}" ${param.areaId == area.areaId ? 'selected' : ''}>
                                    ${area.areaName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="foodType" class="form-label">Food Type</label>
                        <select name="foodType" id="foodType" class="form-select">
                            <option value="">All Food Types</option>
                            <c:forEach var="foodType" items="${foodTypes}">
                                <option value="${foodType}" ${param.foodType == foodType ? 'selected' : ''}>
                                    ${foodType}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-12 d-flex justify-content-center mt-3">
                        <button type="submit" class="btn btn-warning me-2">Apply Filters</button>
                        <a href="activeoffers" class="btn btn-dark reset">Reset Filters</a>
                    </div>
                </div>
            </form>
        </div>

        <!-- Offers Section -->
        <div class="row mt-4">
            <c:forEach var="offer" items="${offers}">
                <div class="col-md-4 mb-4">
                    <div class="card offer-card h-100">
                        <div class="card-body">
                            <h5 class="card-title">${offer.title}</h5>
                            <p class="card-text">${offer.description}</p>
                            <p><strong>Food Type:</strong> ${offer.foodType}</p>
                            <p><strong>Valid From:</strong> ${offer.startDate}</p>
                            <p><strong>Valid Till:</strong> ${offer.endDate}</p>
                            <p><strong>Restaurant:</strong> 
                                <c:forEach var="location" items="${locations}">
                                    <c:if test="${location.locationId == offer.locationId}">
                                        ${location.title}
                                    </c:if>
                                </c:forEach>
                            </p>
                            <p class="star-rating">
                                <b>Rating:</b> 
                                <span>
                                    <c:set var="avgRating" value="${avgratings[offer.offerId]}"/>
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
                            <a href="offerdetails?offerId=${offer.offerId}" class="btn btn-primary btn-sm">View Details</a>
                        </div>
                        <div class="card-footer text-center">
                            <span class="badge bg-success">Limited Offer</span>
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