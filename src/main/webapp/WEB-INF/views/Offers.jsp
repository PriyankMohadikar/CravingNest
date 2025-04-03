<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>CravingNest - Restaurant Offers</title>
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
    </style>
</head>
<body>
    <jsp:include page="Navbar.jsp"></jsp:include>

    <div class="container mt-4">
        <h2 class="text-center mb-4">Latest Food Offers & Deals</h2>
        
        <div class="row">
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
                                    (${avgRating})
                                </span>
                            </p>
                            <a href="offerdetails?offerId=${offer.offerId }">Rating</a>
                            <!--				 FOR RAIING PARTICULAR OFFERS   ------------
                            <a href="offerrating?offerId=${offer.offerId }">Rating</a> -->
                        </div>
                        <div class="card-footer text-center">
                            <span class="badge bg-success">Limited Offer</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>