package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Scontroller {

	 @GetMapping("login")
	public String login() {
		return "Login";
	}
	
	 @GetMapping(value = {"/","signup"})
	public String signup() {
		return "Signup";
	}
	
	 @GetMapping("forgetpassword")
	 public String forgetpassword() {
			return "Forgetpassword"; // return should match the jsp page NAME
	 }
	 
	 @PostMapping("saveuser")
	 public String saveUser() {
			return "Login";//jsp
		}
	 
	 
	 
	 
}
