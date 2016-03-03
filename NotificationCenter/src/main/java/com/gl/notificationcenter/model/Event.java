package com.gl.notificationcenter.model;

import java.util.Date;

public class Event {
	private int id;
	private String title;
	private String description;
	private Date scheduledOn;
	private Date lastTill;
	private Boolean active;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getScheduledOn() {
		return scheduledOn;
	}
	public void setScheduledOn(Date scheduledOn) {
		this.scheduledOn = scheduledOn;
	}
	public Date getLastTill() {
		return lastTill;
	}
	public void setLastTill(Date lastTill) {
		this.lastTill = lastTill;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}

}
