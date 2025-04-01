package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.RatingEntity;

public interface RatingRepository extends JpaRepository<RatingEntity, Integer>{
	
	   //	Rating of Particular Restaurants using locationId
	
	   List<RatingEntity> findByLocationId(Integer locationId);

}
