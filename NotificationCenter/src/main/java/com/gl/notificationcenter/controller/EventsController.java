package com.gl.notificationcenter.controller;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gl.notificationcenter.manager.NotificationManager;
import com.gl.notificationcenter.model.Event;

@Controller
public class EventsController {
	
	@Autowired
	private NotificationManager notificationManager;
	
	@RequestMapping(path = "/myEvents", method = RequestMethod.GET)
	public ModelAndView getEvents() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("events", notificationManager.getEvents(Collections.<Event>emptyList()));
		modelAndView.setViewName("myEvents");
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/addEvent", method = RequestMethod.POST)
	public ModelAndView addEvent(@ModelAttribute Event event) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("getEvents");
		notificationManager.addEvent(event);	
		
		return modelAndView;
	}
	
	
	@RequestMapping(path = "/updateEvent", method = RequestMethod.POST)
	public ModelAndView updateEvent(@ModelAttribute Event event) {
		ModelAndView modelAndView = new ModelAndView();
		notificationManager.updateEvent(event);
		modelAndView.setViewName("getEvents");
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/deleteEvent", method = RequestMethod.POST)
	public ModelAndView deleteEvent(@ModelAttribute Event event) {
		ModelAndView modelAndView = new ModelAndView();
		notificationManager.deleteEvent(event);
		modelAndView.setViewName("getEvents");
		
		return modelAndView;
	}
}
