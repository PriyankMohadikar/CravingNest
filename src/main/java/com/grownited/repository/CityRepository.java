package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.dto.Citydto;
import com.grownited.entity.CityEntity;

@Repository
public interface CityRepository extends JpaRepository<CityEntity, Integer> {

	@Query(value = "select c.*,s.state_Name from cities c,state s where c.state_id = s.state_id", nativeQuery = true)
	List<Citydto> getAll();

//	List<CityEntity> findByStateStateId(int stateId); // Assuming state is a @ManyToOne in CityEntity

	List<CityEntity> findByStateId(Integer stateId);
}
