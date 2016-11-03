package org.openfl.extension.comscore.ios;

@:build(ShortCuts.mirrors())
@CPP_DEFAULT_LIBRARY("extension_comscore")
@CPP_PRIMITIVE_PREFIX("extension_comscore")
class ComScoreCFFI {

    @CPP public static function init(clientId:String, publisherSecret:String, interval:Int, foregroundOnly:Bool) {}

    @CPP public static function onExitForeground():Void {};

    @CPP public static function onEnterForeground():Void {};

    @CPP public static function onUxActive():Void {};

    @CPP public static function onUxInactive():Void {};

}

