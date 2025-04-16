package com.grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.entity.AreaEntity;
import com.grownited.entity.CityEntity;
import com.grownited.repository.AreaRepository;
import com.grownited.repository.CityRepository;

@Controller
public class AreaController {

	@Autowired
	CityRepository repocity;
	
	@Autowired
	AreaRepository arearepo;
	
	
	
	@PostMapping("savearea")
	public String saveareadetails(AreaEntity areaentity) {
		arearepo.save(areaentity);
		return "redirect:/locationmanagement";
	}
	
	@GetMapping("/getCitiesByState/{stateId}")
	@ResponseBody
	public List<CityEntity> getCitiesByState(@PathVariable int stateId) {
	    return repocity.findByStateId(stateId);
	}

}
