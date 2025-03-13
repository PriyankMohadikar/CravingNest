package com.grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.AreaEntity;
import com.grownited.entity.CityEntity;
import com.grownited.repository.AreaRepository;
import com.grownited.repository.CityRepository;

@Controller
public class AreaController {

	@Autowired
	CityRepository cityrepo;
	
	@Autowired
	AreaRepository arearepo;
	
	@GetMapping("addarea")
	public String showAddAreaForm(Model model) {
		List<CityEntity> cities = cityrepo.findAll();
		model.addAttribute("cities", cities);
		return "AddArea";
	}
	
	@PostMapping("savearea")
	public String saveareadetails(AreaEntity areaentity) {
		arearepo.save(areaentity);
		return "redirect:/addarea";
	}
	
}
