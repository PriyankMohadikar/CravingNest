package com.grownited.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.OfferEntity;
import com.grownited.entity.OfferRatingEntity;
import com.grownited.repository.OfferRatingRepository;
import com.grownited.repository.OfferRepository;

@Controller
public class OfferRatingController {

	@Autowired
	OfferRatingRepository repoofferrating;

	@Autowired
	OfferRepository repooffer;

	@GetMapping("offerdetails")
	public String offerDetails(Integer offerId, Model model) {
		System.out.println(offerId);
		Optional<OfferEntity> op = repooffer.findById(offerId);
		if(op.isPresent()) {
			model.addAttribute("offerinfo", op.get());
			List<OfferRatingEntity> details = repoofferrating.findByofferId(offerId);
			model.addAttribute("details", details);
		}
		return "Offerratings";
	}
	
	@PostMapping("saveofferratings")
	public String postMethodName(OfferRatingEntity orentity) {
		repoofferrating.save(orentity);
		return "redirect:/offerdetails?offerId="+ orentity.getOfferId() ;
	}
	

}
