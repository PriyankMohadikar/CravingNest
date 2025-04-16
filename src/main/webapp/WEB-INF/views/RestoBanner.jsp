<!-- banner.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="banner-container">
    <div class="banner-carousel">
        <!-- Carousel Items -->
        <div class="carousel-item">
            <img src="assets/img/foodbanner1.jpg" alt="Food Banner 1" class="banner-image">
            <div class="banner-overlay"></div>
            <div class="banner-quote">Satisfy Your Cravings with CravingNest</div>
        </div>
        <div class="carousel-item">
            <img src="assets/img/foodbanner2.jpeg" alt="Food Banner 2" class="banner-image">
            <div class="banner-overlay"></div>
            <div class="banner-quote">Delicious Deals Await You</div>
        </div>
        <div class="carousel-item">
            <img src="assets/img/foodbanner3.webp" alt="Food Banner 3" class="banner-image">
            <div class="banner-overlay"></div>
            <div class="banner-quote">Find Best OFFERS in NearBy location</div>
        </div>
        <div class="carousel-item">
            <img src="assets/img/foodbanner4.webp" alt="Food Banner 3" class="banner-image">
            <div class="banner-overlay"></div>
            <div class="banner-quote">Best Offers & Discounts</div>
        </div>
        <div class="carousel-item">
            <img src="assets/img/foodbanner5.jpg" alt="Food Banner 3" class="banner-image">
            <div class="banner-overlay"></div>
            <div class="banner-quote">Community Driven is our Moto</div>
        </div>
    </div>
</div>

<style>
    .banner-container {
        position: relative;
        height: 70vh;
        overflow: hidden;
    }

    .banner-carousel {
        position: relative;
        width: 100%;
        height: 100%;
    }

    .carousel-item {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        transition: opacity 0.5s ease-in-out;
    }

    .carousel-item.active {
        opacity: 1;
    }

    .banner-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0.8; /* Reduced opacity for background effect */
    }

    .banner-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.3); /* Slight overlay for better text readability */
    }

    .banner-quote {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-size: 2.5rem;
        font-weight: bold;
        text-align: center;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        opacity: 0;
        animation: fadeInOut 2s ease-in-out infinite;
    }

    /* Animation for quote */
    @keyframes fadeInOut {
        0% { opacity: 0; transform: translate(-50%, -60%); }
        20% { opacity: 1; transform: translate(-50%, -50%); }
        80% { opacity: 1; transform: translate(-50%, -50%); }
        100% { opacity: 0; transform: translate(-50%, -40%); }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const items = document.querySelectorAll('.carousel-item');
        let currentIndex = 0;

        function showNextItem() {
            // Remove active class from current item
            items[currentIndex].classList.remove('active');
            
            // Move to next item
            currentIndex = (currentIndex + 1) % items.length;
            
            // Add active class to next item
            items[currentIndex].classList.add('active');
        }

        // Set first item as active
        items[0].classList.add('active');

        // Change slide every 2 seconds
        setInterval(showNextItem, 4000);
    });
</script>