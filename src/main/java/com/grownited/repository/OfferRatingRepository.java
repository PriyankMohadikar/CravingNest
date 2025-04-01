package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.OfferRatingEntity;

@Repository
public interface OfferRatingRepository extends JpaRepository<OfferRatingEntity, Integer> {

	List<OfferRatingEntity> findByofferId(Integer offerId);

}
