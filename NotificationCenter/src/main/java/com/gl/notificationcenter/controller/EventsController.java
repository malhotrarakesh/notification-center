package com.gl.notificationcenter.controller;

import java.util.Arrays;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;

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
	
	
	@RequestMapping(path = "/prepareAddEvent",  method = RequestMethod.GET)
	public ModelAndView prepareAddEvent() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("addEvent");
		return modelAndView;
	}
	
	@RequestMapping(path = "/myEvents", method = RequestMethod.GET)
	public ModelAndView myEvents() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("events", notificationManager.getEvents(Collections.<Event> emptyList()));
		modelAndView.setViewName("myEvents");
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/getEvents", method = RequestMethod.GET)
	public ModelAndView getEvents() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("events", notificationManager.getEvents(Collections.<Event> emptyList()));
		modelAndView.setViewName("getEvents");
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/addEvent",  method = RequestMethod.POST)
	public ModelAndView addEvent(@ModelAttribute Event event) {
		ModelAndView modelAndView = new ModelAndView();
		boolean isDuplicate = notificationManager.isDuplicateEvent(event);
		
		if(!isDuplicate) {
			notificationManager.addEvent(event);	
		}
			
		modelAndView.setViewName("getEvents");
		modelAndView.addObject("events", notificationManager.getEvents(Collections.<Event> emptyList()));
		if(isDuplicate) {
			modelAndView.addObject("isDuplicateEvent", isDuplicate);	
		} else {
			modelAndView.addObject("isEventAdded", "true");	
		}
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/prepareUpdateEvent",  method = RequestMethod.GET)
	public ModelAndView getEvent(String name) {
		Event event = new Event();
		event.setName(name);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("editEvent");
		event = notificationManager.getEvents(Arrays.asList(event)).get(0);
		modelAndView.addObject("event", event);
		return modelAndView;
	}

	
	@RequestMapping(path = "/updateEvent", method = RequestMethod.POST)
	public ModelAndView updateEvent(@ModelAttribute Event event) {
		ModelAndView modelAndView = new ModelAndView();
		notificationManager.updateEvent(event);
		
		modelAndView.setViewName("getEvents");
		modelAndView.addObject("events", notificationManager.getEvents(Collections.<Event> emptyList()));
		modelAndView.addObject("isEventUpdated", "true");
		return modelAndView;
	}
	
	@RequestMapping(path = "/deleteEvent", method = RequestMethod.POST)
	public ModelAndView deleteEvent(HttpServletRequest request, String name) {
		ModelAndView modelAndView = new ModelAndView();
		
		Event event = new Event();
		event.setName(name);

		notificationManager.deleteEvent(event);
		
		modelAndView.setViewName("getEvents");
		modelAndView.addObject("events", notificationManager.getEvents(Collections.<Event> emptyList()));
		modelAndView.addObject("isEventDeleted", "true");
		
		return modelAndView;
	}
}
