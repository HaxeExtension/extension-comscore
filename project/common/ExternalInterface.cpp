#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include <stdio.h>
#include <hxcpp.h>
#include "OpenFLComScore.h"

using namespace openflcomscore;

AutoGCRoot* comscoreEventHandle = 0;

static value openflcomscore_setcustomerc2(value clientid) 
{
	#ifdef IPHONE
	setCustomerC2(val_string(clientid));
	#endif
	return alloc_null();
}
DEFINE_PRIM (openflcomscore_setcustomerc2, 1);

static value openflcomscore_setpublishersecret(value secret)
{
	#ifdef IPHONE
	setPublisherSecret(val_string(secret));
	#endif
	return alloc_null();
}
DEFINE_PRIM (openflcomscore_setpublishersecret, 1);

static value openflcomscore_setappcontext()
{
	#ifdef IPHONE
	setAppContext();
	#endif
	return alloc_null();
}
DEFINE_PRIM (openflcomscore_setappcontext, 0);

static value openflcomscore_enableautoupdate(value interval, value foregroundOnly)
{
	#ifdef IPHONE
	enableAutoUpdate(val_int(interval), val_bool(foregroundOnly));
	#endif
	return alloc_null();
}
DEFINE_PRIM (openflcomscore_enableautoupdate, 2);

static value openflcomscore_onuxactive()
{
	#ifdef IPHONE
	onUxActive();
	#endif
	return alloc_null();
}
DEFINE_PRIM (openflcomscore_onuxactive, 0);

static value openflcomscore_onuxinactive()
{
	#ifdef IPHONE
	onUxInactive();
	#endif
	return alloc_null();
}
DEFINE_PRIM (openflcomscore_onuxinactive, 0);

extern "C" void openflcomscore_main()
{	
	val_int(0);
}
DEFINE_ENTRY_POINT (openflcomscore_main);

extern "C" int openflcomscore_register_prims() { return 0; }
