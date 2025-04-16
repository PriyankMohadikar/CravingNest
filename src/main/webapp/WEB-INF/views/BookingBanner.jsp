<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="booking-banner-container">
    <div class="booking-banner-slide active" style="background-image: url('assets/img/bookingbanner1.jpg');">
        <div class="overlay"></div>
        <div class="banner-text">Book Your Table with <span class="text-warning">CravingNest</span></div>
    </div>
    
    <div class="booking-banner-slide" style="background-image: url('assets/img/bookingbanner2.jpg');">
        <div class="overlay"></div>
        <div class="banner-text">Exclusive Booking Offers & Deals Await</div>
    </div>
    
    <div class="booking-banner-slide" style="background-image: url('assets/img/bookingbanner3.jpg');">
        <div class="overlay"></div>
        <div class="banner-text">With Every Booking with CravingNest Gets a Extra 10% off</div>
    </div>
    
    <div class="booking-banner-slide" style="background-image: url('assets/img/bookingbanner4.jpg');">
        <div class="overlay"></div>
        <div class="banner-text">Seamless Booking, Unforgettable Dining</div>
    </div>
</div>

<style>
    .booking-banner-container {
        position: relative;
        height:60vh; /* Half of 75vh */
        overflow: hidden;
    }

    .booking-banner-slide {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-size: cover;
        background-position: center;
        opacity: 0;
        transition: opacity 1s ease-in-out;
    }

    .booking-banner-slide.active {
        opacity: 1;
        z-index: 1;
    }

    .overlay {
        position: absolute;
        top: 0;
        left: 0;
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
        font-size: 1.5rem; /* Smaller font size to fit smaller banner */
        font-weight: bold;
        text-align: center;
        text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
        padding: 10px;
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const slides = document.querySelectorAll('.booking-banner-slide');
        let current = 0;

        setInterval(() => {
            slides[current].classList.remove('active');
            current = (current + 1) % slides.length;
            slides[current].classList.add('active');
        }, 4000); // Change every 4 seconds
    });
</script>