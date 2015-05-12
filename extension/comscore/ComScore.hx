package extension.comscore;

import openfl.Lib;

class ComScore
{
    /**
     * The Customer C2 is your comScore Client ID.
     */
    public static function setCustomerC2(clientId:String):Void
    {
        #if ios
        openflcomscore_setcustomerc2(clientId);
        #end
    }

    /**
     * The Publisher Secret is a comScore-supplied string used to obfuscate 
     * the ADID when measurements are sent to comScore servers. It is the same
     * for all of your applications, but unique to you, and is required to
     * protect the privacy of your application's users.
     */
    public static function setPublisherSecret(secret:String):Void
    {
        #if ios
        openflcomscore_setpublishersecret(secret);
        #end
    }

    /**
     * You must inform the comScore library of the Application Context by 
     * using the setAppContext method of the comScore library API. This has 
     * to be done before calling any of the other comScore library API methods,
     * including those that define initialization settings for the comScore
     * library.
     */
    public static function setAppContext():Void
    {
        #if ios
        openflcomscore_setappcontext();
        #end
    }

    /**
     * If your application provides a user experience – like the playback of 
     * music or video – then please implement this and onUxInactive.
     *
     * This API method needs to be called whenever your application starts 
     * providing the user experience (i.e., audio and/or video).
     */
    public static function onUxActive():Void
    {
        #if ios
        openflcomscore_onuxactive();
        #end
    }

    /**
     * If your application provides a user experience – like the playback of 
     * music or video – then please implement this and onUxActive.
     *
     * This API method needs to be called whenever your application stops 
     * providing the user experience.
     */
    public static function onUxInactive():Void
    {
        #if ios
        openflcomscore_onuxinactive();
        #end
    }

    /**
     * The comScore library contains an auto-update feature that will update
     * the application usage times on regular intervals. This feature is
     * turned off by default.
     *
     * @param interval An integer interval value in seconds. This parameter 
     *                 has a default value of 60, which is also the minimum value.
     *                 If you provide a value lower than 60 for the interval then 
     *                 the library will use the default value.
     * @param foregroundOnly A boolean flag which will allow auto-update to be active 
     *                       while the application is in the background. The default 
     *                       value of the parameter is YES which means the auto-update 
     *                       feature is only active while the application is in the foreground.
     */
    public static function enableAutoUpdate(interval:Int = 60, foregroundOnly:Bool = true):Void
    {
        #if ios
        openflcomscore_enableautoupdate(interval, foregroundOnly);
        #end
    }

    #if ios
    private static var openflcomscore_setcustomerc2      = Lib.load("openflcomscore", "openflcomscore_setcustomerc2", 1);
    private static var openflcomscore_setpublishersecret = Lib.load("openflcomscore", "openflcomscore_setpublishersecret", 1);
    private static var openflcomscore_setappcontext      = Lib.load("openflcomscore", "openflcomscore_setappcontext", 0);
    private static var openflcomscore_onuxactive         = Lib.load("openflcomscore", "openflcomscore_onuxactive", 0);
    private static var openflcomscore_onuxinactive       = Lib.load("openflcomscore", "openflcomscore_onuxinactive", 0);
    private static var openflcomscore_enableautoupdate   = Lib.load("openflcomscore", "openflcomscore_enableautoupdate", 2);
    #end
}
