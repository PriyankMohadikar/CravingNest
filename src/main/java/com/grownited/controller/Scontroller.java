package com.grownited.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;

@Controller
public class Scontroller {

	// Global Repository user created
	@Autowired
	UserRepository repoUser;

	@GetMapping("login")
	public String login() {
		return "Login";
	}

	@GetMapping(value = { "/", "signup" })
	public String signup() {
		return "Signup";
	}

	@GetMapping("forgetpassword")
	public String forgetpassword() {
		return "Forgetpassword"; // return should match the jsp page NAME
	}

	@GetMapping("listuser")
	public String viewuser(Model model) {
		List<UserEntity> userlist = repoUser.findAll();
		model.addAttribute("userlist", userlist);
		return "Listuser";
	}

	// create global object for Repository for insertion in UserEntity(users table)

	@PostMapping("saveuser")
	public String saveUser(UserEntity userentity) {
		userentity.setCreatedAt(new Date());
		// Role name Should always in Caps
		userentity.setRole("USER");
		userentity.setIsactive(true);
		System.out.println(userentity.getFirstName());
		System.out.println(userentity.getLastName());
		System.out.println(userentity.getEmail());
		System.out.println(userentity.getContact());
		System.out.println(userentity.getGender());
		System.out.println(userentity.getPassword());
		System.out.println(userentity.getCreatedAt());
		System.out.println(userentity.getIsactive());
		System.out.println(userentity.getRole());
		repoUser.save(userentity);
		return "Login";// jsp page
	}

	@PostMapping("gotostate")
	public String gotostate() {
		return "Newstate";
	}

	@PostMapping("sendotp")
	public String changepassword() {
		return "ChangePassword";
	}

	@PostMapping("updatepassword")
	public String updatePassword() {
		return "Login";
	}

}
