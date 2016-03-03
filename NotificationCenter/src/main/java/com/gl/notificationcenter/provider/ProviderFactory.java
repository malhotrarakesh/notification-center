package com.gl.notificationcenter.provider;

import com.gl.notificationcenter.provider.aws.AwsProviderImpl;
import com.gl.notificationcenter.shared.ProviderTypeEnum;


public class ProviderFactory {

	// Making it non-instantiable
	private ProviderFactory() {
	}

	// Factory method
	public static Provider getProvider(ProviderTypeEnum providerTypeEnum) {
		if (providerTypeEnum.equals(ProviderTypeEnum.AWS)) {
			return new AwsProviderImpl();
		}
		
		return null;
		
	}
}
