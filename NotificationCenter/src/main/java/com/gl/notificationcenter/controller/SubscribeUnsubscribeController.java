package com.gl.notificationcenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gl.notificationcenter.manager.NotificationManager;
import com.gl.notificationcenter.model.SubscriptionInfo;

@Controller
public class SubscribeUnsubscribeController {

	@Autowired
	private NotificationManager notificationManager;
	
	@RequestMapping(path = "/subscribe", method = RequestMethod.POST)
	public ModelAndView subscribe(@ModelAttribute SubscriptionInfo subscriptionInfo) {
		notificationManager.subscribe(subscriptionInfo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("myEvents");
		
		return modelAndView;
	}
	
	@RequestMapping(path = "/unsubscribe", method = RequestMethod.POST)
	public ModelAndView unsubscribe(@ModelAttribute SubscriptionInfo subscriptionInfo) {
		notificationManager.unsubscribe(subscriptionInfo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("myEvents");
		
		return modelAndView;
	}
	
}
