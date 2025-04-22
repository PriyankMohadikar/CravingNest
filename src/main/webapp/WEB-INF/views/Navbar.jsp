<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>

        /* Navbar Styles */
        .navbar-brand {
            font-size: 28px;
            font-weight: bold;
        }
        .navbar-brand span {
            color: orange;
        }
        .profile-pic {
            width: 45px;
            height: 45px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #fff;
        }
        .nav-item {
            display: flex;
            align-items: center;
            cursor:pointer;
        }
        .user-name {
            margin-left: 10px;
            font-weight: bold;
            color: white;
        }
        
        /* Banner */
        .banner {
            background: url('banner.jpg') no-repeat center center/cover;
            height: 250px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: bold;
        }

        /* Card Styles */
        .food-card img {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        
        /*GOld Design*/
        .gold-member-label {
		   padding: 4px 12px;
		   background: linear-gradient(45deg, #FFD700, #FFA500);
		   color: #000;
		   font-weight: bold;
		   border-radius: 12px;
		   font-size: 14px;
		   box-shadow: 0 0 8px rgba(255, 215, 0, 0.8);
		   text-transform: uppercase;
		   letter-spacing: 1px;
		   animation: shine 2s infinite alternate;
		}

@keyframes shine {
    0% {
        background-position: 0%;
    }
    100% {
        background-position: 100%;
    }
}
        
        
        /* Dropdown Styles */
        .ms-2{
        	cursor:pointer;
        }
        .dropdown-menu {
            background-color: #343a40;
            border: none;
        }
        .dropdown-item {
            color: white;
        }
        .dropdown-item:hover {
            background-color: #495057;
            color: white;
        }
</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">Craving<span style="color:orange;">Nest</span></a>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a href="home" class="nav-link">Home</a>
            </li>
            <li class="nav-item">
                <a href="restaurants" class="nav-link">Restaurants</a>
            </li>
            <li class="nav-item">
                <a href="restaurantBooking" class="nav-link">Restaurant Booking</a>
            </li>
            <li class="nav-item">
                <a href="activeoffers" class="nav-link">Offers</a>
            </li>
            <li class="nav-item dropdown">
                <div class="d-flex align-items-center" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    
                    <c:if test="${not empty user}">
					    <img src="${user.profilePicPath}" alt="Profile" class="profile-pic">
					    <span class="user-name">${user.firstName} ${user.lastName}</span>
					  <c:if test="${not empty user.membershipStatus and user.membershipStatus eq 'GOLD'}">
					    <div class="gold-member-label ms-2">GOLD MEMBER</div>
					 </c:if>

					</c:if>
				
                    <span class="ms-2" style="color: white;">▼</span> <!-- Dropdown arrow -->
                </div>
               <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
				   <li><a class="dropdown-item" href="userfoodofferinterest"><i class="bi bi-heart-fill me-2 text-warning"></i>Food Interest</a></li>
				   <li><a class="dropdown-item" href="viewbookinghistory"><i class="bi bi-calendar-check-fill me-2 text-success"></i>Booking Data</a></li>
				   <li><a class="dropdown-item" href="paymenthistory"><i class="bi bi-cash-coin me-2 text-info"></i>Payment History</a></li>
				   <li><a class="dropdown-item" href="purchasemembership"><i class="bi bi-star-fill me-2 text-warning"></i>Buy Gold Membership</a></li>
				   <li><a class="dropdown-item" href="edituser?userId=${user.userId}"><i class="bi bi-pencil-square me-2 text-primary"></i>Edit Profile</a></li>
				   <li><a class="dropdown-item" href="viewuser?userId=${user.userId}"><i class="bi bi-person-lines-fill me-2 text-secondary"></i>View Data</a></li>
				    <li><a class="dropdown-item" href="addlocation"><i class="bi bi-geo-alt-fill me-2 text-danger"></i>Add Restaurants</a></li>
				    <li><a class="dropdown-item" href="addoffer"><i class="bi bi-megaphone-fill me-2 text-warning"></i>Add Offers</a></li>
				    <li><a class="dropdown-item" href="logout"><i class="bi bi-box-arrow-right me-2 text-danger"></i>Logout</a></li>
				</ul>

            </li>
        </ul>
    </div>
</nav>

</body>

</html>