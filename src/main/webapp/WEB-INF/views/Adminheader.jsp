<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- URI for JSTL which Support Java tab library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.profile-pic {
    width: 50px; /* Adjust size */
    height: 50px; /* Ensures perfect circle */
    border-radius: 50%; /* Makes it round */
    object-fit: cover; /* Crops the image to fit perfectly */
}

</style>

<body>


<header id="header" class="header fixed-top d-flex align-items-center">

  <div class="d-flex align-items-center justify-content-between">
        <a href="admindashboard" class="logo d-flex align-items-center">
            <img src="assets/img/CN_logo.jpg" alt="">
            <span class="d-none d-lg-block">Craving<span class="text-warning">Nest</span></span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="${user.profilePicPath }" alt="Profile" class="profile-pic">
            <span class="d-none d-md-block dropdown-toggle ps-2">${user.firstName} ${user.lastName}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${user.firstName} ${user.lastName}</h6>
              <span>${user.role}</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="viewuser?userId=${user.userId}">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
			<li>
                 <a class="dropdown-item d-flex align-items-center" href="edituser?userId=${user.userId}">
	                <i class="bi bi-pencil-square"></i>
	                <span>Update Profile</span>
	            </a>
	        </li>

            
            <li>
              <a class="dropdown-item d-flex align-items-center" href="logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header>
<%@ include file="Adminjs.jsp" %> 
</body>
</html>