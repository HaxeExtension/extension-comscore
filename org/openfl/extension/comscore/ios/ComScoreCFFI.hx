package org.openfl.extension.comscore.ios;

@:build(ShortCuts.mirrors())
@CPP_DEFAULT_LIBRARY("extension_comscore")
@CPP_PRIMITIVE_PREFIX("extension_comscore")
class ComScoreCFFI {

    @CPP public static function init(clientId:String, publisherSecret:String) {}

    @CPP public static function enableAutoUpdate(interval:Int, foregroundOnly:Bool):Void {};

    @CPP public static function onExitForeground():Void {};

    @CPP public static function onEnterForeground():Void {};

}

