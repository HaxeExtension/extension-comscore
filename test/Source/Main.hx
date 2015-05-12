package;

import openfl.display.Sprite;
import extension.comscore;

class Main extends Sprite
{
	private static inline var EXAMPLE_VALUE:String = "EXAMPLE_VALUE";

	public function new()
	{
		super();
		
		// this test just calls everything in the SDK.
		ComScore.setCustomerC2(EXAMPLE_VALUE);
		ComScore.setPublisherSecret(EXAMPLE_VALUE);
		ComScore.setAppContext();
		ComScore.onUxActive();
		ComScore.onUxInactive();
		ComScore.enableAutoUpdate();
	}
}
