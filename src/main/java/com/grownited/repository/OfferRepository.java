package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.grownited.entity.OfferEntity;

public interface OfferRepository extends JpaRepository<OfferEntity, Integer>  {

	  List<OfferEntity> findByActiveTrue();
	  
//	  For Admin Panel List of Restaurants Offers 
	  
	  @Query(value = "SELECT l.title AS locationTitle, l.food_type AS locationFoodType, a.area_name AS areaName, c.city_name AS cityName, o.food_type AS offerFoodType, o.end_date AS endDate, o.title AS offerTitle, o.active AS offerActive, o.offer_id AS offerId " +
              "FROM location l " +
              "INNER JOIN cities c ON l.city_id = c.city_id " +
              "INNER JOIN areas a ON l.area_id = a.area_id " +
              "INNER JOIN offers o ON l.location_id = o.location_id", nativeQuery = true)
	  List<Object[]> fetchAllOffersWithLocationDetails();

}
