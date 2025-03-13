<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Location & Food Deals</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">Add New Location & Food Offers</h2>

    <!-- Success Message -->
    <c:if test="${param.success != null}">
        <div class="alert alert-success">✅ Location added successfully!</div>
    </c:if>

    <!-- Form to Add Location -->
    <form action="savelocation" method="POST">
        <div class="mb-3">
            <label class="form-label">Food Place Name</label>
            <input type="text" name="title" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Category</label>
            <input type="text" name="category" class="form-control" placeholder="Fast Food, Pizza, etc." required>
        </div>

        <div class="mb-3">
            <label class="form-label">Food Type</label>
            <input type="text" name="foodType" class="form-control" placeholder="Pizza, Burger, etc." required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Timings</label>
            <input type="text" name="timings" class="form-control" placeholder="9 AM - 9 PM" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Contact Number</label>
            <input type="text" name="contactNumber" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Address</label>
            <textarea name="address" class="form-control" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">City</label>
            <select name="cityId" class="form-control" required>
                <c:forEach var="city" items="${cities}">
                    <option value="${city.cityId}">${city.cityName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Area</label>
            <select name="areaId" class="form-control" required>
                <c:forEach var="area" items="${areas}">
                    <option value="${area.areaId}">${area.areaName}</option>
                </c:forEach>
            </select>
        </div>

<!-- 
        <div class="mb-3">
            <label class="form-label">Active</label>
            <select name="active" class="form-control" required>
                <option value="true">Yes</option>
                <option value="false">No</option>
            </select>
        </div>
 -->

        <button type="submit" class="btn btn-primary">Save Location</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
