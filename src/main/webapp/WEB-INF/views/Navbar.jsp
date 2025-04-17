<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					</c:if>
                    
                    <!--  For user profile and name from user session
                    <img src="${user.profilePicPath}" alt="Profile" class="profile-pic">
                    <span class="user-name">${user.firstName} ${user.lastName}</span>
                     -->
                    
                    <span class="ms-2" style="color: white;">▼</span> <!-- Dropdown arrow -->
                </div>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <!-- Add more dropdown items here later -->
					<li><a class="dropdown-item" href="userfoodofferinterest">Food Interest</a></li>
                    <li><a class="dropdown-item" href="viewbookinghistory">Booking data</a></li>
                    <li><a class="dropdown-item" href="paymenthistory">Payment History</a></li>
                    <li><a class="dropdown-item" href="purchasemembership">Buy Gold MemberShip</a></li>
                    <li><a class="dropdown-item" href="edituser?userId=${user.userId }">Edit Profile</a></li>
                    <li><a class="dropdown-item" href="viewuser?userId=${user.userId }">View Data</a></li>
                    <li><a class="dropdown-item" href="addlocation">Add Restaurants</a></li>
                    <li><a class="dropdown-item" href="addoffer">Add offers</a></li>
                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                    
                    
                </ul>
            </li>
        </ul>
    </div>
</nav>

</body>

</html>