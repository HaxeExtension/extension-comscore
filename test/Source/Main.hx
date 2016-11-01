package;

import openfl.display.Sprite;
import openfl.events.Event;

#if android
import org.openfl.extension.comscore.android.ExtensionComScore;
#else if ios
import org.openfl.extension.comscore.ios.ComScoreCFFI;
#end

class Main extends Sprite
{
	private static inline var CUSTOMER_C2:String = "23004024";
	private static inline var PUBLISHER_SECRET:String = "f614d7b7e768166a01bbf96615782c92";

	private static inline var CUSTOMER_C2:String = "23004024";
	private static inline var PUBLISHER_SECRET:String = "f614d7b7e768166a01bbf96615782c92";

	public function new()
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);

	}

	private function addedToStage(event:Event):Void {
		#if android
		trace("Setup comScore: "+CUSTOMER_C2+ "," +PUBLISHER_SECRET);
		ExtensionComScore.init(CUSTOMER_C2, PUBLISHER_SECRET);

		trace("comScore enableAutoUpdate: "+1+ "," +true);
		ExtensionComScore.enableAutoUpdate(1, true);

		stage.addEventListener(Event.DEACTIVATE, pause);
		stage.addEventListener(Event.ACTIVATE, resume);
		
		#else if ios
		
		ComScoreCFFI.init(CUSTOMER_C2, PUBLISHER_SECRET);
		ComScoreCFFI.onEnterForeground();

		ComScoreCFFI.onExitForeground();
		#end
	}

	private function pause(event:Event):Void {
		trace("App pause");
		#if android
		ExtensionComScore.onExitForeground();
		#else
		ComScoreCFFI.onExitForeground();
		#end
	}

	private function resume(event:Event):Void {
		trace("App resume");
		#if android
		ExtensionComScore.onEnterForeground();
		#else
		ComScoreCFFI.onEnterForeground();
		#end
	}
}
