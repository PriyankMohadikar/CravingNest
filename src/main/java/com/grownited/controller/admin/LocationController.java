package com.grownited.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.LocationEntity;
import com.grownited.repository.AreaRepository;
import com.grownited.repository.CityRepository;
import com.grownited.repository.LocationRepository;


@Controller
public class LocationController {
//LocationController to RatingController using locationId AS FK
	@Autowired
	CityRepository cityrepo;

	@Autowired
	AreaRepository arearepo;

	@Autowired
	LocationRepository locationrepo;

	@Autowired
	Cloudinary cloudinary;

	@GetMapping("home")
	public String home(Model model) {
		List<LocationEntity> activelocation = locationrepo.findByActiveTrue();
		model.addAttribute("locations", activelocation);
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
	public String addfoodandlocationdetails(Model model) {
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

}
