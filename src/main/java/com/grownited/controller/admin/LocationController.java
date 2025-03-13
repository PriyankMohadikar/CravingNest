package com.grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.LocationEntity;
import com.grownited.repository.AreaRepository;
import com.grownited.repository.CityRepository;
import com.grownited.repository.LocationRepository;


@Controller
public class LocationController {

	@Autowired
	CityRepository cityrepo;
	
	@Autowired
	AreaRepository arearepo;
	
	@Autowired
	LocationRepository locationrepo;
	
	@GetMapping("home")
	public String home(Model model) {
		List<LocationEntity> activelocation	= locationrepo.findByActiveTrue();
		model.addAttribute("locations", activelocation);
		return "Home";
	}
	
	
	@GetMapping("listoffer")
	public String listOfferAdmin(Model model) {
	 List<LocationEntity> locations	= locationrepo.findAll();
	 model.addAttribute("locations", locations);
		return "ListOffer";
	}
	
	@GetMapping("addlocation")
	public String addfoodandlocationdetails(Model model) {
		model.addAttribute("cities",cityrepo.findAll());
		model.addAttribute("areas",arearepo.findAll());
		return "AddLocation";
	}
	
	@PostMapping("savelocation")
	public String savefoodandlocationdetails(LocationEntity locationentity) {
		 locationentity.setActive(false); // Set active to false by default
		locationrepo.save(locationentity);
		return "redirect:/addlocation";
	}
	
	@PostMapping("toggleStatus")
	public String toggleOfferStatus(Integer locationId) {
	    LocationEntity location = locationrepo.findById(locationId).get(); // Directly get the entity
	    location.setActive(!location.getActive()); // Toggle active status
	    locationrepo.save(location);
	    return "redirect:/listoffer";
	}
	
}
