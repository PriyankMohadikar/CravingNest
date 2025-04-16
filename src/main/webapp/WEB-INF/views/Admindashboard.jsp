<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
        <jsp:include page="Adminjs.jsp"></jsp:include>
    
    <style>
        /* Custom CSS for cards */
        .info-card {
            background: #fff; /* White background */
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s ease;
            width: 300px; /* Fixed width for consistency */
            min-height: 200px; /* Fixed height for consistency */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .info-card:hover {
            transform: translateY(-5px);
        }
        .card-body {
            padding: 0;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        .card-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }
        .card-title span {
            font-size: 0.9rem;
            color: #777;
        }
        .card-content {
            display: flex;
            align-items: center;
            gap: 20px;
            flex-grow: 1;
        }
        .card-icon {
            width: 50px;
            height: 50px;
            background: #f5f7fa;
            border-radius: 50%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .card-icon i {
            font-size: 1.5rem;
            color: #007bff;
        }
        .card-details h6 {
            font-size: 1.8rem;
            font-weight: 700;
            color: #222;
            margin: 0 0 5px 0;
        }
        .card-details .filtered {
            font-size: 1rem;
            color: #555;
            margin-bottom: 10px;
        }
        .card-details .trend {
            font-size: 0.9rem;
            font-weight: 500;
        }
        .text-success {
            color: #28a745 !important;
        }
        .text-danger {
            color: #dc3545 !important;
        }
        .text-muted {
            color: #888 !important;
        }
        .filter .dropdown-menu {
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .filter .dropdown-item:hover {
            background: #e9ecef;
        }
        .row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        /* Ensure two cards per row */
        .col-xxl-4.col-md-6 {
            flex: 0 0 calc(50% - 10px); /* Adjust for gap */
            max-width: calc(50% - 10px);
        }
    </style>
    <jsp:include page="Admincss.jsp"></jsp:include>
 	<jsp:include page="Adminjs.jsp"></jsp:include>
 </head>
<body>
    <jsp:include page="Adminheader.jsp"></jsp:include>
    <jsp:include page="Adminsidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>CravingNest</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
                    <li class="breadcrumb-item active">DATA</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">
                    <!-- Row 1: Users and Locations -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>
                                    <li><a class="dropdown-item" href="/admindashboard?filter=today">Today</a></li>
                                    <li><a class="dropdown-item" href="/admindashboard?filter=thismonth">This Month</a></li>
                                    <li><a class="dropdown-item" href="/admindashboard?filter=lastmonth">Last Month</a></li>
                                    <li><a class="dropdown-item" href="/admindashboard?filter=thisyear">This Year</a></li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Total Users <span>| ${filterLabel}</span></h5>
                                <div class="card-content">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="card-details">
                                        <h6>${totalUsers}</h6>
                                        <div class="filtered">Filtered: ${filteredCount}</div>
                                        <c:if test="${percentageChange != 'N/A'}">
                                            <div class="trend">
                                                <span class="text-${trendDirection == 'increase' ? 'success' : 'danger'} fw-bold">${percentageChange}%</span>
                                                <span class="text-muted ps-1">${trendDirection}</span>
                                            </div>
                                            <c:choose>
                                                <c:when test="${filterLabel == 'This Month'}">
                                                    <span class="text-muted small">Last Month: ${usersLastMonth}</span>
                                                </c:when>
                                                <c:when test="${filterLabel == 'Last Month'}">
                                                    <span class="text-muted small">Two Months Ago: ${usersLastMonth}</span>
                                                </c:when>
                                                <c:when test="${filterLabel == 'This Year'}">
                                                    <span class="text-muted small">Last Year: ${usersLastYear}</span>
                                                </c:when>
                                            </c:choose>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card">
                            <div class="card-body">
                                <h5 class="card-title">Total Locations <span>| All Time</span></h5>
                                <div class="card-content">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-geo-alt"></i>
                                    </div>
                                    <div class="card-details">
                                        <h6>${totalLocations}</h6>
                                        <div class="filtered">Last Month: ${locationsLastMonth}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Row 2: Offers and Booking -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card">
                            <div class="card-body">
                                <h5 class="card-title">Total Offers <span>| All Time</span></h5>
                                <div class="card-content">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-tag"></i>
                                    </div>
                                    <div class="card-details">
                                        <h6>${totalOffers}</h6>
                                        <div class="filtered">Active: ${activeOffers}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card">
                            <div class="card-body">
                                <h5 class="card-title">Total Booking <span>| All Time</span></h5>
                                <div class="card-content">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-calendar-check"></i> <!-- Changed to a booking-related icon -->
                                    </div>
                                    <div class="card-details">
                                        <h6>${totalbooking}</h6>
                                        <div class="filtered">Confirmed: ${confirmbooking}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>