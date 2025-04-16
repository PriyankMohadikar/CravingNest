<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Location</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">Location Management</h2>
    
    <ul class="nav nav-tabs mb-4" id="locationTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="state-tab" data-bs-toggle="tab" data-bs-target="#state" type="button" role="tab">Add State</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="city-tab" data-bs-toggle="tab" data-bs-target="#city" type="button" role="tab">Add City</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="area-tab" data-bs-toggle="tab" data-bs-target="#area" type="button" role="tab">Add Area</button>
        </li>
    </ul>

    <div class="tab-content">
        <!-- State Form -->
        <div class="tab-pane fade show active" id="state" role="tabpanel">
            <div class="card p-4 shadow-sm">
                <form action="savestate" method="post">
                    <div class="mb-3">
                        <label for="stateName" class="form-label">State Name</label>
                        <input type="text" class="form-control" name="stateName" id="stateName" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Add State</button>
                </form>
            </div>
        </div>

        <!-- City Form -->
        <div class="tab-pane fade" id="city" role="tabpanel">
            <div class="card p-4 shadow-sm">
                <form action="savecity" method="post">
                    <div class="mb-3">
                        <label for="cityName" class="form-label">City Name</label>
                        <input type="text" class="form-control" name="cityName" id="cityName" required>
                    </div>
                    <div class="mb-3">
                        <label for="stateId" class="form-label">Select State</label>
                        <select name="stateId" id="stateIdForCity" class="form-select" required>
                            <option value="">-- Select State --</option>
                            <c:forEach items="${allstate}" var="s">
                                <option value="${s.stateId}">${s.stateName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Add City</button>
                </form>
            </div>
        </div>

        <!-- Area Form -->
        <div class="tab-pane fade" id="area" role="tabpanel">
            <div class="card p-4 shadow-sm">
                <form action="savearea" method="post">
                    <div class="mb-3">
                        <label for="areaName" class="form-label">Area Name</label>
                        <input type="text" class="form-control" name="areaName" id="areaName" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="cityId" class="form-label">Select City</label>
                        <select name="cityId" id="cityId" class="form-select" required>
                            <option value="">-- Select City --</option>
                            <c:forEach items="${cities}" var="c">
                                <option value="${c.cityId}">${c.cityName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-warning w-100">Add Area</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
