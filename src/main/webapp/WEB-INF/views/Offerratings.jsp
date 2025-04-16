<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Offer Ratings - CravingNest</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    transition: background-color 0.3s ease, color 0.3s ease;
}

body.dark-mode {
    background-color: #1a1a1a;
    color: #f0f0f0;
}

body.dark-mode .comment-card, 
body.dark-mode .card {
    background-color: #2c2c2c;
    color: #f0f0f0;
    border-color: #444;
}

body.dark-mode .form-control {
    background-color: #333;
    color: #fff;
    border-color: #555;
}

body.dark-mode h3, body.dark-mode h4, body.dark-mode p {
    color: #f0f0f0;
}

.dark-mode-toggle {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 1000;
}

.dark-mode-toggle i {
    font-size: 1.5rem;
    cursor: pointer;
    color: #333;
}

body.dark-mode .dark-mode-toggle i {
    color: #f0f0f0;
}

.offer-img-container {
    height: 400px;
    overflow: hidden;
    border-radius: 15px;
    margin-bottom: 20px;
    background: #f3f3f3;
}

.offer-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.offer-img:hover {
    transform: scale(1.1);
}

.card {
    border-radius: 10px;
    border: 1px solid #ddd;
    background-color: #fff;
    padding: 20px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.rating-star {
    color: #ffc107;
    font-size: 1rem;
}

.btn-success {
    border-radius: 25px;
    padding: 10px;
}
</style>
</head>
<body>
<!-- Dark Mode Toggle -->
<div class="dark-mode-toggle">
    <i class="bi bi-moon-stars-fill" id="darkModeIcon"></i>
</div>

<%@ include file="Navbar.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <div class="offer-img-container">
                <c:choose>
                    <c:when test="${not empty offerinfo.offerPicPath}">
                        <img src="${offerinfo.offerPicPath}" class="offer-img" alt="Offer Image">
                    </c:when>
                    <c:otherwise>
                        <div class="d-flex align-items-center justify-content-center h-100 w-100 text-muted">No Image Available</div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="card">
                <h3 class="mb-3">${offerinfo.title}</h3>
                <p class="mb-2">${offerinfo.description}</p>
                <p><strong>Food Type:</strong> ${offerinfo.foodType}</p>
                <p><strong>Start Date:</strong> ${offerinfo.startDate}</p>
                <p><strong>End Date:</strong> ${offerinfo.endDate}</p>
            </div>
        </div>

        <div class="col-md-6">
            <h4 class="mb-4">Comments & Ratings</h4>
            <div class="mb-4" style="max-height: 400px; overflow-y: auto;">
                <c:forEach var="rating" items="${details}">
                    <div class="card mb-3 shadow-sm">
                        <p class="mb-2">${rating.comments}</p>
                        <p class="rating-star">
                            <c:forEach begin="1" end="5" var="i">
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
            </div>

            <hr>
            <h5 class="mb-3">Add your rating:</h5>
            <form action="saveofferratings" method="post">
                <input type="hidden" name="offerId" value="${offerinfo.offerId}">
                <div class="mb-3">
                    <label for="comments" class="form-label">Comments:</label>
                    <textarea class="form-control" name="comments" rows="3" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="rating" class="form-label">Rating (1-5):</label>
                    <select class="form-control" name="rating" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success w-100">Submit Rating</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Dark Mode Script -->
<script>
    const darkModeIcon = document.getElementById('darkModeIcon');
    const body = document.body;

    // Apply saved preference
    if (localStorage.getItem('darkMode') === 'enabled') {
        body.classList.add('dark-mode');
        darkModeIcon.classList.replace('bi-moon-stars-fill', 'bi-sun-fill');
    }

    darkModeIcon.addEventListener('click', () => {
        body.classList.toggle('dark-mode');
        const isDarkMode = body.classList.contains('dark-mode');

        if (isDarkMode) {
            darkModeIcon.classList.replace('bi-moon-stars-fill', 'bi-sun-fill');
            localStorage.setItem('darkMode', 'enabled');
        } else {
            darkModeIcon.classList.replace('bi-sun-fill', 'bi-moon-stars-fill');
            localStorage.setItem('darkMode', 'disabled');
        }
    });
</script>
</body>
</html>
