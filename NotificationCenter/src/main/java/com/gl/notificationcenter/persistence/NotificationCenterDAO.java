package com.gl.notificationcenter.persistence;

import java.util.List;

import com.gl.notificationcenter.model.Event;
import com.gl.notificationcenter.model.SubscriptionInfo;
import com.gl.notificationcenter.model.User;

public interface NotificationCenterDAO {

	// Event related CRUD
	public abstract List<Event> getEvents(List<Event> events);
	public abstract void createEvent(Event event);
	public abstract void deleteEventById(Event event);
	public abstract void updateEvent(Event event);
	
	// Login related
	public abstract boolean authenticate(User user);
	
	// User related
	public abstract void addUser(User user);
	public abstract void updateUser(User user);
	public abstract void deleteUser(User user);
	public abstract List<User> getUser(List<User> users);
	
	// Subscription 
	public abstract void subscribe(SubscriptionInfo subscriptionInfo);
	
	// Un-subscribe
	public abstract void unsubscribe(SubscriptionInfo subscriptionInfo);
	
}
