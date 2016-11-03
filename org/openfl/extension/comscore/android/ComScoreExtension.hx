package org.openfl.extension.comscore.android;

import openfl.utils.JNI;

@:build(ShortCuts.mirrors())
class ComScoreExtension {

    public static function init(customerId:String, publisherSecret:String, interval:Int, foregroundOnly:Bool):Void {
        setAppContext();
		
        setCustomerC2(customerId);
		setPublisherSecret(publisherSecret);
		
        enableAutoUpdate(interval, foregroundOnly);

        onEnterForeground();
    } 

    @JNI("org.openfl.extension.comscore", "setAppContext")
    public static function setAppContext():Void {};

    @JNI("org.openfl.extension.comscore", "setCustomerC2")
    public static function setCustomerC2(clientID:String):Void {}

    @JNI("org.openfl.extension.comscore", "setPublisherSecret")
    public static function setPublisherSecret(publisherSecret:String):Void {}

    @JNI("org.openfl.extension.comscore", "enableAutoUpdate")
    public static function enableAutoUpdate(interval:Int, foregroundOnly:Bool):Void {};

    @JNI("org.openfl.extension.comscore", "onExitForeground")
    public static function onExitForeground():Void {};

    @JNI("org.openfl.extension.comscore", "onEnterForeground")
    public static function onEnterForeground():Void {};

}
