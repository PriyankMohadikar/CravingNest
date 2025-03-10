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
</head>
<body>
    <jsp:include page="Adminjs.jsp"></jsp:include>
    <jsp:include page="Admincss.jsp"></jsp:include>
    <jsp:include page="Adminheader.jsp"></jsp:include>
    <jsp:include page="Adminsidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>User List</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">List</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">List of Users</h2>
                            
                            <table id="userTable" class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userlist}" var="user">
                                        <tr>
                                            <td>${user.firstName}</td>
                                            <td>${user.lastName}</td>
                                            <td>${user.email}</td>
                                            <td>${user.gender}</td>
                                            <td>${user.role}</td>
                                            <td>
                                                <a href="viewuser?userId=${user.userId}" class="btn btn-info btn-sm">View</a>
                                                <a href="deleteuser?userId=${user.userId}" class="btn btn-danger btn-sm">Delete</a>
                                                <a href="edituser?userId=${user.userId}" class="btn btn-warning btn-sm">Update</a>
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