package 
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Alfredo
	 */
	public class ManageView extends Sprite 
	{
		private var mc:MovieClip;
		
		public function ManageView() 
		{
			super();
			addEventListener(Event.ADDED, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED, added);
		}
		
		public function start():void
		{
			var bg:Image = new Image(Global.assetsManager.getTexture("background"));
			addChild(bg);
			mc = new MovieClip(Global.assetsManager.getTextureAtlas("palitos").getTextures("mc_Player00"), 12);			
			addChild(mc);
			mc.y = 400;
			Starling.juggler.add(mc);
			var enemy:Image = new Image(Global.assetsManager.getTextureAtlas("palitos").getTexture("mc_Enemy0000"));
			addChild(enemy);
			var cannon:Image = new Image(Global.assetsManager.getTextureAtlas("palitos").getTexture("cañon0000"));
			addChild(cannon);			
			cannon.y = 300;
			cannon.x = stage.stageWidth;
			//cannon.x = stage.stageWidth - cannon.width;
			cannon.scaleX = -1;
			
			stage.addEventListener(EnterFrameEvent.ENTER_FRAME, loop);
		}
		
		private function loop(e:EnterFrameEvent):void 
		{
			mc.x += 1;
		}
		
	}

}