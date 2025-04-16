<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin User Report</title>
    <style>
        .dataTables_wrapper .dataTables_filter {
            float: right;
            margin-bottom: 15px;
        }

        .dataTables_wrapper .dataTables_filter label {
            font-weight: 500;
        }

        .dataTables_wrapper .dataTables_filter input {
            width: 220px;
            padding: 6px 10px;
            margin-left: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .dt-buttons {
            margin-bottom: 10px;
        }

        .dt-button {
            background-color: #0d6efd;
            color: white !important;
            border: none;
            padding: 6px 12px;
            margin-right: 5px;
            border-radius: 6px;
            font-size: 14px;
        }

        .dt-button:hover {
            background-color: #0b5ed7;
        }
    </style>
    <jsp:include page="Admincss.jsp"></jsp:include>
    <jsp:include page="Adminjs.jsp"></jsp:include>
    <!-- Include All DataTables JS -->
    <jsp:include page="Alldatatablejsp.jsp" />
</head>
<body>
    <jsp:include page="Adminheader.jsp"></jsp:include>
    <jsp:include page="Adminsidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Users In Craving<span class="text-warning">Nest</span></h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                      <li class="breadcrumb-item">CravingNest</li>
                    <li class="breadcrumb-item active">Report : Users</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">Users Report</h2>
                            
                            <table id="userTable" class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>Contact</th>
                                        <th>Role</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td>${user.firstName}</td>
                                            <td>${user.lastName}</td>
                                            <td>${user.email}</td>
                                            <td>${user.gender}</td>
                                            <td>${user.contact}</td>
                                            <td>${user.role}</td>
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

    

    <script>
        $(document).ready(function() {
            $('#userTable').DataTable({
                "pageLength": 10,
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "lengthMenu": [10, 15, 20, 25],
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
                "order": [[0, "asc"]],
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'excelHtml5',
                        title: 'Users_Report'
                    },
                    {
                        extend: 'pdfHtml5',
                        title: 'Users_Report',
                        orientation: 'landscape',
                        pageSize: 'A4'
                    },
                    {
                        extend: 'print',
                        title: 'Users Report - CravingNest'
                    }
                ]
            });
        });
    </script>
</body>
</html>
