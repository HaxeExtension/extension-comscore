#ifndef OPENFLCOMSCORE_H
#define OPENFLCOMSCORE_H

namespace openflcomscore
{
	void setCustomerC2(const char* clientid);
	void setPublisherSecret(const char* secret);
	void setAppContext();
	void enableAutoUpdate(const int interval, const bool foregroundOnly);
}

#endif
