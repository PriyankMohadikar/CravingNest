package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grownited.entity.LocationEntity;

@Repository
public interface LocationRepository extends JpaRepository<LocationEntity, Integer> {

	// list for admin panel
	@Query(value = "select l.title,l.food_type,a.area_name,c.city_name,l.active,l.location_id from location l,areas a,cities c where l.city_id = c.city_id and l.area_id = a.area_id;", nativeQuery = true)
	List<Object[]> getAll();
	
	//ADmin Report
	@Query(value = "select l.title,l.food_type,l.description,a.area_name,c.city_name,l.active,l.location_id from location l,areas a,cities c where l.city_id = c.city_id and l.area_id = a.area_id;", nativeQuery = true)
	List<Object[]> getadminrestoreport();
	
	
	

	List<LocationEntity> findByActiveTrue(); // Fetch only active locations

	// for area wise filter
	@Query(value = "SELECT * FROM location WHERE active = true AND area_id = :areaId", nativeQuery = true)
	List<LocationEntity> findByActiveAndAreaId(Integer areaId);

	@Query(value = "SELECT * FROM location WHERE active = true AND city_id = :cityId", nativeQuery = true)
    List<LocationEntity> findByActiveTrueAndCityId(Integer cityId);

    @Query(value = "SELECT * FROM location WHERE active = true AND city_id IN (SELECT city_id FROM cities WHERE state_id = :stateId)", nativeQuery = true)
    List<LocationEntity> findByActiveTrueAndStateId(Integer stateId);
    
 // Total locations
    @Query(value = "SELECT COUNT(*) FROM location", nativeQuery = true)
    long getTotalLocations();

    // Locations from last month
    @Query(value = "SELECT COUNT(*) FROM location WHERE MONTH(created_date) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AND YEAR(created_date) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)", nativeQuery = true)
    Long getLocationsLastMonth();
    
//    // Find Address for mail using location Id
    @Query(value ="SELECT l.address FROM location l WHERE l.location_id = :locationId",nativeQuery = true)
    String findAddressByLocationId(int locationId);
    
 // New method to get distinct food types
    @Query(value = "SELECT DISTINCT l.food_type FROM location l WHERE l.food_type IS NOT NULL",nativeQuery = true)
    List<String> findDistinctFoodTypes();
    
}
