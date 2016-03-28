package com.gl.notificationcenter.controller;

import java.util.Arrays;

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
	public ModelAndView loginPage(@ModelAttribute User user, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		boolean isAuthenticated = notificationManager.authenticate(user);
		
		if(isAuthenticated) {
			User currentUser = notificationManager.getUsers(Arrays.asList(user)).get(0);
			request.getSession().setAttribute("currentUser", currentUser);
			RoleEnum roleEnum = notificationManager.getRole(user);
			if(RoleEnum.ADMIN.equals(roleEnum)) {
				modelAndView.setViewName("adminHome");
			} else {
				modelAndView.setViewName("myEvents");
			}
		} else {
			modelAndView.setViewName("login");
			modelAndView.addObject("isError", "true");
		}
		return modelAndView;
	}
	
	@RequestMapping(path = "/logoff")
	public ModelAndView logoff(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("logoff");
		
		request.getSession().invalidate();
		return modelAndView;
	}
	
}
