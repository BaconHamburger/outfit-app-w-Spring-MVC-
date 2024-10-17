package com.theoutfitapp.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.theoutfitapp.controllers.Clothing;

@Component
public class ClothingDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public Clothing getClothingById(int clothingId) throws SQLException {
		try {
			String sql = "SELECT id, clothing_type, occasion FROM clothing WHERE id= ?";
			System.out.println(sql);
			return template.queryForObject(sql, new Object[] {clothingId}, new BeanPropertyRowMapper<Clothing>(Clothing.class));
		}
		catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	//get all clothing for a user
	public List<Clothing> getClothingByUserId(int userId) throws SQLException {
		try {
			String sql = "SELECT id, clothing_type, occasion FROM clothing WHERE user_id= ?";
			System.out.println(sql);
			return template.query(sql, new Object[] {userId}, new BeanPropertyRowMapper<Clothing>(Clothing.class));
		} 
		catch(EmptyResultDataAccessException e) {
			System.out.println("empty result...");
			return null;
		}
	}
	
	public List<Clothing> getClothingByTypeAndOccasion(int userId, String clothingType, String occasion) throws SQLException {
		try {
			String sql = "SELECT *, image_url AS imageURL FROM clothing WHERE user_id= ? AND clothing_type= ? AND occasion= ?";
			System.out.println(sql);
			return template.query(sql, new Object[] {userId, clothingType, occasion}, new BeanPropertyRowMapper<Clothing>(Clothing.class));	
		}
		catch(EmptyResultDataAccessException e) {
			System.out.println("empty result..........");
			return null;
		}
	}
	
	

}
