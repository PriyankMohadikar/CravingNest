package com.grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "foodofferinterest")
public class FoodOfferInterestEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int interestid; // Primary Key - Auto Increment
	private int userId; // Foreign Key from UserEntity
	private String email; // Email to send offer notifications
	private String foodInterest; // Comma-separated list of food types (e.g., "Chinese,Dosa,Desserts")
	public int getInterestid() {
		return interestid;
	}
	public void setInterestid(int interestid) {
		this.interestid = interestid;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFoodInterest() {
		return foodInterest;
	}
	public void setFoodInterest(String foodInterest) {
		this.foodInterest = foodInterest;
	}
	
	

}
