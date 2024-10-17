package com.theoutfitapp.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.theoutfitapp.dao.ClothingDao;
import com.theoutfitapp.dao.UserDao;

@Controller
public class AppController {
	
	UserDao dao;
	ClothingDao clothingDao;
	
	@Autowired
	public AppController(UserDao dao, ClothingDao clothingDao) {
		this.dao = dao;
		this.clothingDao = clothingDao;
	}
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {
    	return "home";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(Model model, @ModelAttribute("user") User user) {
    	ModelAndView mav = null;
    	User userRetrieved = null;
    	 	
    	try {
    		userRetrieved = dao.getUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    		System.out.println(userRetrieved);
    		mav = new ModelAndView("wardrobe-main");
    		if (userRetrieved != null) {
    			mav.addObject("displayName", userRetrieved.getDisplayName());
    			model.addAttribute("user", userRetrieved);
    		}
    		else {
    			System.out.println("in else.....");
    			mav = new ModelAndView("home");
    			mav.addObject("error", "username or password is incorrect");
    		}
    	}
    	catch(SQLException e) {
    		System.out.println("exception.....");
    		e.printStackTrace();
    	}
    	
    	return mav;    	
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signupForm() {
    	return "signup";
    }
    
    @RequestMapping(value = "/process_signup", method = RequestMethod.POST)
    public ModelAndView processSignup(@ModelAttribute("user") User user) {
    	ModelAndView mav = new ModelAndView("wardrobe-main");
    	mav.addObject("displayName", user.getDisplayName());
    	
    	dao.saveUser(user);
    	
    	return mav;    	
    }
    
    @RequestMapping(value="/start-building-outfit", method = RequestMethod.GET)
    public ModelAndView startBuildingOutfit(@RequestParam("id") int id, @RequestParam("occasion") String occasion, @RequestParam("clothingType") String type) {
    	ModelAndView mav = new ModelAndView("outfit-builder-page-1");
    	
    	try {
    		List<Clothing> clothingRetrieved = clothingDao.getClothingByTypeAndOccasion(id, type, occasion);
    		
    		User currentUser = dao.getUserById(id);
    		mav.addObject("currentUser", currentUser);
    		System.out.println("clothingRetrieved size: " + clothingRetrieved.size());
    		mav.addObject("clothingRetrieved", clothingRetrieved);
    		//System.out.println("image url: "+clothingRetrieved.get(0).getImageURL());
    		//System.out.println("clothing object: " + clothingRetrieved.get(0).toString());
    		Clothing c1 = clothingRetrieved.get(0);
    		System.out.println("c1 url: "+c1.getImageURL());
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return mav;   	
    }
    
    @RequestMapping(value="/finish-building-outfit", method = RequestMethod.GET)
    public ModelAndView finishBuildingOutfit(@RequestParam("clothingId") int id, @RequestParam("occasion") String occasion, @RequestParam("clothingType") String type, @RequestParam("userId") int userId) {
    	ModelAndView mav = new ModelAndView("outfit-builder-page-2");
    	try {
    		Clothing startingPiece = clothingDao.getClothingById(id);
    		mav.addObject("startingPiece", startingPiece);
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}    
    	
    	List<Clothing> clothesType1, clothesType2;
    	System.out.println(type);
    	System.out.println(type.equals("top"));
    	try {
    		if(type.equals("top")) {
        		clothesType1 = clothingDao.getClothingByTypeAndOccasion(userId, "bottoms", occasion);
        		clothesType2 = clothingDao.getClothingByTypeAndOccasion(userId, "shoes", occasion);
    		}
    		else if(type.equals("bottoms")) {
        		clothesType1 = clothingDao.getClothingByTypeAndOccasion(userId, "top", occasion);
        		clothesType2 = clothingDao.getClothingByTypeAndOccasion(userId, "shoes", occasion);
    		}
    		else if(type.equals("shoes")) {
        		clothesType1 = clothingDao.getClothingByTypeAndOccasion(userId, "top", occasion);
        		clothesType2 = clothingDao.getClothingByTypeAndOccasion(userId, "bottoms", occasion);
    		}
    		else {
        		clothesType1 = null;
        		clothesType2 = null;
    		}
    		

    		mav.addObject("clothesType1", clothesType1);
    		mav.addObject("clothesType2", clothesType2);
    		mav.addObject("index", (int)Math.random() * (clothesType1.size() - 0));
    		System.out.println(clothesType1.size());
    		System.out.println(clothesType2.size());
    		
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    	
        return mav;
    
    }

    
}
