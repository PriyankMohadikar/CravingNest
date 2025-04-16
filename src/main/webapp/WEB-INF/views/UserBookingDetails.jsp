<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Of Users</title>
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0.2em 0.6em;
            margin: 0 2px;
        }
        .dataTables_wrapper .dataTables_filter {
            margin-bottom: 15px;
        }
    </style>
   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="Navbar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>${user.firstName} Booking Detials</h1>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">Booking Data</h2>
                            
                            <table id="userTable" class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Restaurants</th>
                                        <th>User</th>
                                        <th>Timings</th>
                                        <th>Booking</th>
                                        <th>Created_AT</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userbooking}" var="b">
                                        <tr>
                                            <td>${b[0]}</td>
                                            <td>${b[1]}</td>
                                            <td>${b[5]}</td>                                            
                                            <td>${b[2]}</td>
                                            <td>${b[3]}</td>
                                            <td>${b[4]}</td>
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



<!-- Bootstrap Bundle with Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables Initialization -->
    <script>
        $(document).ready(function() {
            $('#userTable').DataTable({
                "pageLength": 10,         // 7 users per page
                "paging": true,          // Enable pagination
                "searching": true,       // Enable search
                "ordering": true,        // Enable sorting
                "info": true,           // Show table information
                "lengthMenu": [10, 15, 20, 25], // Options for entries per page (multiples of 7)
                "language": {
                    "search": "Search users:",
                    "lengthMenu": "Show _MENU_ users per page",
                    "info": "Showing _START_ to _END_ of _TOTAL_ users",
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
                "order": [[0, "asc"]]  // Default sort by First Name ascending
            });
        });
    </script>
</body>
</html>