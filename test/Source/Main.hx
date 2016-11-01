package;

import openfl.display.Sprite;
import openfl.events.Event;

import org.openfl.extension.comscore.ComScore;

class Main extends Sprite
{
	private static inline var CUSTOMER_C2:String = "23004024";
	private static inline var PUBLISHER_SECRET:String = "f614d7b7e768166a01bbf96615782c92";

	public function new()
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);

	}

	private function addedToStage(event:Event):Void {
		
		trace("Setup comScore: "+CUSTOMER_C2+ "," +PUBLISHER_SECRET);
		ComScore.init(CUSTOMER_C2, PUBLISHER_SECRET);

		trace("comScore enableAutoUpdate: "+1+ "," +true);
		ComScore.enableAutoUpdate(1, true);
		
		stage.addEventListener(Event.DEACTIVATE, pause);
		stage.addEventListener(Event.ACTIVATE, resume);
	}

	private function pause(event:Event):Void {
		trace("App pause");
		ComScore.onExitForeground();
	}

	private function resume(event:Event):Void {
		trace("App resume");
		ComScore.onEnterForeground();
	}
}
