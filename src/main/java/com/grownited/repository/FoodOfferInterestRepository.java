package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.dto.OfferInfoDTO;
import com.grownited.dto.UserFoodInterestDTO;
import com.grownited.entity.FoodOfferInterestEntity;

@Repository
public interface FoodOfferInterestRepository extends JpaRepository<FoodOfferInterestEntity, Integer> {

	
	// Scenario 1 : When new Offer is Added
	@Query(value = """
		    SELECT 
		        f.user_id AS userId,
		        f.email AS email,
		        f.food_interest AS foodInterest
		    FROM foodofferinterest f 
		    WHERE EXISTS (
		        SELECT 1 
		        FROM offers o 
		        WHERE o.offer_id = :offerId 
		        AND LOWER(o.food_type) REGEXP CONCAT('.*(', REPLACE(LOWER(f.food_interest), ',', '|'), ').*')
		    )
		""", nativeQuery = true)
		List<UserFoodInterestDTO> findUsersMatchingNewOffer(int offerId);
	
	// Scenario 2 When user submit its Food_interest form data
	@Query(value = """
		    SELECT 
		        l.address AS address,
		        o.description AS description,
		        o.food_type AS foodType,
		        o.title AS title,
		        o.offer_pic_path AS offerPicPath,
		        o.end_date AS endDate
		    FROM offers o
		    JOIN location l ON o.location_id = l.location_id
		    WHERE o.active = 1
		      AND l.active = 1
		      AND EXISTS (
		          SELECT 1 
		          FROM foodofferinterest f 
		          WHERE f.user_id = :userId 
		          AND LOWER(o.food_type) REGEXP CONCAT('.*(', REPLACE(LOWER(f.food_interest), ',', '|'), ').*')
		      )
		""", nativeQuery = true)
		List<OfferInfoDTO> findMatchingOffersForUserInterest(int userId);


}
