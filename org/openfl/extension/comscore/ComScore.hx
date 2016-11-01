package org.openfl.extension.comscore;

#if android
import org.openfl.extension.comscore.android.ComScoreCFFI;
#elseif ios
import org.openfl.extension.comscore.ios.ComScoreCFFI;
#end

class ComScore {

    public static function init(clientId:String, publisherSecret:String) {
        ComScoreCFFI.init(clientId, publisherSecret);
    }

    public static function enableAutoUpdate(interval:Int, foregroundOnly:Bool):Void {
        ComScoreCFFI.enableAutoUpdate(interval, foregroundOnly);
    }

    public static function onExitForeground():Void {
        ComScoreCFFI.onExitForeground();
    }

    public static function onEnterForeground():Void {
        ComScoreCFFI.onEnterForeground();
    }

}