package com.grownited.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
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
import com.grownited.entity.OfferEntity;
import com.grownited.repository.LocationRepository;
import com.grownited.repository.OfferRepository;


@Controller
public class OfferController {
// OfferController to OfferRatingController using OfferId As FK
	@Autowired
	Cloudinary cloudinary;
	
	@Autowired
	LocationRepository repolocation;

	@Autowired
	OfferRepository repooffer;

	@GetMapping("addoffer")
	public String addofferdetails(Model model) {
		List<LocationEntity> location = repolocation.findAll();
		model.addAttribute("locations", location);
		return "AddOffer";
	}

	// View Active Offers
	@GetMapping("activeoffers")
	public String showoffers(Model model) {
		List<LocationEntity> location = repolocation.findAll();
		List<OfferEntity> offers = repooffer.findByActiveTrue();
		model.addAttribute("offers", offers);
		model.addAttribute("locations", location);
		return "Offers";
	}

	// For Offer -> Particular Restaurant ** ADMIN PANEL **
	@GetMapping("listrestooffers")
	public String listrestoofferswithLocation(Model model) {
		List<Object[]> offers = repooffer.fetchAllOffersWithLocationDetails();
		model.addAttribute("offers", offers);
		return "ListRestoOffers";
	}

	// Toggle for Active/inActive

	@PostMapping("toggleOfferStatus")
	public String toggleStatusoffers(Integer offerId) {
		Optional<OfferEntity> offerop = repooffer.findById(offerId);
		if (offerop.isPresent()) {
			OfferEntity offer = offerop.get();
			offer.setActive(!offer.isActive());
			repooffer.save(offer);
		}

		return "redirect:/listrestooffers";
	}

	@PostMapping("saveoffer")
	public String saveofferdetails(OfferEntity offerentity,MultipartFile offerPic) {
		try {
			Map result = cloudinary.uploader().upload(offerPic.getBytes(), ObjectUtils.emptyMap());
			offerentity.setOfferPicPath(result.get("url").toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		offerentity.setActive(false);
		repooffer.save(offerentity);
		return "redirect:/addoffer";
	}

}
