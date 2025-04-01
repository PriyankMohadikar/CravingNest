package com.grownited.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.LocationEntity;
import com.grownited.entity.RatingEntity;
import com.grownited.repository.LocationRepository;
import com.grownited.repository.RatingRepository;

//							 Comments & rating For Restaurant Place/food

@Controller
public class RatingController {
	@Autowired
	LocationRepository locationrepo;

	@Autowired
	RatingRepository ratingrepo;

	// View Particular Location/Restaurant/Food_Place  -- *Location and PlaceRating IMPSS*
	@GetMapping("locationdetails")
	public String showofferdetails(Integer locationId, Model model) {
		Optional<LocationEntity> locationop = locationrepo.findById(locationId);
		if (locationop.isPresent()) {
			model.addAttribute("location", locationop.get());
			// For LocationId as FK
			List<RatingEntity> details = ratingrepo.findByLocationId(locationId);
			model.addAttribute("ratings", details);
		}
		return "RestoRatings";
	}

	@PostMapping("saveRating")
	public String saveRating(RatingEntity ratingEntity) {
		ratingrepo.save(ratingEntity);
//		System.out.println(ratingEntity.getOfferId());  Location ID 
		return "redirect:/locationdetails?locationId=" + ratingEntity.getLocationId();
	}
}
