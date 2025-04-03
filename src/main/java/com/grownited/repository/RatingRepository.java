package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.grownited.entity.RatingEntity;

public interface RatingRepository extends JpaRepository<RatingEntity, Integer> {

	// Rating of Particular Restaurants using locationId

//	@Query(value = "SELECT r.location_id, ROUND(COALESCE(AVG(r.rating), 1), 1) AS average_rating FROM ratings r GROUP BY r.location_id", nativeQuery = true)
//	Double findAverageRatingByLocationId(@Param("locationId") Integer locationId);

	@Query(value = "SELECT ROUND(COALESCE(AVG(r.rating), 1), 1) AS average_rating " + "FROM ratings r "
			+ "WHERE r.location_id = :locationId " + "GROUP BY r.location_id", nativeQuery = true)
	Double findAverageRatingByLocationId(@Param("locationId") Integer locationId);

	List<RatingEntity> findByLocationId(Integer locationId);

}
