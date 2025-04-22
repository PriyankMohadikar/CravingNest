<aside id="sidebar" class="sidebar">
  <ul class="sidebar-nav" id="sidebar-nav">
    <li class="nav-item">
      <a class="nav-link " href="admindashboard">
        <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-database-fill-gear"></i><span>Craving<span class="text-warning">Nest</span> Data</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
        <li>
          <a href="listuser">
            <i class="bi bi-people-fill"></i><span>List User</span>
          </a>
        </li>
        <li>
          <a class="nav-link collapsed" href="listrestaurant">
            <i class="bi bi-shop"></i>
            <span>Current Restaurant</span>
          </a>
        </li>
        <li>
          <a class="nav-link collapsed" href="listrestooffers">
            <i class="bi bi-tag-fill"></i>
            <span>Current Restaurant Offers</span>
          </a>
        </li>
        <li>
          <a class="nav-link collapsed" href="viewbookinglist">
            <i class="bi bi-calendar-check-fill"></i>
            <span>Booking Details</span>
          </a>
        </li>
      </ul>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#report-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-clipboard-data"></i><span>Craving<span class="text-warning">Nest</span> Reports</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="report-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
        <li>
          <a href="adminusersreport">
            <i class="bi bi-file-earmark-person-fill"></i><span>Users Report</span>
          </a>
        </li>
        <li>
          <a class="nav-link collapsed" href="adminrestaurantreport">
            <i class="bi bi-shop-window"></i>
            <span>Restaurant Report</span>
          </a>
        </li>
        <li>
          <a class="nav-link collapsed" href="adminofferreport">
            <i class="bi bi-receipt-cutoff"></i>
            <span>Restaurant Offers Report</span>
          </a>
        </li>
        <li>
          <a class="nav-link collapsed" href="adminbookingreport">
            <i class="bi bi-journal-check"></i>
            <span>Booking Report</span>
          </a>
        </li>
      </ul>
    </li>

    <li class="nav-heading text-dark">Pages</li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="viewuser?userId=${user.userId}">
        <i class="bi bi-person-circle"></i>
        <span>Profile</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="locationmanagement">
        <i class="bi bi-geo-alt-fill"></i>
        <span>Add Location</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="addlocation">
        <i class="bi bi-plus-square-dotted"></i>
        <span>Add Food & Restaurants</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="addoffer">
        <i class="bi bi-megaphone-fill"></i>
        <span>Add Restaurant Offers</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="logout">
        <i class="bi bi-box-arrow-right"></i>
        <span>Sign Out</span>
      </a>
    </li>
  </ul>
</aside>
