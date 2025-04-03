package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grownited.entity.OfferRatingEntity;

@Repository
public interface OfferRatingRepository extends JpaRepository<OfferRatingEntity, Integer> {

	List<OfferRatingEntity> findByofferId(Integer offerId);
	
    // Find average rating for a specific offerId
	@Query("SELECT COALESCE(ROUND(AVG(r.rating), 1), 1) FROM OfferRatingEntity r WHERE r.offerId = :offerId")
    Double findAverageRatingByOfferId(@Param("offerId") Integer offerId);
}
