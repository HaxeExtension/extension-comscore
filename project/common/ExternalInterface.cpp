#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include <hxcpp.h>

#include <stdio.h>
#include <ComScore.h>

#define safe_alloc_string(a) (alloc_string(a!=NULL ? a : ""))
#define safe_val_call0(func) if (func!=NULL) val_call0(func->get())
#define safe_val_call1(func, arg1) if (func!=NULL) val_call1(func->get(), arg1)
#define safe_val_string(str) str==NULL ? "" : std::string(val_string(str))

static value extension_comscore_init(value clientId, value publisherSecret, value interval, value foregroundOnly) {
	extension_comscore::init(
		safe_val_string(clientId),
		safe_val_string(publisherSecret),
		val_get_int(interval),
		val_get_bool(foregroundOnly)
	);

	return alloc_null();
}
DEFINE_PRIM(extension_comscore_init, 4);

static value extension_comscore_onExitForeground() {
	extension_comscore::onExitForeground();
	return alloc_null();
}
DEFINE_PRIM(extension_comscore_onExitForeground, 0);

static value extension_comscore_onEnterForeground() {
	extension_comscore::onEnterForeground();
	return alloc_null();
}
DEFINE_PRIM(extension_comscore_onEnterForeground, 0);

static value extension_comscore_onUxActive() {
	extension_comscore::onUxActive();
	return alloc_null();
}
DEFINE_PRIM(extension_comscore_onUxActive, 0);

static value extension_comscore_onUxInactive() {
	extension_comscore::onUxInactive();
	return alloc_null();
}
DEFINE_PRIM(extension_comscore_onUxInactive, 0);

extern "C" void extension_comscore_main() {	
	val_int(0); // Fix Neko init
}
DEFINE_ENTRY_POINT (extension_comscore_main);

extern "C" int extension_comscore_register_prims() { 
	return 0; 
}
