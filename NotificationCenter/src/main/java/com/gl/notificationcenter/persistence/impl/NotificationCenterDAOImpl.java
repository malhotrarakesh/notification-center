package com.gl.notificationcenter.persistence.impl;

import java.util.List;

import com.gl.notificationcenter.model.Event;
import com.gl.notificationcenter.model.SubscriptionInfo;
import com.gl.notificationcenter.model.User;
import com.gl.notificationcenter.persistence.NotificationCenterDAO;

public class NotificationCenterDAOImpl implements NotificationCenterDAO {

	public List<Event> getEvents(List<Event> events) {
		return null;
	}

	public void createEvent(Event event) {
	}

	public void deleteEventById(Event event) {
	}

	public void updateEvent(Event event) {
	}

	public boolean authenticate(User user) {
		return false;
	}

	public void addUser(User user) {
	}

	public void updateUser(User user) {
	}

	public void deleteUser(User user) {
	}

	public List<User> getUser(List<User> users) {
		return null;
	}

	public void subscribe(SubscriptionInfo subscriptionInfo) {
	}

	public void unsubscribe(SubscriptionInfo subscriptionInfo) {
	}
	
}
