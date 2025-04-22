<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Location & Food Deals | CravingNest</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .form-label {
            font-weight: bold;
        }

        .btn-primary {
            background-color: #FF6347;
            border-color: #FF6347;
        }

        .btn-primary:hover {
            background-color: #E5533D;
            border-color: #E5533D;
        }

        .card-header {
            background-color: #FF6347;
            color: white;
            font-weight: bold;
        }

        .form-control {
            border-radius: 0.5rem;
        }

        .mb-3 i {
            color: #FF6347;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 99, 71, 0.25);
        }

        .custom-select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            padding-right: 30px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header text-center">
            <h2>Add New Location & Food Offers</h2>
        </div>
        <div class="card-body">
            <form action="savelocation" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-store"></i> Food Place Name</label>
                    <input type="text" name="title" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-tag"></i> Category</label>
                    <input type="text" name="category" class="form-control" placeholder="Fast Food, Pizza, etc." required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-pizza-slice"></i> Food Type</label>
                    <input type="text" name="foodType" class="form-control" placeholder="Pizza, Burger, etc." required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-pen"></i> Description</label>
                    <textarea name="description" class="form-control" required></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-clock"></i> Timings</label>
                    <input type="text" name="timings" class="form-control" placeholder="9 AM - 9 PM" required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-phone-alt"></i> Contact Number</label>
                    <input type="text" name="contactNumber" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-map-marker-alt"></i> Address</label>
                    <textarea name="address" class="form-control" required></textarea>
                </div>

                <div class="mb-3">
                    <label for="foodPic" class="form-label"><i class="fas fa-camera-retro"></i> Restaurant/Place Image:</label>
                    <input type="file" class="form-control" placeholder="FOODPIC" name="foodPic" />
                </div>

                <!-- State Dropdown -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-globe-americas"></i> State</label>
                    <select name="stateId" id="stateId" class="form-control custom-select" required>
                        <option value="">-- Select State --</option>
                        <c:forEach var="state" items="${states}">
                            <option value="${state.stateId}">${state.stateName}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- City Dropdown -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-city"></i> City</label>
                    <select name="cityId" id="cityId" class="form-control custom-select" required>
                        <option value="">-- Select City --</option>
                    </select>
                </div>

                <!-- Area Dropdown -->
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-location-arrow"></i> Area</label>
                    <select name="areaId" id="areaId" class="form-control custom-select" required>
                        <option value="">-- Select Area --</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Save Location</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function () {
    // When a state is selected
    $("#stateId").change(function () {
      var stateId = $(this).val();
      $("#cityId").html('<option>Loading...</option>');  // Loading text for cities

      $.ajax({
        url: "/getCities", // Your AJAX endpoint
        type: "GET",
        data: { stateId: stateId },
        success: function (cities) {
          var options = '<option value="">-- Select City --</option>';
          $.each(cities, function (i, city) {
            options += '<option value="' + city.cityId + '">' + city.cityName + '</option>';
          });
          $("#cityId").html(options);
          $("#areaId").html('<option>-- Select Area --</option>'); // Reset areas
        },
        error: function () {
          $("#cityId").html('<option>Error loading cities</option>');
        }
      });
    });

    // When a city is selected
    $("#cityId").change(function () {
      var cityId = $(this).val();
      $("#areaId").html('<option>Loading...</option>');  // Loading text for areas

      $.ajax({
        url: "/getAreas", // Your AJAX endpoint
        type: "GET",
        data: { cityId: cityId },
        success: function (areas) {
          var options = '<option value="">-- Select Area --</option>';
          $.each(areas, function (i, area) {
            options += '<option value="' + area.areaId + '">' + area.areaName + '</option>';
          });
          $("#areaId").html(options);
        },
        error: function () {
          $("#areaId").html('<option>Error loading areas</option>');
        }
      });
    });
  });
</script>

</body>
</html>
