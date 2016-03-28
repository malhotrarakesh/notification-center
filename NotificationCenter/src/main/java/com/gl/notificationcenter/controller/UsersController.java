package com.gl.notificationcenter.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(path = "/prepareAddUser",  method = RequestMethod.GET)
	public ModelAndView addUser(String username) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("addUser");
		return modelAndView;
	}
	
	@RequestMapping(path = "/submitAddUser", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute User user) {
		ModelAndView modelAndView = new ModelAndView();
		
		// represents a case of User Registration
		boolean isRegistration = (user.getRoleEnum() == null);	
		boolean isDuplicate = notificationManager.isDuplicateUser(user);
		
		if(isDuplicate) {
			if(isRegistration) {
				modelAndView.setViewName("login");
				modelAndView.addObject("duplicateUser", "true");
				return modelAndView;
			} else {
				modelAndView.setViewName("getUsers");
				modelAndView.addObject("isDuplicateUser", "true");
				modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
				return modelAndView;
			}
		}
		
		if(isRegistration) {
			user.setRoleEnum(RoleEnum.USER);
		}
		
		notificationManager.addUser(user);
		
		modelAndView.setViewName("thankYou");
		
		if(!isRegistration) {
			modelAndView.setViewName("getUsers");
			modelAndView.addObject("isUserAdded", "true");
			modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
		}
		return modelAndView;
	}
	
	@RequestMapping(path = "/getUsers", method = RequestMethod.GET)
	public ModelAndView getUsers(HttpServletRequest request) {
		String isLast = (String)request.getParameter("isLast");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("getUsers");
		modelAndView.addObject("isLast", isLast);		
		modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
		return modelAndView;
	}
	
	@RequestMapping(path = "/prepareUpdateUser",  method = RequestMethod.GET)
	public ModelAndView getUser(String username) {
		User user = new User();
		user.setUsername(username);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("editUser");
		modelAndView.addObject("user", notificationManager.getUsers(Arrays.asList(user)).get(0));
		return modelAndView;
	}
	
	@RequestMapping(path = "/submitUpdateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute User user) {
		notificationManager.updateUser(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("getUsers");
		modelAndView.addObject("isUserUpdated", "true");
		modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/deleteUser", method = RequestMethod.POST)
	public ModelAndView deleteUser(HttpServletRequest request, String username) {
		ModelAndView modelAndView = new ModelAndView();
		List<User> existingUsers = notificationManager.getUsers(Collections.<User> emptyList());
		
		boolean isCurrentUser = false;
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		if(currentUser.getUsername().equalsIgnoreCase(username)) {
			isCurrentUser = true;
		} else {
			User user = new User();
			user.setUsername(username);

			if(existingUsers.contains(user)) {
				notificationManager.deleteUser(user);	
			}
		}
		modelAndView.setViewName("getUsers");
		modelAndView.addObject("isCurrentUser", isCurrentUser);		
		modelAndView.addObject("users", notificationManager.getUsers(Collections.<User> emptyList()));
		return modelAndView;
	}
	
}
