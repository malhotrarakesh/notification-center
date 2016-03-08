package com.gl.notificationcenter.model;

import java.util.List;

/**
 * Refers to the class which represents subscription information
 * It includes User who is trying to subscribe to an Event using a list of
 * Channel Info
 */
public class SubscriptionInfo {
	private User user;
	private Event event;
	private List<ChannelInfo> channelInfos;
	private String subscriptionId;;

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public List<ChannelInfo> getChannelInfos() {
		return channelInfos;
	}
	public void setChannelInfos(List<ChannelInfo> channelInfos) {
		this.channelInfos = channelInfos;
	}
	public String getSubscriptionId() {
		return subscriptionId;
	}
	public void setSubscriptionId(String subscriptionId) {
		this.subscriptionId = subscriptionId;
	}
	
}
