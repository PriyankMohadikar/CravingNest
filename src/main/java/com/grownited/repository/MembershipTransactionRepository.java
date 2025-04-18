package com.grownited.repository;

import com.grownited.dto.PaymentHistoryDTO;
import com.grownited.entity.MembershipTransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MembershipTransactionRepository extends JpaRepository<MembershipTransactionEntity, Long> {
    
	List<MembershipTransactionEntity> findByUserId(Integer userId);
    
    
    boolean existsByCouponCode1OrCouponCode2OrCouponCode3(String couponCode1, String couponCode2, String couponCode3);
    
    @Query(value = "SELECT u.first_name AS firstName, m.email, m.amount, m.coupon_code1 AS couponCode1, " +
            "m.coupon_code2 AS couponCode2, m.coupon_code3 AS couponCode3, " +
            "DATE_FORMAT(m.coupon_expiry_date, '%d/%m/%y') AS couponExpiryDate, m.transaction_id AS transactionId " +
            "FROM membership_transactions m " +
            "JOIN users u ON m.user_id = u.user_id " +
            "WHERE m.user_id = :userId", nativeQuery = true)
    List<PaymentHistoryDTO> getPaymentHistoryByUserId(@Param("userId") Integer userId);
    
    
    boolean existsByUserIdAndPaymentStatus(Integer userId, String paymentStatus);
}



    
