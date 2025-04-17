package com.grownited.controller.admin;

import com.grownited.dto.PaymentHistoryDTO;
import com.grownited.entity.MembershipTransactionEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.MembershipTransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class MembershipTransactionController {

    @Autowired
    private MembershipTransactionRepository transactionRepository;

    private static final String COUPON_PREFIX = "CN-GOLD-";
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int CODE_LENGTH = 6;
    private static final SecureRandom RANDOM = new SecureRandom();
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yy");

    // Display payment form (GET)
    @GetMapping("purchasemembership")
    public String showPaymentForm(HttpSession session, Model model) {
        // Check if user is logged in (userId and email in session)
        UserEntity user = (UserEntity)session.getAttribute("user"); 
        
        Integer userId = user.getUserId();
        String email = user.getEmail();
        
        
        if (userId == null || email == null) {
            return "redirect:/login"; // Redirect to login if session data is missing
        }
        model.addAttribute("userId", userId);
        model.addAttribute("email", email);
        return "PaymentForm"; // JSP page for entering card details
    }

    // Handle dummy payment and save transaction (POST)
    @PostMapping("process-payment")
    public String processPayment(
            @RequestParam("userId") String userId,
            @RequestParam("email") String email,
            @RequestParam("cardType") String cardType,
            @RequestParam("cardNumber") String cardNumber,
            @RequestParam("cvv") String cvv,
            Model model) {

        // Simulate payment (assume always successful for dummy transaction)
        MembershipTransactionEntity transaction = new MembershipTransactionEntity();
        transaction.setUserId(userId);
        transaction.setEmail(email);
        transaction.setAmount(30.0); // Fixed Gold Membership cost
        transaction.setTransactionId("TXN-" + UUID.randomUUID().toString().substring(0, 8));
        transaction.setInvoiceId("INV-" + UUID.randomUUID().toString().substring(0, 8));
        transaction.setPaymentStatus("SUCCESS");

        // Generate 3 unique coupon codes
        String couponCode1 = generateCouponCode();
        String couponCode2 = generateCouponCode();
        String couponCode3 = generateCouponCode();

        // Ensure coupon codes are unique
        while (transactionRepository.existsByCouponCode1OrCouponCode2OrCouponCode3(couponCode1, couponCode1, couponCode1) ||
               transactionRepository.existsByCouponCode1OrCouponCode2OrCouponCode3(couponCode2, couponCode2, couponCode2) ||
               transactionRepository.existsByCouponCode1OrCouponCode2OrCouponCode3(couponCode3, couponCode3, couponCode3)) {
            couponCode1 = generateCouponCode();
            couponCode2 = generateCouponCode();
            couponCode3 = generateCouponCode();
        }

        transaction.setCouponCode1(couponCode1);
        transaction.setCouponCode2(couponCode2);
        transaction.setCouponCode3(couponCode3);
        transaction.setDiscountPercentage(30.0); // 30% discount per coupon

        // Set coupon expiry date (1 month from now)
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 1);
        transaction.setCouponExpiryDate(calendar.getTime());

        // Set transaction creation date
        transaction.setCreatedAt(new Date());

        // Save transaction to database
        transactionRepository.save(transaction);

        // Fetch payment history for the user
        List<MembershipTransactionEntity> paymentHistory = transactionRepository.findByUserId(userId);

        // Add payment history to model for JSP
        model.addAttribute("paymentHistory", paymentHistory);
        model.addAttribute("dateFormat", DATE_FORMAT);
//        return "redirect:/home"; // JSP page to display payment history
        return "redirect:/paymenthistory";

    }

    //here user can choose to see the payment history of his own
    @GetMapping("paymenthistory")
    public String paymentHistoryUser(HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }
        Integer userId = user.getUserId();

        List<PaymentHistoryDTO> paymentHistory = transactionRepository.getPaymentHistoryByUserId(userId);

        model.addAttribute("paymentHistory", paymentHistory);
        model.addAttribute("dateFormat", DATE_FORMAT);

        return "PaymentHistory"; // Make sure this matches the JSP filename
    }

    
    // Generate unique coupon code
    private String generateCouponCode() {
        StringBuilder code = new StringBuilder(COUPON_PREFIX);
        for (int i = 0; i < CODE_LENGTH; i++) {
            code.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return code.toString();
    }
}