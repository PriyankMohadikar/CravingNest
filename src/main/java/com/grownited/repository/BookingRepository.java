package com.grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.grownited.entity.BookingEntity;

public interface BookingRepository extends JpaRepository<BookingEntity, Integer>{

	// Admin can See the Booking data from users
	@Query(value ="select l.title,u.first_name,DATE_FORMAT(b.booking_date, '%d/%m/%y') as booking,DATE_FORMAT(b.created_date, '%d/%m/%y') as created_at,b.status,b.booking_id from bookings b ,location l,users u where l.location_id = b.location_id and u.user_id = b.user_id;",nativeQuery = true)
	List<Object> getbookingdetails();
	
	// User can view his Booking data
	@Query(value ="select l.title,u.first_name,DATE_FORMAT(b.booking_date, '%d/%m/%y') as booking,DATE_FORMAT(b.created_date, '%d/%m/%y') as created_at,b.status,b.booking_time,b.booking_id from bookings b ,location l,users u where l.location_id = b.location_id and u.user_id = b.user_id and u.user_id = :userId;",nativeQuery = true)
	List<Object[]> userbookingdata(Integer userId);
	
	Optional<BookingEntity> findByBookingId(Integer bookingId);
	
	//total booking 
	@Query(value = "select count(*) from bookings;",nativeQuery = true)
	long getAllBookings();
	
	// Total confirmed booking
	@Query(value = "SELECT COUNT(*) FROM bookings WHERE status = 'confirmed';",nativeQuery = true)
	long confirmedBooking();
}
