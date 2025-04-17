<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CravingNest - Purchase Gold Membership</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: #fff8f2;
            font-family: 'Segoe UI', sans-serif;
        }

        .membership-card {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border: 2px solid #ffb347;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        .membership-card h2 {
            text-align: center;
            color: #ff6f61;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: bold;
            color: #333;
        }

        .btn-submit {
            background-color: #ff6f61;
            color: white;
            border: none;
        }

        .btn-submit:hover {
            background-color: #e65c50;
        }
    </style>
    <script>
        function updateCvvInput() {
            var cardType = document.getElementById("cardType").value;
            var cvvInput = document.getElementById("cvv");
            if (cardType === "CREDIT") {
                cvvInput.placeholder = "Enter 3-digit CVV";
                cvvInput.pattern = "\\d{3}";
                cvvInput.maxLength = 3;
            } else if (cardType === "DEBIT") {
                cvvInput.placeholder = "Enter 3-4 digit CVV";
                cvvInput.pattern = "\\d{3,4}";
                cvvInput.maxLength = 4;
            }
        }
    </script>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>

<div class="membership-card">
    <h2>Purchase Gold Membership (₹30)</h2>
    <form action="/process-payment" method="post">
        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="email" value="${email}">

        <div class="mb-3">
            <label class="form-label">Card Type:</label>
            <select name="cardType" id="cardType" class="form-select" onchange="updateCvvInput()" required>
                <option value="">Select Card Type</option>
                <option value="CREDIT">Credit Card</option>
                <option value="DEBIT">Debit Card</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Card Number:</label>
            <input type="text" name="cardNumber" class="form-control" placeholder="1234-5678-9012-3456" pattern="\d{4}-\d{4}-\d{4}-\d{4}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">CVV:</label>
            <input type="text" name="cvv" id="cvv" class="form-control" placeholder="Select card type first" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-submit px-5">Pay Now</button>
        </div>
    </form>
</div>

</body>
</html>
