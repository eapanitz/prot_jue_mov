package utilFramework.objets
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utilFramework.objets.GameObject;
	
	/** * ... * @author ISIL */
	
	public class GameObject extends Sprite
	{
		protected var skin:Sprite;
		protected var speedX:int;
		protected var speedY:int;
		protected var assetClass:Class;
		
		protected var bounceType:String;
		protected var limitX:Number;
		protected var limitY:Number;
		
		public function GameObject()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			create();
			init();
		}
		
		public function init():void
		{
		
		}
		
		public function create():void
		{
			skin = new assetClass();
			addChild(skin);
		}
		
		public function update():void
		{
			//x += 1;
			
			if (true)
			{
				x += speedX;
				y += speedY;
			}
			else
			{
				x -= speedX;
				y -= speedY;
			}
			
			if (bounceType == "none")
			{
				//do nothing
			}
			else if (bounceType == "bounceX")
			{
				bounceX();
			}
			else if (bounceType == "bounceY")
			{
				bounceY();
			}
			else if (bounceType == "bounceXY")
			{
				bounceX();
				bounceY();
			}
		}
		
		public function destroy():void
		{
			if (skin != null)
			{
				removeChild(skin);
			}
		}
		
		private function bounceX():void
		{
			if (x >= limitX)
			{
				x = limitX;
				speedX *= -1;
			}
			if (x < 0)
			{
				x = 0;
				speedX *= -1;
			}
		}
		
		private function bounceY():void
		{
			if (y >= limitY)
			{
				y = limitY;
				speedY *= -1;
			}
			if (y < 0)
			{
				y = 0;
				speedY *= -1;
			}
		}
	
	}
}