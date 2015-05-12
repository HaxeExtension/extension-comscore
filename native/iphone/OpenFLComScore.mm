#import <Foundation/Foundation.h>
#include <OpenFLComScore.h>
#include <CSComScore.h>
#include <CSCore.h>
#define __STDC_FORMAT_MACROS // not needed in C, only in C++
#include <inttypes.h>

typedef void (*FunctionType)();

namespace openflcomscore
{
	void setCustomerC2(const char* clientid);
	void setPublisherSecret(const char* secret);
	void setAppContext();
	void enableAutoUpdate(const int interval, const bool foregroundOnly);

	void setCustomerC2(const char* clientid)
	{
		NSString* nsClientIdString = [[NSString alloc] initWithUTF8String:clientid];
		NSLog(@"Comscore Set Customer");
		[CSComScore setCustomerC2:nsClientIdString];
	}

	void setPublisherSecret(const char* secret)
	{
		NSString* nsSecretString = [[NSString alloc] initWithUTF8String:secret];
		NSLog(@"Comscore Set Secret");
		[CSComScore setPublisherSecret:nsSecretString];
	}

	void setAppContext()
	{
		NSLog(@"Comscore Set AppContext");
		[CSComScore setAppContext];
	}

	void enableAutoUpdate(const int interval, const bool foregroundOnly)
	{
		[CSComScore enableAutoUpdate:interval foregroundOnly:foregroundOnly];
	}
}
