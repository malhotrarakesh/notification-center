package com.gl.notificationcenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gl.notificationcenter.manager.NotificationManager;
import com.gl.notificationcenter.model.User;

@Controller
public class LoginController {
	
	@Autowired
	private NotificationManager notificationManager;
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public ModelAndView welcomePage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}
	
	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
	
	@RequestMapping(path = "/submit", method = RequestMethod.POST)
	public ModelAndView loginPage(@ModelAttribute User user) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		
		boolean isAuthenticated = notificationManager.authenticate(user);
		if(isAuthenticated)
			modelAndView.setViewName("myEvents");	
			
		return modelAndView;
	}
	
}
