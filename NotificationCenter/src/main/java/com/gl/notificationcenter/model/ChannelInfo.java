package com.gl.notificationcenter.model;

public class ChannelInfo {
	private ChannelTypeEnum channelType;
	private String channelValue;

	public ChannelTypeEnum getChannelType() {
		return channelType;
	}
	public void setChannelType(ChannelTypeEnum channelType) {
		this.channelType = channelType;
	}
	public String getChannelValue() {
		return channelValue;
	}
	public void setChannelValue(String channelValue) {
		this.channelValue = channelValue;
	}
}
