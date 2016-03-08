package com.gl.notificationcenter.provider.aws;

import java.util.List;

import org.springframework.stereotype.Component;

import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.SubscribeRequest;
import com.gl.notificationcenter.model.ChannelInfo;
import com.gl.notificationcenter.model.ChannelTypeEnum;
import com.gl.notificationcenter.model.SubscriptionInfo;
import com.gl.notificationcenter.provider.Provider;

@Component("awsProvider")
public class AwsProviderImpl implements Provider {

	private static AmazonSNSClient snsClient;
	private static String topicArn;
	public AwsProviderImpl() {
		initialize();
	}
	
	private static void initialize() {
		snsClient = AwsClientCreator.getSnsClient();
		topicArn = "";
	}
	
	public void subscribe(SubscriptionInfo subscriptionInfo) {
		List<ChannelInfo> channels = subscriptionInfo.getChannelInfos();
		for (ChannelInfo channelInfo : channels) {
			if(ChannelTypeEnum.EMAIL.equals(channelInfo.getChannelType())) {
				SubscribeRequest request = new SubscribeRequest().withTopicArn(topicArn).withEndpoint(channelInfo.getChannelValue()).withProtocol(channelInfo.getChannelType().getLabel());
				snsClient.subscribe(request);
			}
		}
		
		
	}

	public void unsubscribe(SubscriptionInfo subscriptionInfo) {
		
	}

}
