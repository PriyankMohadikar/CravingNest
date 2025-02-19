package com.grownited.controller;

//import java.net.http.HttpClient;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;
import com.grownited.service.MailService;

@Controller
public class Scontroller {
	// Global Repository user created
	@Autowired
	UserRepository repoUser;

	// MailService Class object--globally
	@Autowired
	MailService serviceMail;

	// Encryption of password using Bcrypt
	@Autowired
	PasswordEncoder encoder;
	
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
		
		//logic for Password Encryption
		String encPassword = encoder.encode(userentity.getPassword());
		userentity.setPassword(encPassword);
		
		// #save user to database in users table
		repoUser.save(userentity);
		// #mail logic -> Welcome Mail to given mail(usermail)
		serviceMail.sendWelcomemail(userentity.getEmail(), userentity.getFirstName());
		
		return "Login";// Same name As JSP page
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
