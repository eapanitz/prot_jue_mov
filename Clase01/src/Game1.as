package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.setTimeout;
	import flash.utils.Timer;	
	
	/**
	 * ...
	 * @author Alfredo Panitz
	 */
	public class Game1 extends Sprite
	{
		
		private var circle:Sprite;
		private var timer:Timer;
		
		public function Game1()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			circle = new Sprite();
			circle.graphics.beginFill(0xAABBCC);
			circle.graphics.drawCircle(0, 0, 100);
			circle.graphics.endFill();
			circle.x = 100;
			circle.y = 100;
			addChild(circle);
			circle.buttonMode = true;
			circle.addEventListener(MouseEvent.CLICK, clickCircle);
			//setTimeout(drawrectangle, 1000);
			
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, drawrectangle);
			timer.start();
		}
		
		private function drawrectangle(e:TimerEvent):void
		{
			var rectangle:Sprite = new Sprite();
			rectangle.graphics.beginFill(0x112233 * Math.random());
			rectangle.graphics.drawRect(0, 0, 250, 150);
			rectangle.graphics.endFill();
			var limX:Number = stage.stageWidth - rectangle.width;
			var limY:Number = stage.stageHeight- rectangle.height;
			rectangle.x = Math.random() * limX;
			rectangle.y = Math.random() * limY;
			addChild(rectangle);
			rectangle.addEventListener(MouseEvent.CLICK, clickRectangle);
		}
		
		private function clickRectangle(e:MouseEvent):void
		{
			var mc:Sprite = e.currentTarget as Sprite;
			removeChild(mc);
		}
		
		private function clickCircle(e:MouseEvent):void
		{
			if (timer.running) {
				timer.stop();
			}else {
				timer.start();
			}
		}
	
	}

}