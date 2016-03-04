package com.gl.notificationcenter.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gl.notificationcenter.model.Event;
import com.gl.notificationcenter.model.SubscriptionInfo;
import com.gl.notificationcenter.model.User;
import com.gl.notificationcenter.persistence.NotificationDao;
import com.gl.notificationcenter.provider.Provider;

@Service
public class NotificationManager {
	
	@Autowired
	@Qualifier(value = "notificationDao")
	private NotificationDao notificationDao;
	
	@Autowired
	@Qualifier(value = "awsProvider")
	private Provider awsProvider;
	
	public List<Event> getEvents(List<Event> events) {
		return notificationDao.getEvents(events);
	}

	public void createEvent(Event event) {
		notificationDao.createEvent(event);
	}

	public void deleteEvent(Event event) {
		notificationDao.deleteEvent(event);
	}

	public void updateEvent(Event event) {
		notificationDao.updateEvent(event);
	}

	public boolean authenticate(User user) {
		return notificationDao.authenticate(user);
	}

	public List<User> getUsers(List<User> users) {
		return notificationDao.getUsers(users);
	}

	public void addUser(User user) {
		notificationDao.addUser(user);
	}

	public void updateUser(User user) {
		notificationDao.updateUser(user);
	}

	public void deleteUser(User user) {
		notificationDao.deleteUser(user);
	}

	public void subscribe(SubscriptionInfo subscriptionInfo) {
		awsProvider.subscribe(subscriptionInfo);
		notificationDao.subscribe(subscriptionInfo);
	}

	public void unsubscribe(SubscriptionInfo subscriptionInfo) {
		awsProvider.unsubscribe(subscriptionInfo);
		notificationDao.unsubscribe(subscriptionInfo);
	}
}
