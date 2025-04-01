<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        body::before {
            content: "";
            background: url('assets/img/loginbg.jpg') no-repeat center center/cover;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            z-index: -1;
        }
        .edit-box {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(5px);
        }
        .edit-box.bg-dark {
            background-color: rgba(33, 37, 41, 0.95) !important;
        }
        .profile-preview {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
        }
    </style>

    <script>
        function toggleDarkMode() {
            let box = document.querySelector(".edit-box");
            box.classList.toggle("bg-dark");
            box.classList.toggle("text-white");
            let formElements = box.querySelectorAll(".form-control");
            formElements.forEach(el => el.classList.toggle("bg-dark"));
            formElements.forEach(el => el.classList.toggle("text-white"));
        }

        function previewImage(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById("profilePreview").src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        }
    </script>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="edit-box p-4 shadow-lg">
                    <h1 class="text-center mb-4">Craving<span class="text-warning">Nest</span></h1>
                    <h3 class="text-center mb-4">Edit Profile</h3>
                    <form action="updateuser" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="userId" value="${user.userId}">
                        <input type="hidden" name="role" value="${user.role}">
                        <div class="mb-3 text-center">
                            <img id="profilePreview" src="${user.profilePicPath}?t=<%= new java.util.Date().getTime() %>" alt="Profile" class="profile-preview">
                        </div>
                        
                        <div class="mb-3">
                            <label for="firstName" class="form-label"><i class="fas fa-user me-2"></i>First Name:</label>
                            <input type="text" class="form-control" name="firstName" id="firstName" value="${user.firstName}" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label"><i class="fas fa-user me-2"></i>Last Name:</label>
                            <input type="text" class="form-control" name="lastName" id="lastName" value="${user.lastName}" required>
                        </div>
                        <div class="mb-3">
                            <label for="contact" class="form-label"><i class="fas fa-phone me-2"></i>Contact:</label>
                            <input type="number" class="form-control" id="contact" name="contact" value="${user.contact}" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label"><i class="fas fa-envelope me-2"></i>Email:</label>
                            <input type="email" class="form-control" name="email" id="email" value="${user.email}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-venus-mars me-2"></i>Gender:</label>
                            <div>
                                <input type="radio" name="gender" value="male" ${user.gender == 'male' ? 'checked' : ''} required> 
                                <i class="fas fa-mars me-1"></i>Male
                                <input type="radio" name="gender" value="female" ${user.gender == 'female' ? 'checked' : ''} required class="ms-3"> 
                                <i class="fas fa-venus me-1"></i>Female
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="profilePic" class="form-label"><i class="fa-solid fa-user"></i> Profile Picture:</label>
                            <input type="file" class="form-control" name="profilePic" id="profilePic" onchange="previewImage(event)">
                            
                        </div>
                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save me-2"></i>Update Profile</button>
                    </form>
                    <div class="text-center mt-3">
                        <a href="home" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Back to Home</a>
                    </div>
                    <div class="text-center mt-3">
                        <button class="btn btn-secondary" onclick="toggleDarkMode()">
                            <i class="fas fa-moon me-2"></i>Toggle Dark Mode
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>