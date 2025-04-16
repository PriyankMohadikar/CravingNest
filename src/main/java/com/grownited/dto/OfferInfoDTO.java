package com.grownited.dto;

import java.sql.Date;

public class OfferInfoDTO {

	private String address;
	private String description;
	private String foodType;
	private String title;
	private String offerPicPath;
	private Date endDate;

	
	public OfferInfoDTO(String address, String description, String foodType, String title, String offerPicPath,
			Date endDate) {
		this.address = address;
		this.description = description;
		this.foodType = foodType;
		this.title = title;
		this.offerPicPath = offerPicPath;
		this.endDate = endDate;
	}

	public String getAddress() {
		return address;
	}

	public String getDescription() {
		return description;
	}

	public String getFoodType() {
		return foodType;
	}

	public String getTitle() {
		return title;
	}

	public String getOfferPicPath() {
		return offerPicPath;
	}

	public Date getEndDate() {
		return endDate;
	}
}
