package com.gl.notificationcenter.manager;

import java.util.List;

import com.gl.notificationcenter.model.Event;
import com.gl.notificationcenter.model.SubscriptionInfo;
import com.gl.notificationcenter.model.User;

public class NotificationManager {
	private static NotificationManager instance;

	private NotificationManager() {
	}

	public static NotificationManager getInstance() {
		if (instance == null) {
			instance = new NotificationManager();
		}
		return instance;
	}

	
	public List<Event> getEvents(List<Event> events) {
		return null;
	}

	public void createEvent(Event event) {
	}

	public void deleteEvent(Event event) {
	}

	public void updateEvent(Event event) {
	}

	public boolean authenticate(User user) {
		return false;
	}

	public List<User> getUsers(List<User> users) {
		return null;
	}

	public void addUser(User user) {
	}

	public void updateUser(User user) {
	}

	public void deleteUser(User user) {
	}

	public void subscribe(SubscriptionInfo subscriptionInfo) {
	}

	public void unsubscribe(SubscriptionInfo subscriptionInfo) {
	}
	
}
