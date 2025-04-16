package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

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
	  
	  // Total offers
	    @Query(value = "SELECT COUNT(*) FROM offers", nativeQuery = true)
	    long getTotalOffers();

	    // Active offers
	    @Query(value = "SELECT COUNT(*) FROM offers WHERE active = 1", nativeQuery = true)
	    long getActiveOffers();
	    
	    
	 // Filter offers by area
	    @Query(value = "SELECT o.* FROM offers o " +
	            "INNER JOIN location l ON o.location_id = l.location_id " +
	            "WHERE o.active = true AND l.area_id = :areaId", nativeQuery = true)
	    List<OfferEntity> findByActiveTrueAndAreaId(@Param("areaId") Integer areaId);

	    // Filter offers by city
	    @Query(value = "SELECT o.* FROM offers o " +
	            "INNER JOIN location l ON o.location_id = l.location_id " +
	            "WHERE o.active = true AND l.city_id = :cityId", nativeQuery = true)
	    List<OfferEntity> findByActiveTrueAndCityId(@Param("cityId") Integer cityId);

	    // Filter offers by state
	    @Query(value = "SELECT o.* FROM offers o " +
	            "INNER JOIN location l ON o.location_id = l.location_id " +
	            "INNER JOIN cities c ON l.city_id = c.city_id " +
	            "WHERE o.active = true AND c.state_id = :stateId", nativeQuery = true)
	    List<OfferEntity> findByActiveTrueAndStateId(@Param("stateId") Integer stateId);
	    
	 // New method to get distinct food types
	    @Query(value = "SELECT DISTINCT l.food_type FROM offers l WHERE l.food_type IS NOT NULL",nativeQuery = true)
	    List<String> findDistinctOffersFoodTypes();

}
