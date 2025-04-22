<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Offer - CravingNest</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <style>
        body {
            background-color: #fdfdfd;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        .form-label i {
            margin-right: 6px;
            color: #e74c3c;
        }
        h2 {
            font-weight: 600;
            color: #d63031;
        }
        .btn-primary {
            background-color: #d63031;
            border: none;
        }
        .btn-primary:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <div class="card p-4 mx-auto" style="max-width: 650px;">
            <h2 class="text-center mb-4"><i class="fas fa-tags"></i> Add New Food Offer</h2>

            <c:if test="${param.success != null}">
                <div class="alert alert-success text-center">✅ Offer added successfully!</div>
            </c:if>

            <form action="saveoffer" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-heading"></i>Offer Title</label>
                    <input type="text" name="title" class="form-control" placeholder="Ex: 30% Off on Pizza" required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-info-circle"></i>Description</label>
                    <textarea name="description" class="form-control" placeholder="Describe offer details..." required></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-utensils"></i>Food Type</label>
                    <input type="text" name="foodType" class="form-control" placeholder="Burger, Pizza, Pasta" required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fas fa-image"></i>Offer Image</label>
                    <input type="file" name="offerPic" class="form-control" />
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label"><i class="fas fa-calendar-alt"></i>Start Date</label>
                        <input type="date" name="startDate" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label"><i class="fas fa-calendar-check"></i>End Date</label>
                        <input type="date" name="endDate" class="form-control" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label"><i class="fas fa-store-alt"></i>Select Restaurant / Location</label>
                    <select name="locationId" class="form-control" required>
                        <option value="">-- Select Location --</option>
                        <c:forEach var="location" items="${locations}">
                            <option value="${location.locationId}">${location.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save me-2"></i>Save Offer</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
