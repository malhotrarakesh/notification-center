package com.gl.notificationcenter.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gl.notificationcenter.manager.NotificationManager;
import com.gl.notificationcenter.model.RoleEnum;
import com.gl.notificationcenter.model.User;

@Controller
public class UsersController {

	@Autowired
	private NotificationManager notificationManager;
	
	@RequestMapping(path = "/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute User user) {
		// represents a case of User Registration
		boolean isRegistration = (user.getRoleEnum() == null);
		if(isRegistration) {
			user.setRoleEnum(RoleEnum.USER);
		}
		notificationManager.addUser(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("thankYou");
		
		if(!isRegistration) {
			modelAndView.setViewName("adminHome");
			modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
		}
		return modelAndView;
	}
	
	
	@RequestMapping(path = "/getUsers", method = RequestMethod.GET)
	public ModelAndView getUsers(@ModelAttribute List<User> users) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("usersHome");
		modelAndView.addObject("users", notificationManager.getUsers(users));
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/updateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute User user) {
		notificationManager.updateUser(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("usersHome");
		modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/deleteUser", method = RequestMethod.POST)
	public ModelAndView deleteUser(@ModelAttribute User user) {
		notificationManager.deleteUser(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("usersHome");
		modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
		
		return modelAndView;
	}
	
}
