#ifndef COMSCORE_H
#define COMSCORE_H

#include <string>

namespace extension_comscore
{

	void init(std::string clientId, std::string publisherSecret, const int interval, const bool foregroundOnly);
	void onExitForeground();
	void onEnterForeground();
	void onUxActive();
	void onUxInactive();
}

#endif
