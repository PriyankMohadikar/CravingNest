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

@Controller
public class RatingController {
	@Autowired
	LocationRepository locationrepo;

	@Autowired
	RatingRepository ratingrepo;
	
	@GetMapping("offerdetails")
	public String showofferdetails(Integer offerId, Model model) {
		Optional<LocationEntity> locationop = locationrepo.findById(offerId);
		if (locationop.isPresent()) {
			model.addAttribute("location", locationop.get());
//			System.out.println();
			List<RatingEntity> details = ratingrepo.findByOfferId(offerId);
			model.addAttribute("ratings", details);
		}
		return "OfferDetial";
	}

	@PostMapping("saveRating")
	public String saveRating(RatingEntity ratingEntity) {
		ratingrepo.save(ratingEntity);
		return "redirect:/offerdetails?offerId=" + ratingEntity.getOfferId();
	}
}
