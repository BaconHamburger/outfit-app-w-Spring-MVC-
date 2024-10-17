package com.theoutfitapp.controllers;

public class Clothing {
	private int id;
	private int userId;
	private String clothingType;
	private String occasion;
	private String imageURL;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getClothingType() {
		return clothingType;
	}
	
	public void setClothingType(String clothingType) {
		this.clothingType = clothingType;
	}
	
	public String getOccasion() {
		return occasion;
	}
	
	public void setOccasion(String occasion) {
		this.occasion = occasion;
	}
	
	public String getImageURL() {
		return imageURL;
	}
	
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

}
