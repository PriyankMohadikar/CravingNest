<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Offer Interest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">

    <style>
        body {
            background: #f8f9fa;
        }

        .interest-card {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 16px;
            background: white;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        }

        .interest-card h2 {
            font-weight: 700;
            color: #ff7f00; /* CravingNest orange */
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-submit {
            background-color: #ff7f00;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 600;
            color: white;
        }

        .btn-submit:hover {
            background-color: #e07000;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        .alert-custom {
            background: #fff3cd;
            color: #d35400;
            border: 1px solid #ffeeba;
            border-radius: 8px;
            font-weight: 500;
        }
    </style>
</head>
<body>

<jsp:include page="Navbar.jsp"/>

<div class="container">
    <div class="interest-card">
        <div class="alert text-center alert-custom">
            🍽️ Based on your cravings, you’ll get tasty offers delivered to your inbox!
        </div>

        <h2 class="text-center">Tell Us What You Crave!</h2>
        <form action="saveuserfoodinterest" method="post">
            <!-- Hidden Fields from Session -->
            <input type="hidden" name="userId" value="${userId}" />
            <input type="hidden" name="email" value="${email}" />

            <div class="mb-3">
                <label for="foodInterest" class="form-label">Enter Your Favorite Food Types</label>
                <textarea class="form-control" name="foodInterest" rows="4" placeholder="e.g., Chinese, Dosa, Desserts, Coffee" required></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-submit">Submit Food Interests</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
