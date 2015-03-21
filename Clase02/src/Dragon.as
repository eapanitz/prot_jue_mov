package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utilFramework.inputs.UtilKeyboard;
	import utilFramework.loader.UtilLoader;
	/**
	 * ...
	 * @author ...
	 */
	public class Dragon extends Sprite
	{
		
		private var skin:Sprite;
		private var speed:Number;
		
		public function Dragon() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			speed = 1;
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = UtilLoader.getAsset("mc_dragon");
			skin = new c();
			addChild(skin);			
		}
		
		public function move():void {
			if (UtilKeyboard.isRightKeyDown) {
				skin.x += speed;
			}
			if (UtilKeyboard.isLeftKeyDown) {
				skin.x -= speed;
			}
		}
		
	}

}