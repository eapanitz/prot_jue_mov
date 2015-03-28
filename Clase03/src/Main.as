package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utilFramework.loader.UtilLoader;
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends Sprite
	{
		
		private var skin:Sprite;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			UtilLoader.load("assets.swf", startGame);
			
		}
		
		private function startGame():void 
		{
			var juego:Game = new Game();
			addChild(juego);
		}
		
	}

}