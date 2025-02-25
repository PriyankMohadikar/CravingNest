package com.grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CityEntity;
import com.grownited.entity.StateEntity;
import com.grownited.repository.CityRepository;
import com.grownited.repository.StateRepository;

@Controller
public class Statecontroller {

	@Autowired
	StateRepository repoState;

	@Autowired
	CityRepository repocity;

	@GetMapping("addstate")
	public String state() {
		return "Newstate";
	}

	@PostMapping("savestate")
	public String addcity(StateEntity state) {
		System.out.println(state.getStateName());
		repoState.save(state);
		return "Newstate";
	}
}
