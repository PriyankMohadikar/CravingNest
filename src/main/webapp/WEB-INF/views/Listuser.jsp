<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
	rel="stylesheet">

<!-- JSTL Core Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>List Of Users</title>
</head>
<style>
</style>
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
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">


						<!-- Line Chart -->
						<div class="container">
							<h2 class="text-center mb-4">List of Users</h2>

							<table class="table table-striped datatable ">
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
											<td>${user.firstName }</td>
											<td>${user.lastName}</td>
											<td>${user.email }</td>
											<td>${user.gender }</td>
											<td>${user.role }</td>
											<td><a href="viewuser?userId=${user.userId}"
												class="btn btn-info btn-sm">View</a> <a
												href="deleteuser?userId=${user.userId}"
												class="btn btn-danger btn-sm">Delete</a> <a
												href="edituser?userId=${user.userId}"
												class="btn btn-warning btn-sm">Update</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>

						<!-- End Line Chart -->

					</div>

				</div>
			</div>
			<!-- End Reports -->

			<!-- Recent Sales -->
			<!-- End Recent Sales -->

			<!-- Top Selling -->


			</div>
			</div>
			<!-- End Left side columns -->

			<!-- Right side columns -->
			<!-- End Right side columns -->

			</div>
		</section>

	</main>

	<!-- jQuery & DataTables JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

	<!-- Initialize DataTables -->
	<script>
		$(document).ready(function() {
			$('#userTable').DataTable({
				"paging" : true, // Enables pagination
				"searching" : true, // Enables search bar
				"ordering" : true, // Enables sorting
				"info" : true, // Shows table info
				"lengthMenu" : [ 5, 10, 25, 50 ], // Rows per page
				"columnDefs" : [ {
					"orderable" : false,
					"targets" : 5
				} // Disable sorting for Actions column
				]
			});
		});
	</script>

	<!-- Bootstrap JS (optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
