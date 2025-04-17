<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Payment History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>
<div class="container mt-5">
       
    <h2 class="mb-4">Your Payment History</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>First Name</th>
            <th>Email</th>
            <th>Amount Paid (₹)</th>
            <th>Coupon Code 1</th>
            <th>Coupon Code 2</th>
            <th>Coupon Code 3</th>
            <th>Coupon Expiry</th>
            <th>Transaction ID</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${paymentHistory}">
            <tr>
                <td>${p.firstName}</td>
                <td>${p.email}</td>
                <td>${p.amount}</td>
                <td>${p.couponCode1}</td>
                <td>${p.couponCode2}</td>
                <td>${p.couponCode3}</td>
                <td>${p.couponExpiryDate}</td>
                <td>${p.transactionId}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
