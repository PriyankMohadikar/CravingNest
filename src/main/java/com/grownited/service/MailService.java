package com.grownited.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.grownited.dto.OfferInfoDTO;
import com.grownited.dto.UserFoodInterestDTO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;

	 @Async
	    public void sendWelcomemail(String mail, String firstName) {
	        String subject = "Welcome to CravingNest – Your Food Adventures Start Here! 🍽️🎉";
	        String body = "Hey " + firstName
	                + ", Great news! 🎉 Your search for the best food deals just got easier with CravingNest! 🍕🍔\n"
	                + "Find exclusive discounts, Buy One Get One Free (BOGO) offers, and special deals from your favorite restaurants near you!";
	        sendEmail(mail, subject, body);
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
	
	// Scenario 1: Send mail when a new offer is added
    @Async
    public void sendOfferToInterestedUsers(List<UserFoodInterestDTO> interestedUsers, OfferInfoDTO offer) {
        for (UserFoodInterestDTO user : interestedUsers) {
            String email = user.getEmail();

            String subject = "🎉 New Offer Just For You at CravingNest!";
            String body = "<html><body>" +
                    "<h2>🎉 New Offer Just For You at CravingNest!</h2>" +
                    "<p>Hey Foodie! 🍽️</p>" +
                    "<p>We found a new food deal that matches your interest: <strong>" + offer.getFoodType() + "</strong></p>" +
                    "<p><strong>📍 Address:</strong> " + offer.getAddress() + "<br>" +
                    "<strong>🍽️ Title:</strong> " + offer.getTitle() + "<br>" +
                    "<strong>📝 Description:</strong> " + offer.getDescription() + "<br>" +
                    "<strong>📅 Valid until:</strong> " + offer.getEndDate() + "</p>" +
                    "<p><img src='" + offer.getOfferPicPath() + "' alt='Offer Image' style='max-width:100%; height:auto; border-radius:10px;'/></p>" +
                    "<p>Enjoy your delicious moments!<br><strong>- CravingNest 🍕</strong></p>" +
                    "</body></html>";

            sendEmail(email, subject, body);
        }
    }

    //Scenario 2: User submits food interest form
    @Async
    public void sendMatchingOffersToUser(String email, List<OfferInfoDTO> matchedOffers) {
        if (matchedOffers == null || matchedOffers.isEmpty()) {
            return;
        }

        StringBuilder body = new StringBuilder();
        body.append("Hey Foodie! 🍽️\n\n")
            .append("Here are some offers matching your food interests:\n\n");

        for (OfferInfoDTO offer : matchedOffers) {
            body.append("🍽️ *").append(offer.getTitle()).append("*\n")
                .append("📍 Address: ").append(offer.getAddress()).append("\n")
                .append("📝 Description: ").append(offer.getDescription()).append("\n")
                .append("📅 Valid until: ").append(offer.getEndDate()).append("\n")
                .append("🖼️ Image: ").append(offer.getOfferPicPath()).append("\n\n");
        }

        body.append("Bon appétit! \n- CravingNest 🍔");

        sendEmail(email, "🍽️ Offers You’ll Love from CravingNest!", body.toString());
    }
    
    
    // Payment And GOLD member ship confirmation mail
    @Async
    public void sendGoldMembershipSuccessEmail(String email, String firstName) {
        String subject = "🎉 Welcome to CravingNest Gold – Your Food Journey Just Leveled Up!";

        String body = "<html><body style='font-family: Arial, sans-serif;'>" +
                "<h2 style='color: #ff6f61;'>Hi " + firstName + ",</h2>" +
                "<p>🎉 Congratulations on becoming a <strong>Gold Member</strong> of <strong>CravingNest</strong>! 🍽️✨</p>" +

                "<p>Your payment was <strong>successful</strong>, and we’ve added <strong>3 exclusive discount coupons</strong> to your account!</p>" +

                "<h3 style='color: #ffb347;'>🍕 What’s inside your Gold Membership?</h3>" +
                "<ul>" +
                "<li>🎁 <strong>3 Premium Coupons</strong> valid for 1 month</li>" +
                "<li>🔥 <strong>Flat 30% Off</strong> at top-rated restaurants</li>" +
                "<li>📍 Redeemable at select CravingNest-listed partners</li>" +
                "<li>💰 Big savings on your favorite meals every time you order</li>" +
                "</ul>" +

                "<p style='margin-top: 20px;'>Your coupon codes are now active and waiting to be used. Just visit any participating restaurant on CravingNest, and apply your discount at checkout. 🍔🌮🍜</p>" +

                "<p style='margin-top: 30px;'>Enjoy delicious moments, <br><strong style='color: #ff6f61;'>– Team CravingNest</strong> 🍕</p>" +

                "<hr>" +
                "<small style='color: gray;'>Note: Coupons are valid for 30 days from the date of purchase.</small>" +
                "</body></html>";

        sendEmail(email, subject, body);
    }


    // ✅ Common method
    private void sendEmail(String to, String subject, String htmlBody) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            
            helper.setFrom("priyankmohadikar@gmail.com");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlBody, true); // true enables HTML rendering

            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
