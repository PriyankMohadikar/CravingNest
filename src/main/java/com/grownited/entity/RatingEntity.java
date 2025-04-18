package com.grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ratings")
public class RatingEntity {

	// Rating & comments on Restaurant Place and Food NOT Offers
	// Connect by locationId in Location table and Rating table
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ratingId; // primary key
	private Integer locationId; // foreign key
	private String comments;
	private Integer rating;
	
	
	public Integer getRatingId() {
		return ratingId;
	}
	public void setRatingId(Integer ratingId) {
		this.ratingId = ratingId;
	}
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public Integer getLocationId() {
		return locationId;
	}
	public void setLocationId(Integer locationId) {
		this.locationId = locationId;
	}
	
	
	
	
}
