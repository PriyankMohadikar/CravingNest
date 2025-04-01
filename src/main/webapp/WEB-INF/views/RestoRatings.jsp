<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Offer Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        .offer-img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
        }
        .rating-star {
            color: orange;
        }
    </style>
</head>
<body>

								<!-- For Restaurants Rating and Comments NOT Offers  -->
						<!--** USing Location and Rating table WIth Connecting locationId **-->

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <img src="${location.foodPicPath}" class="offer-img" alt="Offer Image">
            <h3 class="mt-3">${location.title}</h3>
            <p>${location.description}</p>
            <p><strong>Category:</strong> ${location.category} | <strong>Food Type:</strong> ${location.foodType}</p>
            <p><strong>Timings:</strong> ${location.timings}</p>
            <p><strong>Contact:</strong> ${location.contactNumber}</p>
        </div>
        <div class="col-md-6">
            <h4>Comments & Ratings</h4>
            <c:forEach var="rating" items="${ratings}">
                <div class="card mb-3 p-3 shadow">
                    <p>${rating.comments}</p>
                    <p>
					    <c:forEach var="i" begin="1" end="5">
					        <c:choose>
					            <c:when test="${i <= rating.rating}">
					                <i class="fas fa-star rating-star"></i>
					            </c:when>
					            <c:otherwise>
					                <i class="far fa-star rating-star"></i>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					</p>

                </div>
            </c:forEach>

            <hr>
            <h5>Add your rating:</h5>
            <form action="saveRating" method="post">
                <input type="hidden" name="locationId" value="${location.locationId}">
                <div class="mb-3">
                    <label for="comments">Comments:</label>
                    <textarea class="form-control" name="comments" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="rating">Rating (1-5):</label>
                    <select class="form-control" name="rating" required>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success w-100">Submit Rating</button>
            </form>
        </div>
    </div>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
