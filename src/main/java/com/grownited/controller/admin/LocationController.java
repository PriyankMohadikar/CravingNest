package com.grownited.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.AreaEntity;
import com.grownited.entity.CityEntity;
import com.grownited.entity.LocationEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.AreaRepository;
import com.grownited.repository.CityRepository;
import com.grownited.repository.LocationRepository;
import com.grownited.repository.RatingRepository;
import com.grownited.repository.StateRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class LocationController {
//LocationController to RatingController using locationId AS FK
	@Autowired
	CityRepository cityrepo;

	@Autowired
	AreaRepository arearepo;
	
	@Autowired
	StateRepository staterepo;

	@Autowired
	LocationRepository locationrepo;

	@Autowired
	Cloudinary cloudinary;

	@Autowired
	RatingRepository ratingRepository;

	@GetMapping("restaurants")
	public String home(Model model,
			@RequestParam(required = false) Integer areaId,
			@RequestParam(required = false) Integer cityId,
			@RequestParam(required = false) Integer stateId,
			@RequestParam(required = false) String foodType) {
		List<LocationEntity> activelocation = locationrepo.findByActiveTrue();
		System.out.println("Received areaId: " + areaId);
		// Apply filters based on parameters
	    if (areaId != null) {
	        activelocation = locationrepo.findByActiveAndAreaId(areaId);
	    } else if (cityId != null) {
	        activelocation = locationrepo.findByActiveTrueAndCityId(cityId);
	    } else if (stateId != null) {
	        activelocation = locationrepo.findByActiveTrueAndStateId(stateId);
	    } else {
	        activelocation = locationrepo.findByActiveTrue(); // Default: show all active locations
	    }
	    
	    // filter for food_type
	    
	    if (foodType != null && !foodType.isEmpty()) {
	        activelocation = activelocation.stream()
	                .filter(location -> foodType.equals(location.getFoodType()))
	                .collect(Collectors.toList());
	    }
	    
		// Create a map to store average ratings for each location
	    Map<Integer, Double> ratingsMap = new HashMap<>();
	    for (LocationEntity location : activelocation) {
	        Double avgRating = ratingRepository.findAverageRatingByLocationId(location.getLocationId());
	        ratingsMap.put(location.getLocationId(), avgRating);
	    }
	    model.addAttribute("locations", activelocation);
	    model.addAttribute("ratingsMap", ratingsMap);	
	    model.addAttribute("states", staterepo.findAll());
	    model.addAttribute("cities", cityrepo.findAll());
	    model.addAttribute("areas", arearepo.findAll());
	    model.addAttribute("foodTypes", locationrepo.findDistinctFoodTypes()); // Add distinct food types
		return "Restaurant";
	}

	//restaurants page
	@GetMapping("home")
	public String restaurantPage() {
		return "Home";
	}
	
	// Admin Panel
	@GetMapping("listrestaurant")
	public String listOfferAdmin(Model model) {
//	CUSTOM SQL QUERY IN LOCAITON REPOSITORY;
		List<Object[]> locations = locationrepo.getAll();
		model.addAttribute("locations", locations);
		return "ListRestaurant";
	}

// Add by Admin or user/owner
	@GetMapping("addlocation")
	public String addfoodandlocationdetails(Model model,HttpSession session) {
		model.addAttribute("cities", cityrepo.findAll());
		model.addAttribute("areas", arearepo.findAll());
		return "AddLocation";
	}

	// save details
	@PostMapping("savelocation")
	public String savefoodandlocationdetails(LocationEntity locationentity, MultipartFile foodPic) {
		try {
			Map result = cloudinary.uploader().upload(foodPic.getBytes(), ObjectUtils.emptyMap());
			locationentity.setFoodPicPath(result.get("url").toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		locationentity.setActive(false); // Set active to false by default
		locationrepo.save(locationentity);
		return "redirect:/addlocation";
	}

	// Active or Inactive by admin
	@PostMapping("toggleStatus")
	public String toggleOfferStatus(Integer locationId) {
		LocationEntity location = locationrepo.findById(locationId).get(); // Directly get the entity
		location.setActive(!location.getActive()); // Toggle active status
		locationrepo.save(location);
		return "redirect:/listrestaurant";
	}
	
	// AJAX endpoints
	@GetMapping("/getCities")
	@ResponseBody
	public List<CityEntity> getCities(@RequestParam("stateId") Integer stateId) {
	    return cityrepo.findByStateId(stateId);
	}

	@GetMapping("/getAreas")
	@ResponseBody
	public List<AreaEntity> getAreas(@RequestParam("cityId") Integer cityId) {
	    return arearepo.findByCityId(cityId);
	}
}
