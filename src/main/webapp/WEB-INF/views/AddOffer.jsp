<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Offer - CravingNest</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
 <div class="container mt-5">
        <h2 class="text-center mb-4">Add New Offer for Restaurants</h2>

        <c:if test="${param.success != null}">
            <div class="alert alert-success">✅ Offer added successfully!</div>
        </c:if>

        <form action="saveoffer" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Offer Title</label>
                <input type="text" name="title" class="form-control" placeholder="Ex: 30% Off on Pizza" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control" placeholder="Describe offer details..." required></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Food Type</label>
                <input type="text" name="foodType" class="form-control" placeholder="Burger, Pizza, Pasta" required>
            </div>
            
			<div class="mb-3">
				<label for="foodPic" class="form-label"><i
					class="fas fa-salad"></i> Offers/Discounts :</label> <input type="file"
					class="form-control" placeholder="FOODPIC" name="offerPic" />

			</div>
            
            <div class="mb-3">
                <label class="form-label">Start Date</label>
                <input type="date" name="startDate" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">End Date</label>
                <input type="date" name="endDate" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Select Restaurant / Location</label>
                <select name="locationId" class="form-control" required>
                    <option value="">-- Select Location --</option>
                    <c:forEach var="location" items="${locations}">
                        <option value="${location.locationId}">${location.title}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-primary w-100">Save Offer</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
