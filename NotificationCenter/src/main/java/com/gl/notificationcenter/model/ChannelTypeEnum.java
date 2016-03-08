package com.gl.notificationcenter.model;

public enum ChannelTypeEnum {
	EMAIL("email"),
	SMS("sms");
	
	private String label;
	private ChannelTypeEnum(String label) {
		this.label = label;
	}
	public String getLabel() {
		return label;
	}
	
}
