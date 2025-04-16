package com.grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grownited.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer>{

	    Optional<UserEntity> findByEmail(String email);
	    
	    @Query(value = "SELECT COUNT(*) FROM users;", nativeQuery = true)
	    long getTotalUsers();
	    
	    // Count users by month and year
	    @Query(value = "SELECT COUNT(*) FROM users WHERE MONTH(created_at) = :month AND YEAR(created_at) = :year", nativeQuery = true)
	    Long getUsersByMonth(@Param("month") int month, @Param("year") int year);
	    
	 // Count users by year
	    @Query(value = "SELECT COUNT(*) FROM users WHERE YEAR(created_at) = :year", nativeQuery = true)
	    Long getUsersByYear(@Param("year") int year);
	    
	    List<UserEntity> findByRoleAndIsactive(String role,Boolean isactive);
}
