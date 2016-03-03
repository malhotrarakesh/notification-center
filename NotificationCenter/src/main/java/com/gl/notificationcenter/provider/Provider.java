package com.gl.notificationcenter.provider;

import com.gl.notificationcenter.model.SubscriptionInfo;

public interface Provider {
	// Subscription
	public abstract void subscribe(SubscriptionInfo subscriptionInfo);

	// Un-subscribe
	public abstract void unsubscribe(SubscriptionInfo subscriptionInfo);
}
