package com.grownited.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;
import com.grownited.service.MailService;

@Controller
public class Usercontroller {

	// Global Repository user created
	@Autowired
	UserRepository repoUser;

	// MailService Class object--globally
	@Autowired
	MailService serviceMail;

	// Encryption of password using Bcrypt
	@Autowired
	PasswordEncoder encoder;

	// View All data
	@GetMapping("listuser")
	public String listuser(Model model) {
		List<UserEntity> userlist = repoUser.findAll();
		model.addAttribute("userlist", userlist);
		return "Listuser";
	}

	// View By Id single user data
	@GetMapping("viewuser")
	public String viewuserdetails(Integer userId,Model model) {
		System.out.println("User Id :" + userId);
		// optional for NullPointerException
			Optional<UserEntity> op	= repoUser.findById(userId);
			if(op.isPresent()) {
				UserEntity user = op.get();
				model.addAttribute("user",user);
			}
		return "ViewUser";
	}
	
	// Delete user data
	@GetMapping("deleteuser")
	public String deleteuserdetails(Integer userId) {
		repoUser.deleteById(userId);
		return "redirect:/listuser";
	}
	
	@GetMapping("home")
	public String home() {
		return "Home";
	}

	@PostMapping("saveuser")
	public String saveUser(UserEntity userentity) {
		userentity.setCreatedAt(new Date());
		// Role name Should always in Caps
		userentity.setRole("USER");
		userentity.setIsactive(true);

		// logic for Password Encryption
		String encPassword = encoder.encode(userentity.getPassword());
		userentity.setPassword(encPassword);

		// #save user to database in users table
		repoUser.save(userentity);
		// #mail logic -> Welcome Mail to given mail(usermail)
		serviceMail.sendWelcomemail(userentity.getEmail(), userentity.getFirstName());

		return "Login";// Same name As JSP page
	}

}
