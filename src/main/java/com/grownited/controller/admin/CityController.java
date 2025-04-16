package com.grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.dto.Citydto;
import com.grownited.entity.CityEntity;
import com.grownited.entity.StateEntity;
import com.grownited.repository.CityRepository;
import com.grownited.repository.StateRepository;

@Controller
public class CityController {

	@Autowired
	StateRepository repoState;

	@Autowired
	CityRepository repocity;

	
	@GetMapping("listcity")
	public String listcity(Model model) {
		// for join cities and state table using custom query in city repository(DATA TRANSFER OBJECT - DTO)
		List<Citydto> city = repocity.getAll();
		model.addAttribute("city", city);
		return "Listcity";
	}

	
	@PostMapping("savecity")
	public String addcity(CityEntity city) {
		repocity.save(city);
		return "redirect:/locationmanagement";
	}

}
