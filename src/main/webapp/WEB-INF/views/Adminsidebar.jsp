
<aside id="sidebar" class="sidebar">
  <ul class="sidebar-nav" id="sidebar-nav">
    <li class="nav-item">
      <a class="nav-link " href="admindashboard">
        <i class="bi bi-grid"></i> <span>Dashboard</span>
      </a>
    </li>
    <!-- End Dashboard Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-menu-button-wide"></i><span>Craving<span class="text-warning">Nest</span> Data
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
        <li>
          <a href="listuser">
            <i class="bi bi-circle"></i><span>ListUser</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="listrestaurant">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Current Restaurant</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="listrestooffers">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Current Restaurant Offers</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="viewbookinglist">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Booking Details</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- End Components Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#report-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-menu-button-wide"></i><span>Craving<span class="text-warning">Nest</span> Reports</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="report-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
        <li>
          <a href="adminusersreport">
            <i class="bi bi-circle"></i><span>Users Report</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="adminrestaurantreport">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Restaurant Report</span>
          </a>
        </li>
         <li class="nav-item">
          <a class="nav-link collapsed" href="adminofferreport">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Restaurant Offers Report</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="adminbookingreport">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Booking Report</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- End CN DATA Nav -->

    <li class="nav-heading text-dark">Pages</li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="viewuser?userId=${user.userId}">
        <i class="bi bi-person"></i>
        <span>Profile</span>
      </a>
    </li>
    <!-- End Profile Page Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" href="locationmanagement">
        <i class="bi bi-card-list"></i>
        <span>Add location</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="addlocation">
        <i class="bi bi-box-arrow-in-right"></i>
        <span>Add Food & Restaurants</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="addoffer">
        <i class="bi bi-box-arrow-in-right"></i>
        <span>Add Restaurant Offers</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="logout">
        <i class="bi bi-box-arrow-in-right"></i>
        <span>Sign Out</span>
      </a>
    </li>
    <!-- End Login Page Nav -->
  </ul>
</aside>