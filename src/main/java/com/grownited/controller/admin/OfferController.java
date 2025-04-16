package com.grownited.controller.admin;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.dto.OfferInfoDTO;
import com.grownited.dto.UserFoodInterestDTO;
import com.grownited.entity.LocationEntity;
import com.grownited.entity.OfferEntity;
import com.grownited.repository.AreaRepository;
import com.grownited.repository.CityRepository;
import com.grownited.repository.FoodOfferInterestRepository;
import com.grownited.repository.LocationRepository;
import com.grownited.repository.OfferRatingRepository;
import com.grownited.repository.OfferRepository;
import com.grownited.repository.RatingRepository;
import com.grownited.repository.StateRepository;
import com.grownited.service.MailService;

@Controller
public class OfferController {
// OfferController to OfferRatingController using OfferId As FK

	@Autowired
	LocationRepository locationrepo;

	@Autowired
	Cloudinary cloudinary;

	@Autowired
	OfferRepository repooffer;

	@Autowired
	OfferRatingRepository offerRatingRepository;

	@Autowired
	private StateRepository stateRepo;

	@Autowired
	private CityRepository cityRepo;

	@Autowired
	private AreaRepository areaRepo;

	// MailService Class object--globally
	@Autowired
	MailService mailService;

	@Autowired
	FoodOfferInterestRepository foodOfferInterestRepository;

	@GetMapping("addoffer")
	public String addofferdetails(Model model) {
		List<LocationEntity> location = locationrepo.findAll();
		model.addAttribute("locations", location);
		return "AddOffer";
	}

//	// View Active Offers
//	@GetMapping("activeoffers")
//	public String showoffers(Model model) {
//		
//		List<LocationEntity> location = locationrepo.findAll();
//		List<OfferEntity> offers = repooffer.findByActiveTrue();
//		// avg rating of offers 
//		Map<Integer, Double> avgOffrating = new HashMap<>();
//		for(OfferEntity offer : offers) {
//			Double avgofferratings = offerRatingRepository.findAverageRatingByOfferId(offer.getOfferId());
//			avgOffrating.put(offer.getOfferId(), avgofferratings);
//		}
//		model.addAttribute("avgratings", avgOffrating);
//		model.addAttribute("offers", offers);
//		model.addAttribute("locations", location);
//		return "Offers";
//	}

	// New active offers with filter
	// View Active Offers with Filtering
	@GetMapping("activeoffers")
	public String showoffers(Model model, @RequestParam(required = false) Integer stateId,
			@RequestParam(required = false) Integer cityId, @RequestParam(required = false) Integer areaId,
			@RequestParam(required = false) String foodType) {

		List<OfferEntity> offers;

		// Apply filters based on parameters
		if (areaId != null) {
			offers = repooffer.findByActiveTrueAndAreaId(areaId);
		} else if (cityId != null) {
			offers = repooffer.findByActiveTrueAndCityId(cityId);
		} else if (stateId != null) {
			offers = repooffer.findByActiveTrueAndStateId(stateId);
		} else {
			offers = repooffer.findByActiveTrue(); // Default: show all active offers
		}
		// Apply foodType filter if provided
	    if (foodType != null && !foodType.isEmpty()) {
	        offers = offers.stream()
	                .filter(offer -> foodType.equals(offer.getFoodType()))
	                .collect(Collectors.toList());
	    }
		// Average rating of offers
		Map<Integer, Double> avgOffrating = new HashMap<>();
		for (OfferEntity offer : offers) {
			Double avgofferratings = offerRatingRepository.findAverageRatingByOfferId(offer.getOfferId());
			avgOffrating.put(offer.getOfferId(), avgofferratings != null ? avgofferratings : 0.0); // Handle null
																									// ratings
		}

		// Add data to the model
		model.addAttribute("offers", offers);
		model.addAttribute("locations", locationrepo.findAll()); // All locations for restaurant names
		model.addAttribute("avgratings", avgOffrating);
		model.addAttribute("states", stateRepo.findAll()); // For state dropdown
		model.addAttribute("cities", cityRepo.findAll()); // For city dropdown
		model.addAttribute("areas", areaRepo.findAll()); // For area dropdown
		model.addAttribute("foodTypes", repooffer.findDistinctOffersFoodTypes()); // Add distinct food types
		return "Offers"; // Maps to Offers.jsp
	}

	// For Offer -> Particular Restaurant ** ADMIN PANEL **
	@GetMapping("listrestooffers")
	public String listrestoofferswithLocation(Model model) {
		List<Object[]> offers = repooffer.fetchAllOffersWithLocationDetails();
		model.addAttribute("offers", offers);
		return "ListRestoOffers";
	}

	// Toggle for Active/inActive
	// and mail sending to user based on when offer is active
	@PostMapping("toggleOfferStatus")
	public String toggleStatusoffers(Integer offerId) {
		Optional<OfferEntity> offerop = repooffer.findById(offerId);
		if (offerop.isPresent()) {
			OfferEntity offer = offerop.get();
			boolean isNowActive = !offer.isActive();
			offer.setActive(isNowActive);
			repooffer.save(offer);

			// Mail Logic When offer is active
			if (isNowActive) {
				// Get all users who match this offer
				List<UserFoodInterestDTO> interestuser = foodOfferInterestRepository.findUsersMatchingNewOffer(offerId);
				String address = locationrepo.findAddressByLocationId(offer.getLocationId());
				OfferInfoDTO offerDTO = new OfferInfoDTO(
					    address,
					    offer.getDescription(),
					    offer.getFoodType(),
					    offer.getTitle(),
					    offer.getOfferPicPath(),
					    offer.getEndDate()
					);
//				Step 3: Send mail
	            mailService.sendOfferToInterestedUsers(interestuser, offerDTO);
				
			}
		}

		return "redirect:/listrestooffers";
	}

	@PostMapping("saveoffer")
	public String saveofferdetails(OfferEntity offerentity, MultipartFile offerPic) {
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
