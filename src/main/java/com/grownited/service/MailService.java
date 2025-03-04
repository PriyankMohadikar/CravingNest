package com.grownited.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;

	public void sendWelcomemail(String mail, String firstName) {
		// TODO Auto-generated method stub
		String subject = "Welcome to CravingNest – Your Food Adventures Start Here! 🍽️🎉";
		String body = "Hey " + firstName
				+ ", Great news! 🎉 Your search for the best food deals just got easier with CravingNest! 🍕🍔\r\n"
				+ "Find exclusive discounts, Buy One Get One Free (BOGO) offers, and special deals from your favorite restaurants near you!";
		String from = "priyankmohadikar@gmail.com";

		// logic for Sending mail
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setSubject(subject);
		message.setTo(mail);
		message.setText(body);

		mailSender.send(message);
	}
	
	public String sendOtpForPassword(String email) {
	    // Generate 5-digit OTP (10000 to 99999)
	    Random random = new Random();
	    int otpInt = 10000 + random.nextInt(90000); // Generates number between 10000 and 99999
	    String otp = String.valueOf(otpInt);
	    
	    // Create mail message
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(email);
	    message.setSubject("Password Reset OTP");
	    message.setText("Your OTP for password reset is: " + otp + 
	                   "\nThis OTP is valid for 10 minutes.");
	    
	    // Send email
	    mailSender.send(message);
	    
	    return otp; // Return OTP to store in session
	}
}
