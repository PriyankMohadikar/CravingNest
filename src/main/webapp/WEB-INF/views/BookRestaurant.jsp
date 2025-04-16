<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
							<!-- For Booking Restaurants -->
    <meta charset="UTF-8">
    <title>Booking Details - CravingNest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        body.dark-mode {
            background-color: #1a1a1a;
            color: #f0f0f0;
        }
        body.dark-mode .card {
            background-color: #2c2c2c;
            border-color: #444;
        }
        body.dark-mode .form-control {
            background-color: #333;
            color: #fff;
            border-color: #555;
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
        .details-card {
            border-radius: 15px;
            border: 1px solid #ddd;
            padding: 20px;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .category-text {
            font-size: 0.9rem;
            color: #fff;
            margin-bottom: 10px;
        }
        body.dark-mode .details-card {
            background-color: #2c2c2c;
            border-color: #444;
        }
        body.dark-mode .category-text {
            background-color: #2c2c2c;
            border-color: #444;
        }
        
        .details-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
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

    <!-- Navbar -->
    <jsp:include page="Navbar.jsp"></jsp:include>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <div class="offer-img-container">
                    <img src="${location.foodPicPath}" class="offer-img" alt="Restaurant Image">
                </div>
                <div class="details-card">
                    <h3 class="mb-3">${location.title}</h3>
                    <p class="mb-3">${location.description}</p>
                    <p class="category-text">
                        <b>Category:</b> ${location.category} | <b>Food Type:</b> ${location.foodType}
                    </p>
                    <p class="category-text">
                        <b>Timings:</b> ${location.timings}
                    </p>
                    <p class="category-text">
                        <b>Contact:</b> ${location.contactNumber}
                    </p>
                </div>
            </div>
            <div class="col-md-6">
                <h4 class="mb-4">Book Your Table</h4>
                <form action="savebookings" method="post">
                    <input type="hidden" name="userId" value="${sessionScope.user.userId}"> <!-- Assuming user is in session -->
                    <input type="hidden" name="locationId" value="${location.locationId}">
                    <div class="mb-3">
                        <label for="bookingDate" class="form-label">Booking Date:</label>
                        <input type="date" class="form-control" name="bookingDate" id="bookingDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="bookingTime" class="form-label">Booking Time:</label>
                        <input type="text" class="form-control" name="bookingTime" id="bookingTime" required >
                    </div>
                    <div class="mb-3">
                        <label for="numberOfMembers" class="form-label">Number of Members:</label>
                        <input type="number" class="form-control" name="numberOfMembers" id="numberOfMembers" min="1" max="20" required>
                    </div>
                    <div class="mb-3">
                        <label for="specialRequest" class="form-label">Special Request (Optional):</label>
                        <textarea class="form-control" name="specialRequest" id="specialRequest" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Confirm Booking</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const darkModeIcon = document.getElementById('darkModeIcon');
        const body = document.body;

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