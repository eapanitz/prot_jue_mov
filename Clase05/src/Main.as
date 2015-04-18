package
{
	import starling.core.Starling;
	import starling.events.Event;
	import flash.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author Alfredo
	 */
	[SWF(width="640", height="960", frameRate="60", backgroundColo="#FFFFFF")]
	public class Main extends Sprite
	{
		private var starling:Starling;
		
		public function Main()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Starling.handleLostContext = true;
			starling = new Starling(ManageView, stage);
			starling.start();
			starling.addEventListener(Event.ROOT_CREATED, onCreated);
			
			/*
			var viewportWidth:int = Starling.current.viewPort.width;
			var viewportHeight:int = Starling.current.viewPort.height;
			trace("dimensiones dispositivo: "+viewportWidth + "x" + viewportHeight);
			*/			
		}
		
		private function onCreated(e:Event):void
		{
			Global.assetManager = new AssetManager();
			Global.assetManager.enqueue("assets/background.png");
			Global.assetManager.enqueue("assets/start_button.png");
			Global.assetManager.enqueue("assets/stop_button.png");
			Global.assetManager.enqueue("assets/palitos.png");
			Global.assetManager.enqueue("assets/palitos.xml");
			Global.assetManager.loadQueue(loadGame);
		}
		
		private function loadGame(ratio:Number):void
		{
			if (ratio == 1)
			{
				var game:ManageView = starling.root as ManageView;
				game.start();
			}
		}
	
	}

}