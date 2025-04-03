package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.LocationEntity;

@Repository
public interface LocationRepository extends JpaRepository<LocationEntity, Integer> {

	@Query(value = "select l.title,l.food_type,a.area_name,c.city_name,l.active,l.location_id from location l,areas a,cities c where l.city_id = c.city_id and l.area_id = a.area_id;", nativeQuery = true)
	List<Object[]> getAll();

	List<LocationEntity> findByActiveTrue(); // Fetch only active locations
}
