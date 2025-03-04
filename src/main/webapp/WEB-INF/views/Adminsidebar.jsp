<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="index.html">
					<i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-menu-button-wide"></i><span>Components</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="listuser"> <i class="bi bi-circle"></i><span>ListUser</span>
					</a></li>

				</ul></li>
			<!-- End Components Nav -->




			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="viewuser?userId=${user.userId}"> <i class="bi bi-person"></i>
					<span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="addstate"> <i class="bi bi-card-list"></i> <span>Add
						State</span>
			</a></li>
			<!-- End Register Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="addcity"> <i class="bi bi-card-list"></i> <span>Add
						City</span>
			</a></li>
			<!-- End Register Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed" href="login">
					<i class="bi bi-box-arrow-in-right"></i> <span>Login</span>
			</a></li>
			<!-- End Login Page Nav -->
			<li class="nav-item"><a class="nav-link collapsed" href="logout">
					<i class="bi bi-box-arrow-in-right"></i> <span>Sign Out</span>
			</a></li>
			<!-- End Login Page Nav -->


		</ul>

	</aside>
</body>
</html>