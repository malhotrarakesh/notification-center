package com.gl.notificationcenter.provider;

import org.springframework.stereotype.Component;

import com.gl.notificationcenter.model.SubscriptionInfo;

@Component
public interface Provider {
	// Subscription
	public abstract void subscribe(SubscriptionInfo subscriptionInfo);

	// Un-subscribe
	public abstract void unsubscribe(SubscriptionInfo subscriptionInfo);
}
