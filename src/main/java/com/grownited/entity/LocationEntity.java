package com.grownited.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "location")
public class LocationEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer locationId;
	private String title; // Restaurant/Food Place Name
	private String category; // e.g., Fast Food, Pizza
	private String description; // Description of the food place
	private String timings; // Opening Hours morning : 9-11 even 5-7 night 9-1
	private Boolean active; // Is the food place active?
	private String contactNumber;
	private String address;
	private Integer cityId; // Foreign Key for City
	private Integer areaId; // Foreign Key for Area
	private String foodType; // E.g., Pizza, Burger
	private String foodPicPath;
	private Date createdDate = new Date(); // Current date by default
	
	  // Date format for dd/MM/yy
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yy");

	
    public String getCreatedDate() {
        return createdDate != null ? DATE_FORMAT.format(createdDate) : null;
    }
    
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
	public Integer getLocationId() {
		return locationId;
	}

	public void setLocationId(Integer locationId) {
		this.locationId = locationId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTimings() {
		return timings;
	}

	public void setTimings(String timings) {
		this.timings = timings;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	public String getFoodPicPath() {
		return foodPicPath;
	}

	public void setFoodPicPath(String foodPicPath) {
		this.foodPicPath = foodPicPath;
	}

}
