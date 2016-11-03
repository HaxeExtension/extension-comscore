#import <Foundation/Foundation.h>

#import <ComScore.h>
#import <ComScore/ComScore.h>

namespace extension_comscore
{
	void init(std::string clientId, std::string publisherSecret, const int interval, const bool foregroundOnly) {
		NSString* _clientId = [NSString stringWithUTF8String:clientId.c_str()];
		NSString* _publisherSecret = [NSString stringWithUTF8String:publisherSecret.c_str()];

		SCORPublisherConfiguration *myPublisherConfig = [SCORPublisherConfiguration publisherConfigurationWithBuilderBlock:^(SCORPublisherConfigurationBuilder *builder) {
			builder.publisherId = _clientId;
			builder.publisherSecret = _publisherSecret;
			if(interval>0) {
				builder.usagePropertiesAutoUpdateInterval = interval;
				builder.usagePropertiesAutoUpdateMode = (foregroundOnly)? SCORUsagePropertiesAutoUpdateModeForegroundOnly: SCORUsagePropertiesAutoUpdateModeForegroundAndBackground;
			} else {
				builder.usagePropertiesAutoUpdateMode = SCORUsagePropertiesAutoUpdateModeDisabled;
			}
		}];

		[[SCORAnalytics configuration] addClientWithConfiguration:myPublisherConfig];

		[SCORAnalytics start];
	}
	
	void onExitForeground() {
		[SCORAnalytics notifyExitForeground];
	}

	void onEnterForeground() {
		[SCORAnalytics notifyEnterForeground];
	}
	
	void onUxActive() {
		[SCORAnalytics notifyUxActive];
	}

	void onUxInactive() {
		[SCORAnalytics notifyUxInactive];
	}
}
