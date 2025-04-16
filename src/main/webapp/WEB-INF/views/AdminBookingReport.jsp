<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report : Booking Data</title>

    <style>
        .dataTables_wrapper .dataTables_filter {
            float: right;
            margin-bottom: 15px;
        }

        .dataTables_wrapper .dataTables_filter input {
            border-radius: 6px;
            padding: 6px 10px;
            border: 1px solid #ccc;
        }

        .dt-buttons {
            margin-bottom: 10px;
        }

        .dt-button {
            background-color: #0d6efd;
            color: white !important;
            border: none;
            padding: 6px 12px;
            margin-right: 6px;
            border-radius: 6px;
            font-size: 14px;
        }

        .dt-button:hover {
            background-color: #0b5ed7;
        }
    </style>
    <jsp:include page="Admincss.jsp"/>
    <jsp:include page="Adminjs.jsp"/>
</head>
<body>
    <jsp:include page="Adminheader.jsp"/>
    <jsp:include page="Adminsidebar.jsp"/>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Report : Booking Data</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admin-dashboard">Home</a></li>
                    <li class="breadcrumb-item">CravingNest</li>
                    <li class="breadcrumb-item active">Report : Bookings</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">Report : Booking Data</h2>

                            <table id="bookingTable" class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Restaurant</th>
                                        <th>User</th>
                                        <th>Booking Date</th>
                                        <th>Created Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="b" items="${booking}">
                                        <tr>
                                            <td>${b[0]}</td>
                                            <td>${b[1]}</td>
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

    <!-- jQuery + DataTables + Export Buttons -->
    <jsp:include page="Alldatatablejsp.jsp"/>

    <script>
        $(document).ready(function () {
            $('#bookingTable').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'excelHtml5',
                        title: 'Booking_Report'
                    },
                    {
                        extend: 'pdfHtml5',
                        title: 'Booking_Report',
                        orientation: 'landscape',
                        pageSize: 'A4'
                    },
                    {
                        extend: 'print',
                        title: 'Restaurant Booking Report - CravingNest'
                    }
                ],
                pageLength: 10,
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                lengthMenu: [10, 15, 20],
                language: {
                    search: "Search bookings:",
                    lengthMenu: "Show _MENU_ bookings per page",
                    info: "Showing _START_ to _END_ of _TOTAL_ bookings",
                    paginate: {
                        first: "First",
                        last: "Last",
                        next: "Next",
                        previous: "Previous"
                    }
                },
                order: [[0, "asc"]]
            });
        });
    </script>
</body>
</html>
