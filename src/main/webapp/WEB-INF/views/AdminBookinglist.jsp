<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking List</title>
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0.2em 0.6em;
            margin: 0 2px;
        }
        .dataTables_wrapper .dataTables_filter {
            margin-bottom: 15px;
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
            <h1>Booking List</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admin-dashboard">Home</a></li>
                    <li class="breadcrumb-item active">Bookings</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">All Booking Details</h2>

                            <table id="bookingTable" class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Restaurant</th>
                                        <th>User</th>
                                        <th>Booking Date</th>
                                        <th>Created Date</th>
                                        <th>Status</th>
                                        <th>Update Status</th>
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
                                            <td>
                                                <form action="updateBookingStatus" method="post" class="d-flex">
                                                    <input type="hidden" name="bookingId" value="${b[5]}" />
                                                    <select name="status" class="form-select me-2">
                                                        <option value="Pending" ${b[4] == 'Pending' ? 'selected' : ''}>Pending</option>
                                                        <option value="Confirmed" ${b[4] == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                                        <option value="Cancelled" ${b[4] == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                                    </select>
                                                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
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

    <!-- jQuery & DataTables -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#bookingTable').DataTable({
                "pageLength": 10,
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "lengthMenu": [10, 15, 20],
                "language": {
                    "search": "Search bookings:",
                    "lengthMenu": "Show _MENU_ bookings per page",
                    "info": "Showing _START_ to _END_ of _TOTAL_ bookings",
                    "paginate": {
                        "first": "First",
                        "last": "Last",
                        "next": "Next",
                        "previous": "Previous"
                    }
                },
                "columnDefs": [
                    {
                        "targets": 5,
                        "orderable": false
                    }
                ],
                "order": [[0, "asc"]]
            });
        });
    </script>
</body>
</html>
