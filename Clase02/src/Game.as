package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utilFramework.inputs.UtilKeyboard;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Game extends Sprite
	{
		private var hero:Hero;
		private var dragon:Dragon;
		
		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			hero = new Hero();
			dragon = new Dragon();
			addChild(hero);
			addChild(dragon);
			dragon.x = stage.stageWidth - dragon.width;
			UtilKeyboard.init(stage);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			hero.move();
			dragon.move();
		}
		

	
	}

}