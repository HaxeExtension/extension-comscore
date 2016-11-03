package org.openfl.extension.comscore;

#if android
import org.openfl.extension.comscore.android.ComScoreCFFI;
#elseif ios
import org.openfl.extension.comscore.ios.ComScoreCFFI;
#end

class ComScore {

    @:isVar
    public var clientId(default,null):String;

    @:isVar
    public var publisherSecret(default,null):String;

    @:isVar
    public var interval(default,null):Int;

    @:isVar
    public var foregroundOnly(default,null):Bool;

    public function new(clientId:String, publisherSecret:String, interval:Int, foregroundOnly:Bool) {
        this.clientId = clientId;
        this.publisherSecret = publisherSecret;
        this.interval = interval;
        this.foregroundOnly = foregroundOnly;

        ComScoreCFFI.init(clientId, publisherSecret, interval, foregroundOnly);
    }

    public function onExitForeground():Void {
        ComScoreCFFI.onExitForeground();
    }

    public function onEnterForeground():Void {
        ComScoreCFFI.onEnterForeground();
    }

}