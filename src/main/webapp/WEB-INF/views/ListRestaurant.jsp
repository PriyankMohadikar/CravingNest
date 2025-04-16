<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Food Deals & Offers</title>
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0.2em 0.6em;
            margin: 0 2px;
        }
        .dataTables_wrapper .dataTables_filter {
            margin-bottom: 15px;
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
            <h1>Manage Food Deals & Offers</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">FOOD</a></li>
                    <li class="breadcrumb-item active">List of Restaurants</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">Food Deals & Offers</h2>
                            
                            <table id="offerTable" class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Location Title</th>
                                        <th>Food Type</th>
                                        <th>Area</th>
                                        <th>City</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="location" items="${locations}">
                                        <tr>
                                            <td>${location[0]}</td>
                                            <td>${location[1]}</td>
                                            <td>${location[2]}</td>
                                            <td>${location[3]}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${location[4]}">
                                                        <span class="badge bg-success">Active</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-danger">Inactive</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <form action="toggleStatus" method="post">
                                                    <input type="hidden" name="locationId" value="${location[5]}">
                                                    <button type="submit" class="btn btn-warning btn-sm">
                                                        <c:choose>
                                                            <c:when test="${location[4]}">Deactivate</c:when>
                                                            <c:otherwise>Activate</c:otherwise>
                                                        </c:choose>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- jQuery & DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables Initialization -->
    <script>
        $(document).ready(function() {
            $('#offerTable').DataTable({
                "pageLength": 10,         // 10 offers per page
                "paging": true,          // Enable pagination
                "searching": true,       // Enable search
                "ordering": true,        // Enable sorting
                "info": true,           // Show table information
                "lengthMenu": [10, 15, 20, 25], // Options for entries per page
                "language": {
                    "search": "Search offers:",
                    "lengthMenu": "Show _MENU_ offers per page",
                    "info": "Showing _START_ to _END_ of _TOTAL_ offers",
                    "paginate": {
                        "first": "First",
                        "last": "Last",
                        "next": "Next",
                        "previous": "Previous"
                    }
                },
                "columnDefs": [
                    {
                        "targets": 5,    // Actions column
                        "orderable": false  // Disable sorting for Actions
                    }
                ],
                "order": [[0, "asc"]]  // Default sort by Location Title ascending
            });
        });
    </script>
</body>
</html>
