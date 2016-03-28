package com.gl.notificationcenter.persistence.impl;



import static com.gl.notificationcenter.persistence.NotificationPersistenceConstants.COLLECTION_EVENTS;
import static com.gl.notificationcenter.persistence.NotificationPersistenceConstants.COLLECTION_SUBSCRIPTIONS;
import static com.gl.notificationcenter.persistence.NotificationPersistenceConstants.COLLECTION_USERS;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Filters.in;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import com.gl.notificationcenter.model.Event;
import com.gl.notificationcenter.model.RoleEnum;
import com.gl.notificationcenter.model.SubscriptionInfo;
import com.gl.notificationcenter.model.User;
import com.gl.notificationcenter.persistence.NotificationDao;
import com.google.gson.Gson;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

@Component("notificationDao")
public class NotificationDaoImpl implements NotificationDao {
	
	private static boolean initialize;
	private MongoClient mongoClient;
	private MongoDatabase mongoDatabase;
	
	@Autowired
	private Environment environment;
	
	private Object lock = new Object();
	
	@PostConstruct
	public void initilize(){
		initializeDatabase();
	}
	
	private void initializeDatabase() {
		synchronized (lock) {
			if(!initialize) {
				mongoClient = new MongoClient(environment.getProperty("mongodb.host"), Integer.parseInt(environment.getProperty("mongodb.port")));
				mongoDatabase = mongoClient.getDatabase(environment.getProperty("mongodb.dbName"));
				initialize = true;
			}	
		}
	}
	
	public List<Event> getEvents(List<Event> events) {
		MongoCollection<Document> eventsCollection = mongoDatabase.getCollection(COLLECTION_EVENTS);
		FindIterable<Document> iterable = null;
		
		if(events == null || events.isEmpty()) {
			iterable = eventsCollection.find();	
		} else {
			iterable = eventsCollection.find(in("name", extractEventNames(events)));
		}
		
		List<Event> matchedEvents = new ArrayList<Event>();
		MongoCursor<Document> iterator = iterable.iterator();
		
		while(iterator.hasNext()) {
			matchedEvents.add(new Gson().fromJson(iterator.next().toJson(), Event.class));
		}
		
		return matchedEvents;
	}

	public void addEvent(Event event) {
		MongoCollection<Document> events = mongoDatabase.getCollection(COLLECTION_EVENTS);
		events.insertOne(Document.parse(new Gson().toJson(event)));
	}

	public void deleteEvent(Event event) {
		MongoCollection<Document> events = mongoDatabase.getCollection(COLLECTION_EVENTS);
		events.findOneAndDelete(eq("name", event.getName()));
	}

	public void updateEvent(Event event) {
		MongoCollection<Document> events = mongoDatabase.getCollection(COLLECTION_EVENTS);
		events.findOneAndUpdate(eq("name", event.getName()), new Document("$set", 
				new Document("title", event.getTitle()).
				append("description", event.getDescription()).
				append("scheduledOn", event.getScheduledOn()).
				append("status", event.getStatus())
				));
	}

	public boolean authenticate(User user) {
//		user.setConfirmPassword("password");
//		user.setEmailAddress("rakesh.malhotra@globallogic.com");
//		user.setFirstName("Rakesh");
//		user.setLastName("Malhotra");
//		user.setRoleEnum(RoleEnum.ADMIN);
//		
//		addUser(user);
//		
//		return false;
		MongoCollection<Document> users = mongoDatabase.getCollection(COLLECTION_USERS);
		FindIterable<Document> iterable = users.find(and(eq("username", user.getUsername()), eq("password", user.getPassword())));
		
		return iterable.iterator().hasNext();
	}

	public List<User> getUsers(List<User> users) {
		MongoCollection<Document> usersCollection = mongoDatabase.getCollection(COLLECTION_USERS);
		
		FindIterable<Document> iterable = null;
		
		if(users == null || users.isEmpty()) {
			iterable = usersCollection.find();	
		} else {
			iterable = usersCollection.find(in("username", extractUsernames(users)));
		}
		
		List<User> matchedUsers = new ArrayList<User>();
		MongoCursor<Document> iterator = iterable.iterator(); 
		while(iterator.hasNext()) {
			matchedUsers.add(new Gson().fromJson(iterator.next().toJson(), User.class));
		}
		
		return matchedUsers;
	}

	public void addUser(User user) {
		MongoCollection<Document> users = mongoDatabase.getCollection(COLLECTION_USERS);
		users.insertOne(Document.parse(new Gson().toJson(user)));
	}

	public void updateUser(User user) {
		MongoCollection<Document> usersCollection = mongoDatabase.getCollection(COLLECTION_USERS);

		usersCollection.updateOne(eq("username", user.getUsername()), new Document("$set", 
				new Document("firstName", user.getFirstName()).
											append("lastName", user.getLastName()).
											append("roleEnum", user.getRoleEnum().toString()).
											append("password", user.getPassword()).
											append("confirmPassword", user.getConfirmPassword()).
											append("emailAddress", user.getEmailAddress())
				));
	}

	public void deleteUser(User user) {
		MongoCollection<Document> users = mongoDatabase.getCollection(COLLECTION_USERS);
		users.findOneAndDelete(eq("username", user.getUsername()));
	}
	
	public boolean isDuplicateUser(User user) {
		MongoCollection<Document> users = mongoDatabase.getCollection(COLLECTION_USERS);
		FindIterable<Document> iterable = users.find(eq("username", user.getUsername()));
		return iterable != null && iterable.iterator().hasNext();
	}

	public boolean isDuplicateEvent(Event event) {
		MongoCollection<Document> events = mongoDatabase.getCollection(COLLECTION_EVENTS);
		FindIterable<Document> iterable = events.find(eq("name", event.getName()));
		return iterable != null && iterable.iterator().hasNext();
	}
	
	public RoleEnum getRole(User user) {
		MongoCollection<Document> usersCollection = mongoDatabase.getCollection(COLLECTION_USERS);
		FindIterable<Document> iterable = usersCollection.find(eq("username", user.getUsername()));
		MongoCursor<Document> iterator = iterable.iterator();
		user = new Gson().fromJson(iterator.next().toJson(), User.class);
		
		return user.getRoleEnum();
	}
	
	public void subscribe(SubscriptionInfo subscriptionInfo) {
		MongoCollection<Document> subscriptions = mongoDatabase.getCollection(COLLECTION_SUBSCRIPTIONS);
		FindIterable<Document> iterable = subscriptions.find(and(eq("username", subscriptionInfo.getUser().getUsername()), eq("id", subscriptionInfo.getEvent().getName())));
		if(iterable.iterator().hasNext()) {
			subscriptions.updateOne(and(eq("username", subscriptionInfo.getUser().getUsername()), eq("id", subscriptionInfo.getEvent().getName())), Document.parse(new Gson().toJson(subscriptionInfo)));
		} else {
			subscriptions.insertOne(Document.parse(new Gson().toJson(subscriptionInfo)));
		}
	}

	public void unsubscribe(SubscriptionInfo subscriptionInfo) {
		MongoCollection<Document> subscriptions = mongoDatabase.getCollection(COLLECTION_SUBSCRIPTIONS);
		FindIterable<Document> iterable = subscriptions.find(and(eq("username", subscriptionInfo.getUser().getUsername()), eq("id", subscriptionInfo.getEvent().getName())));
		
		if(iterable.iterator().hasNext()) {
			subscriptions.deleteOne(and(eq("username", subscriptionInfo.getUser().getUsername()), eq("id", subscriptionInfo.getEvent().getName())));
		}
	}
	
	private static List<String> extractUsernames(List<User> users) {
		List<String> usernames = new ArrayList<String>();
		for (User user : users) {
			usernames.add(user.getUsername());
		}
		return usernames;
	}

	private static List<String> extractEventNames(List<Event> events) {
		List<String> eventNames = new ArrayList<String>();
		for (Event event : events) {
			eventNames.add(event.getName());
		}
		return eventNames;
	}

	public List<SubscriptionInfo> getSubscriptions(User user) {
		MongoCollection<Document> subscriptions = mongoDatabase.getCollection(COLLECTION_SUBSCRIPTIONS);
		FindIterable<Document> iterable = subscriptions.find(eq("username", user.getUsername()));
		
		MongoCursor<Document> iterator = iterable.iterator();
		List<SubscriptionInfo> subscriptionList = new ArrayList<SubscriptionInfo>();
		while (iterator.hasNext()) {
			Document document = (Document) iterator.next();
			subscriptionList.add(new Gson().fromJson(document.toJson(), SubscriptionInfo.class));
		}
		
		return subscriptionList;
	}
	
	public void updateSubscription(SubscriptionInfo subscriptionInfo) {
		MongoCollection<Document> subscriptions = mongoDatabase.getCollection(COLLECTION_SUBSCRIPTIONS);
		subscriptions.findOneAndUpdate(and(eq("username", subscriptionInfo.getUser().getUsername()), eq("title", subscriptionInfo.getEvent().getTitle())), 
				Document.parse(new Gson().toJson(subscriptionInfo)));
	}

}
