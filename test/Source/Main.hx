package;

import openfl.display.Sprite;
import openfl.events.Event;

import extension.comscore.ComScore;

#if android
import org.openfl.extension.comscore.android.ExtensionComScore;
#end

class Main extends Sprite
{
	private static inline var EXAMPLE_VALUE:String = "EXAMPLE_VALUE";

	private static inline var CUSTOMER_C2:String = "23004024";
	private static inline var PUBLISHER_SECRET:String = "f614d7b7e768166a01bbf96615782c92";

	public function new()
	{
		super();
		
		#if ios
			// this test just calls everything in the SDK.
			ComScore.setCustomerC2(EXAMPLE_VALUE);
			ComScore.setPublisherSecret(EXAMPLE_VALUE);
			ComScore.setAppContext();
			ComScore.onUxActive();
			ComScore.onUxInactive();
			ComScore.enableAutoUpdate();
		#elseif android
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		#end

	}

	private function addedToStage(event:Event):Void {
		trace("Setup comScore: "+CUSTOMER_C2+ "," +PUBLISHER_SECRET);
		ExtensionComScore.init(CUSTOMER_C2, PUBLISHER_SECRET);

		trace("comScore enableAutoUpdate: "+1+ "," +true);
		ExtensionComScore.enableAutoUpdate(1, true);

		stage.addEventListener(Event.DEACTIVATE, pause);
		stage.addEventListener(Event.ACTIVATE, resume);
	}

	private function pause(event:Event):Void {
		trace("App pause");
		ExtensionComScore.onExitForeground();
	}

	private function resume(event:Event):Void {
		trace("App resume");
		ExtensionComScore.onEnterForeground();
	}
}
