<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report : Restaurant Offers</title>

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
    <jsp:include page="Admincss.jsp"></jsp:include>
    <jsp:include page="Adminjs.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="Adminheader.jsp"></jsp:include>
    <jsp:include page="Adminsidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Report : Restaurant Offers</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Report</a></li>
                    <li class="breadcrumb-item">CravingNest</li>
                    <li class="breadcrumb-item active">Report : Offers</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">Report : Offers</h2>

                            <table id="offerTable" class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Place</th>
                                        <th>Description</th>
                                        <th>Area</th>
                                        <th>City</th>
                                        <th>FoodType</th>
                                        <th>End Date</th>
                                        <th>Offer-Details</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="offer" items="${offers}">
                                        <tr>
                                            <td>${offer[0]}</td>
                                            <td>${offer[1]}</td>
                                            <td>${offer[2]}</td>
                                            <td>${offer[3]}</td>
                                            <td>${offer[4]}</td>
                                            <td>${offer[5]}</td>
                                            <td>${offer[6]}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${offer[7]}">
                                                        <span class="badge bg-success">Active</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-danger">Inactive</span>
                                                    </c:otherwise>
                                                </c:choose>
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

    <!-- DataTables and Export Scripts -->
    <jsp:include page="Alldatatablejsp.jsp" />

    <script>
        $(document).ready(function () {
            $('#offerTable').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'excelHtml5',
                        title: 'Restaurant_Offers_Report'
                    },
                    {
                        extend: 'pdfHtml5',
                        title: 'Restaurant_Offers_Report',
                        orientation: 'landscape',
                        pageSize: 'A4'
                    },
                    {
                        extend: 'print',
                        title: 'Restaurant Offers Report - CravingNest'
                    }
                ],
                pageLength: 10,
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                lengthMenu: [10, 15, 20, 25],
                language: {
                    search: "Search offers:",
                    lengthMenu: "Show _MENU_ offers per page",
                    info: "Showing _START_ to _END_ of _TOTAL_ offers",
                    paginate: {
                        first: "First",
                        last: "Last",
                        next: "Next",
                        previous: "Previous"
                    }
                },
                order: [[0, "asc"]],
                columnDefs: [
                    {
                        targets: [], // No column to disable
                        orderable: false
                    }
                ]
            });
        });
    </script>
</body>
</html>
