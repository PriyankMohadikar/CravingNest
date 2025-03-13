<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Area</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <style>
        .container {
            max-width: 500px;
            margin-top: 50px;
        }
        .form-card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-card">
            <h2 class="text-center mb-4">Add New Area</h2>
            
            <form action="savearea" method="post">
                <div class="mb-3">
                    <label for="areaName" class="form-label fw-bold">Area Name</label>
                    <input type="text" 
                           class="form-control" 
                           id="areaName" 
                           name="areaName" 
                           placeholder="Enter area name"
                           required>
                </div>

                <div class="mb-3">
                    <label for="cityId" class="form-label fw-bold">Select City</label>
                    <select class="form-select" 
                            id="cityId" 
                            name="cityId" 
                            required>
                        <option value="" disabled selected>-- Select City --</option>
                        <c:forEach var="city" items="${cities}">
                            <option value="${city.cityId}">${city.cityName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">
                        Save Area
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle (optional, for certain components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>
</body>
</html>