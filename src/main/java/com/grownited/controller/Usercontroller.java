package com.grownited.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;
import com.grownited.service.MailService;

import jakarta.servlet.http.HttpSession;

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

	@Autowired
	Cloudinary cloudinary;

	// View All data
	@GetMapping("listuser")
	public String listuser(Model model) {
		List<UserEntity> userlist = repoUser.findAll();
		model.addAttribute("userlist", userlist);
		return "Listuser";
	}

	// View By Id single user data
	@GetMapping("viewuser")
	public String viewuserdetails(Integer userId, Model model) {
		System.out.println("User Id :" + userId);
		// optional for NullPointerException
		Optional<UserEntity> op = repoUser.findById(userId);
		if (op.isPresent()) {
			UserEntity user = op.get();
			model.addAttribute("user", user);
		}
		return "ViewUser";
	}

	// Delete user data
	@GetMapping("deleteuser")
	public String deleteuserdetails(Integer userId) {
		repoUser.deleteById(userId);
		return "redirect:/listuser";
	}

	// edit user data
	@GetMapping("edituser")
	public String editUser(Integer userId, Model model) {
		Optional<UserEntity> op = repoUser.findById(userId);
		if (op.isPresent()) {
			model.addAttribute("user", op.get());
			return "EditUser"; // JSP page for editing user
		}
		return "redirect:/listuser"; // Redirect if user not found
	}

	// Update user data
	@PostMapping("updateuser")
	public String updateUser(UserEntity userEntity, MultipartFile profilePic, HttpSession session) {
		Optional<UserEntity> op = repoUser.findById(userEntity.getUserId());
		if (op.isPresent()) {
			UserEntity existingUser = op.get();

			// Update fields
			existingUser.setFirstName(userEntity.getFirstName());
			existingUser.setLastName(userEntity.getLastName());
			existingUser.setContact(userEntity.getContact());
			existingUser.setGender(userEntity.getGender());
			// if email is change then send mail
			existingUser.setEmail(userEntity.getEmail());
			existingUser.setIsactive(true); // Set active to true by default

			// Handle profile picture update
			if (!profilePic.isEmpty()) {
				try {
					Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
					existingUser.setProfilePicPath(result.get("url").toString());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			UserEntity updateduser = repoUser.save(existingUser);
			session.setAttribute("user", updateduser);
		}
		if ("ADMIN".equals(userEntity.getRole())) {
			return "redirect:/listuser";
		} else {
			return "redirect:/home";
		}
	}

	// saving user data from signup time
	@PostMapping("saveuser")
	public String saveUser(UserEntity userentity, MultipartFile profilePic) {

//		System.out.println(profilePic.getOriginalFilename());
		try {
			Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
			// System.out.println(result);
			System.out.println(result.get("url"));
			userentity.setProfilePicPath(result.get("url").toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
