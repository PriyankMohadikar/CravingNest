package com.grownited.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.BookingEntity;
import com.grownited.entity.LocationEntity;
import com.grownited.entity.RatingEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.AreaRepository;
import com.grownited.repository.BookingRepository;
import com.grownited.repository.CityRepository;
import com.grownited.repository.LocationRepository;
import com.grownited.repository.RatingRepository;
import com.grownited.repository.StateRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class BookingController {
	@Autowired
	CityRepository cityrepo;

	@Autowired
	AreaRepository arearepo;

	@Autowired
	StateRepository staterepo;

	@Autowired
	LocationRepository locationrepo;

	@Autowired
	RatingRepository ratingRepository;

	@Autowired
	BookingRepository bookingRepository;

	@GetMapping("restaurantBooking")
	public String restoBooking(Model model, @RequestParam(required = false) Integer areaId,
			@RequestParam(required = false) Integer cityId, @RequestParam(required = false) Integer stateId,
			@RequestParam(required = false) String foodType) {
		List<LocationEntity> activelocation = locationrepo.findByActiveTrue();
		if (areaId != null) {
			activelocation = locationrepo.findByActiveAndAreaId(areaId);
		} else if (cityId != null) {
			activelocation = locationrepo.findByActiveTrueAndCityId(cityId);
		} else if (stateId != null) {
			activelocation = locationrepo.findByActiveTrueAndStateId(stateId);
		} else {
			activelocation = locationrepo.findByActiveTrue(); // Default: show all active locations
		}
		// Create a map to store average ratings for each location
		Map<Integer, Double> ratingsMap = new HashMap<>();
		for (LocationEntity location : activelocation) {
			Double avgRating = ratingRepository.findAverageRatingByLocationId(location.getLocationId());
			ratingsMap.put(location.getLocationId(), avgRating);
		}
		
		// Apply foodType filter if provided
	    if (foodType != null && !foodType.isEmpty()) {
	        activelocation = activelocation.stream()
	                .filter(location -> foodType.equals(location.getFoodType()))
	                .collect(Collectors.toList());
	    }
	    
		model.addAttribute("locations", activelocation);
		model.addAttribute("ratingsMap", ratingsMap);
		model.addAttribute("states", staterepo.findAll());
		model.addAttribute("cities", cityrepo.findAll());
		model.addAttribute("areas", arearepo.findAll());
		model.addAttribute("locations", activelocation);
		model.addAttribute("foodTypes", locationrepo.findDistinctFoodTypes());
		return "RestaurantBooking";
	}

	// View Particular Location/Restaurant/Food_Place -- *Location and PlaceRating
	// IMPSS*
	@GetMapping("bookingdetails")
	public String showofferdetails(Integer locationId, Model model, HttpSession session) {
		Optional<LocationEntity> locationop = locationrepo.findById(locationId);
		if (locationop.isPresent()) {
			model.addAttribute("location", locationop.get());
		}
		return "BookRestaurant";
	}

	// save booking details from user
	@PostMapping("savebookings")
	public String bookingRestaurants(BookingEntity bookingEntity) {
		bookingRepository.save(bookingEntity);
		return "redirect:/restaurantBooking";
	}

	// Admin can view the BookingDetails and change the Status
	@GetMapping("viewbookinglist")
	public String viewBookinglist(Model model) {
		List<Object> booking = bookingRepository.getbookingdetails();
		model.addAttribute("booking", booking);
		return "AdminBookinglist";
	}

	// admin change the booking status
	@PostMapping("updateBookingStatus")
	public String updateBookingStatus(Integer bookingId, String status) {
		Optional<BookingEntity> op = bookingRepository.findByBookingId(bookingId);
		if (op.isPresent()) {
			BookingEntity booking = op.get();
			booking.setStatus(status);
			bookingRepository.save(booking);
		}
		return "redirect:/viewbookinglist";
	}

	// user can view his past Booking details
	@GetMapping("viewbookinghistory")
	public String getbookingHistory(HttpSession session, Model model) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		Integer userId = user.getUserId();
		List<Object[]> userbooking = bookingRepository.userbookingdata(userId);
		model.addAttribute("user", user);
		model.addAttribute("userbooking", userbooking);
		return "UserBookingDetails";
	}

}
