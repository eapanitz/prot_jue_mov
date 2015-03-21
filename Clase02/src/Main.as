package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import utilFramework.loader.UtilLoader;
	
	/**
	 * ...
	 * @author Alfredo Panitz
	 */
	public class Main extends Sprite
	{
		
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
			//var game:Game1 = new Game1();
			//addChild(game);
			
			var loader:UtilLoader = new UtilLoader("assets.swf", startGame);
		}
		
		private function startGame():void
		{
			trace("start game");
			var knight:Class = Global.assets.getDefinition("mc_knight") as Class;
			var dragon:Class = Global.assets.getDefinition("mc_dragon") as Class;
			var mcKnight:MovieClip = new knight();
			var mcDragon:MovieClip = new dragon();
			mcKnight.x = 100;
			mcKnight.y = 50;
			addChild(mcKnight);
			mcDragon.x = 200;
			mcDragon.y = 250;
			addChild(mcDragon);
		}
	
	}

}