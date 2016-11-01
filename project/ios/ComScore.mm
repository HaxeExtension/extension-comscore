#import <Foundation/Foundation.h>

#import <ComScore.h>
#import <ComScore/ComScore.h>

namespace extension_comscore
{
	NSString* _clientId;
	NSString* _publisherSecret;

	void init(std::string clientId, std::string publisherSecret) {
		_clientId = [[NSString stringWithUTF8String:clientId.c_str()] retain];
		_publisherSecret = [[NSString stringWithUTF8String:publisherSecret.c_str()] retain];

		SCORPublisherConfiguration *myPublisherConfig = [SCORPublisherConfiguration publisherConfigurationWithBuilderBlock:^(SCORPublisherConfigurationBuilder *builder) {
			builder.publisherId = _clientId;
			builder.publisherSecret = _publisherSecret;
			builder.usagePropertiesAutoUpdateMode = SCORUsagePropertiesAutoUpdateModeDisabled;
		}];

		[[SCORAnalytics configuration] addClientWithConfiguration:myPublisherConfig];

		[SCORAnalytics start];
	}

	void enableAutoUpdate(const int interval, const bool foregroundOnly) {
		//disable tracking for the current configuration 
		[[SCORAnalytics configuration] disable];

		//create new configuration
		SCORPublisherConfiguration *newConfiguration = [SCORPublisherConfiguration publisherConfigurationWithBuilderBlock:^(SCORPublisherConfigurationBuilder *builder) {
			builder.publisherId = _clientId;
			builder.publisherSecret = _publisherSecret;
			builder.usagePropertiesAutoUpdateMode = (foregroundOnly)? SCORUsagePropertiesAutoUpdateModeForegroundOnly: SCORUsagePropertiesAutoUpdateModeForegroundAndBackground;
			builder.usagePropertiesAutoUpdateInterval = (NSInteger)interval;
		}];

		[[SCORAnalytics configuration] addClientWithConfiguration:newConfiguration];
	}
	
	void onExitForeground() {
		[SCORAnalytics notifyExitForeground];
	}

	void onEnterForeground() {
		[SCORAnalytics notifyEnterForeground];
	}
	
}
