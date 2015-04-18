package views 
{
	import gameObjects.Hero;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import xxx.input.XXXMouse;
	
	/**
	 * ...
	 * @author Alfredo
	 */
	public class Game extends Sprite 
	{
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
		
		private function onRemoved(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			
		}
		
		private function onAdded(e:Event):void 
		{		
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			XXXMouse.init();
			
			var bg:Image = new Image(Global.assetManager.getTexture("background"));
			addChild(bg);
			var hero:Hero = new Hero();
			addChild(hero);
		}
		
	}

}