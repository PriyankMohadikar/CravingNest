package com.grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.LocationEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.BookingRepository;
import com.grownited.repository.LocationRepository;
import com.grownited.repository.OfferRepository;
import com.grownited.repository.UserRepository;


@Controller
public class ReportController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	LocationRepository locationRepository;
	
	@Autowired
	OfferRepository offerRepository;
	
	@Autowired
	BookingRepository bookingRepository;
	
	@GetMapping("adminusersreport")
	public String adminUserReport(Model model) {
		List<UserEntity> users = userRepository.findByRoleAndIsactive("USER",true); 
		model.addAttribute("users", users);
		return "AdminUserReport";
	}
	
	@GetMapping("adminrestaurantreport")
	public String adminRestoReport(Model model) {
		List<Object[]> locations = locationRepository.getadminrestoreport();
		model.addAttribute("locations", locations);
		return "AdminRestaurantReport";
	}
	
	@GetMapping("adminofferreport")
	public String adminOfferReport(Model model) {
		List<Object[]> offers = offerRepository.fetchAllOffersWithLocationDetails();
		model.addAttribute("offers", offers);
		return "AdminOfferReport";
	}
	
	@GetMapping("adminbookingreport")
	public String adminBookingReport(Model model) {
		List<Object> booking = bookingRepository.getbookingdetails();
		model.addAttribute("booking", booking);
		return "AdminBookingReport";
	}
	
	
}
