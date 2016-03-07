package com.gl.notificationcenter.persistence;

import java.util.List;

import org.springframework.stereotype.Component;

import com.gl.notificationcenter.model.Event;
import com.gl.notificationcenter.model.SubscriptionInfo;
import com.gl.notificationcenter.model.User;

@Component
public interface NotificationDao {
	
	// Event related CRUD
	public abstract List<Event> getEvents(List<Event> events);
	public abstract void addEvent(Event event);
	public abstract void deleteEvent(Event event);
	public abstract void updateEvent(Event event);
	
	// Login related
	public abstract boolean authenticate(User user);
	
	// User related
	public abstract void addUser(User user);
	public abstract void updateUser(User user);
	public abstract void deleteUser(User user);
	public abstract List<User> getUsers(List<User> users);
	
	// Subscription 
	public abstract void subscribe(SubscriptionInfo subscriptionInfo);
	
	// Un-subscribe
	public abstract void unsubscribe(SubscriptionInfo subscriptionInfo);
	
}
