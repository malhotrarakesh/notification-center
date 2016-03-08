package com.gl.notificationcenter.provider.aws;

import com.amazonaws.auth.AWSCredentials;

public class AwsAccountCredentials implements AWSCredentials {

	public String getAWSAccessKeyId() {
		return NotificationProviderConstants.ACCESS_KEY;
	}

	public String getAWSSecretKey() {
		return NotificationProviderConstants.SECRET_KEY;
	}

}
