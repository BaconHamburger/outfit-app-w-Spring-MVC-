package com.theoutfitapp.dao;

import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.theoutfitapp.controllers.User;

@Component
public class UserDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
    public User getUserById(int id) throws SQLException {
		try {
			String sql = "SELECT * FROM users WHERE id= ?";
			return template.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<User>(User.class));
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public User getUserByUsernameAndPassword(String username, String password) throws SQLException {
		try {
			String sql = "SELECT * FROM users WHERE username =? AND passwords =?";
			return template.queryForObject(sql, new Object[] {username, password}, new BeanPropertyRowMapper<User>(User.class));
		} 
		catch(EmptyResultDataAccessException e) {
			return null;	
		}
	}
	
    public int saveUser(User user) {
    	String sql = "INSERT INTO users(id, username, passwords, display_name) "
    				 + "VALUES("+user.getId()+",\""+user.getUsername()+"\",\""+user.getPassword()+"\",\""+user.getDisplayName()+"\""+")";
    	return template.update(sql);
    }
	
}
