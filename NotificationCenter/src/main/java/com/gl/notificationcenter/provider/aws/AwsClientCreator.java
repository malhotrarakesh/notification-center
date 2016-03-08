package com.gl.notificationcenter.provider.aws;

import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.sns.AmazonSNSClient;

public class AwsClientCreator {

	private static AmazonSNSClient snsClient;
	static {
		initializeClients();
	}

	/**
	 * Returns the AWS SNS Client
	 */
	public static AmazonSNSClient getSnsClient() {
		initializeClients();
		return snsClient;
	}

	/**
	 * Does the initialization work
	 */
	private static void initializeClients() {
		if (snsClient == null) {
			synchronized (AwsProviderImpl.class) {
				if (snsClient == null) {
					snsClient = new AmazonSNSClient(new AwsAccountCredentials());
					snsClient.setRegion(Region.getRegion(Regions.US_EAST_1));
				}
			}
		}
	}

	
}
