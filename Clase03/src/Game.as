package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utilFramework.inputs.UtilKeyboard;
	import utilFramework.inputs.UtilMouse;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Game extends Sprite
	{
		private var hero:Hero;
		private var dragon:Dragon;
		private var combo:Number = 1;
		
		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0xFFFFFF, 0);
			bg.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			bg.graphics.endFill();
			addChild(bg);			
			
			hero = new Hero();
			dragon = new Dragon();
			addChild(hero);
			addChild(dragon);			
			UtilKeyboard.init(stage);
			UtilMouse.init(stage);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			if (UtilMouse.clickedObj != null) {
				if (UtilMouse.clickedObj.parent is Hero) {
					combo++;
					trace("hero "+combo);
				} else {
					combo = 0;
					//trace("dragon");
				}
			}
			UtilMouse.clear();
			
			hero.update();
			dragon.update();
		}
	
	}

}