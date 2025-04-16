package com.grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "bookings")
public class BookingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bookingId;

    private Integer userId; // Simple field instead of UserEntity relationship
    private Integer locationId; // Simple field instead of LocationEntity relationship
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bookingDate; // Date object for booking date
    private String bookingTime; // Storing time as a string (e.g., "12:00 PM")
    private Integer numberOfMembers;
    private String specialRequest;
    private Date createdDate = new Date(); // Current date by default
    private String status = "Pending"; // e.g., Pending, Confirmed, Cancelled

    // Date format for dd/MM/yy
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yy");


    // Getters and Setters
    public Integer getBookingId() {
        return bookingId;
    }

    public void setBookingId(Integer bookingId) {
        this.bookingId = bookingId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getLocationId() {
        return locationId;
    }

    public void setLocationId(Integer locationId) {
        this.locationId = locationId;
    }

    public String getBookingDate() {
        return bookingDate != null ? DATE_FORMAT.format(bookingDate) : null;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }

    public Integer getNumberOfMembers() {
        return numberOfMembers;
    }

    public void setNumberOfMembers(Integer numberOfMembers) {
        this.numberOfMembers = numberOfMembers;
    }

    public String getSpecialRequest() {
        return specialRequest;
    }

    public void setSpecialRequest(String specialRequest) {
        this.specialRequest = specialRequest;
    }

    public String getCreatedDate() {
        return createdDate != null ? DATE_FORMAT.format(createdDate) : null;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Optional: Method to get raw Date object if needed
    public Date getRawBookingDate() {
        return bookingDate;
    }

    public Date getRawCreatedDate() {
        return createdDate;
    }
}