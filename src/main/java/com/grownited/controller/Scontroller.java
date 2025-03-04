package com.grownited.controller;

import java.util.Optional;

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

import jakarta.mail.Session;
import jakarta.servlet.http.HttpSession;

@Controller
public class Scontroller {
	// Global Repository user created
	@Autowired
	UserRepository repoUser;

	// Encryption of password using Bcrypt
	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	MailService serviceMail;

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

	@PostMapping("gotostate")
	public String gotostate() {
		return "Newstate";
	}

	
	// Create sendOtpForPassword for generating otp in mailservice class
	@PostMapping("sendotp")
	public String changepassword(String email,HttpSession session) {
		Optional<UserEntity> op = repoUser.findByEmail(email);
		if(op.isEmpty()) {
			return "ChangePassword";
		}else {
			String otp = serviceMail.sendOtpForPassword(email);
			session.setAttribute("otp", otp);
			session.setAttribute("email",email);
			return "ChangePassword";
		}
	}

	// First check mail and match otp from mail and user enterd otp with equals method 
	@PostMapping("updatepassword")
	public String updatePassword(String email,String otp,String password,HttpSession session,Model model) {
		Optional<UserEntity> op = repoUser.findByEmail(email);
		if(op.isEmpty()) {
			model.addAttribute("error", "Invalid Data");
			return "ChangePassword";
		}else {
			UserEntity user = op.get();
			Object storedOtp = session.getAttribute("otp");
			System.out.println(storedOtp);
			if(storedOtp != null && storedOtp.equals(otp)) {
				String encPassword = encoder.encode(password);
				user.setPassword(encPassword);
				repoUser.save(user);
				session.removeAttribute(otp);
				session.removeAttribute(email);
				
			}else {

				model.addAttribute("error", "Invalid Data");
				return "ChangePassword";
			}
		}
		return "Login";
	}

	
	
	
	// Authentication(login) Logic  
	@PostMapping("authenticate")
	public String authuser(String email, String password, Model model, HttpSession session) {

		Optional<UserEntity> op = repoUser.findByEmail(email);
//		    op -> select * from users where email = "email" and password = "password";
		if (op.isPresent()) {
			UserEntity dbuser = op.get();
			// object have all data of the user
			boolean ans = encoder.matches(password, dbuser.getPassword());
			if (ans) {
				session.setAttribute("user", dbuser);
				if (dbuser.getRole().equals("ADMIN")) {
					return "redirect:/admindashboard";
				} else if (dbuser.getRole().equals("USER")) {
					return "redirect:/home";
				} else {
					model.addAttribute("errors", "Please Contact admin for error code #0991");
					return "redirect:/login";
				}
			}
		}
		model.addAttribute("error", "Invalid Credentials");
		return "Login";
	}

	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

}
