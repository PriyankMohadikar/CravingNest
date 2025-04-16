<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="hero-banner-container">
    <div class="hero-banner-slide active" style="background-image: url('assets/img/foodbanner1.jpg');">
        <div class="overlay"></div>
        <div class="banner-text">Satisfy Your Cravings with <span class="text-warning">CravingNest</span></div>
    </div>
    
    <div class="hero-banner-slide" style="background-image: url('assets/img/foodbanner2.jpeg');">
        <div class="overlay"></div>
        <div class="banner-text">Delicious Food, Fast Delivery, Unbeatable Offers</div>
    </div>
    <div class="hero-banner-slide" style="background-image: url('assets/img/foodbanner3.webp');">
        <div class="overlay"></div>
        <div class="banner-text">Search Restaurants & Offers Nearby Instantly</div>
    </div>
    <div class="hero-banner-slide" style="background-image: url('assets/img/foodbanner4.webp');">
        <div class="overlay"></div>
        <div class="banner-text">CravingNest - Where Taste Meets Technology</div>
    </div>
	 
</div>

<style>
    .hero-banner-container {
        position: relative;
        height: 75vh;
        overflow: hidden;
    }

    .hero-banner-slide {
        position: absolute;
        top: 0; left: 0;
        width: 100%;
        height: 100%;
        background-size: cover;
        background-position: center;
        opacity: 0;
        transition: opacity 1s ease-in-out;
    }

    .hero-banner-slide.active {
        opacity: 1;
        z-index: 1;
    }

    .overlay {
        position: absolute;
        top: 0; left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.6));
    }

    .banner-text {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: #fff;
        font-size: 2.5rem;
        font-weight: bold;
        text-align: center;
        text-shadow: 2px 2px 10px rgba(0,0,0,0.7);
        padding: 20px;
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const slides = document.querySelectorAll('.hero-banner-slide');
        let current = 0;

        setInterval(() => {
            slides[current].classList.remove('active');
            current = (current + 1) % slides.length;
            slides[current].classList.add('active');
        }, 4000); // change every 5 seconds
    });
</script>
