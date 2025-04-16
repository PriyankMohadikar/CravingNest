package com.grownited.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.FoodOfferInterestEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.FoodOfferInterestRepository;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class FoodOfferInterestController {

		@Autowired
	    FoodOfferInterestRepository foodOfferInterestRepository;
	
	@GetMapping("userfoodofferinterest")
	public String interestFoodOffer(HttpSession session,Model model) {
		UserEntity user = (UserEntity)session.getAttribute("user");
		Integer userId = user.getUserId();
		String email = user.getEmail();
		model.addAttribute("email", email);
		model.addAttribute("userId", userId);
		return "FoodOfferInterest";
	}
	
	@PostMapping("saveuserfoodinterest")
	public String postMethodName(FoodOfferInterestEntity interestEntity) {
		foodOfferInterestRepository.save(interestEntity);
		return "redirect:/home";
	}
	
	
}
