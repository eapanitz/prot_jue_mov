package utilFramework.objets
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utilFramework.objets.GameObject;
	
	/** * ... * @author ISIL */
	
	public class GameObject extends Sprite
	{
		//Atributos de visualizacion
		protected var skin:Sprite;
		protected var assetClass:Class;
		//Atributos de movimiento
		protected var limitX:Number;
		protected var limitY:Number;
		protected var speedX:int;
		protected var speedY:int;				
		protected var directionX:int;
		protected var directionY:int;
		protected var bounceType:String; //none, bounceX, bounceY, bounceXY
		protected var moveType:String; //none, moveX, moveY, moveXY
		//Atributos de uso de teclado y mouse
		protected var hasKeyboardEnabled:Boolean;
		protected var keyboardFunction:Function;
		protected var hasMouseEnabled:Boolean;
		
		
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
			if (hasKeyboardEnabled) {
				if (keyboardFunction != null) {
					keyboardFunction();
				}
			}
			if (moveType == "none") {
				//do nothing
			} else {
				if (moveType == "moveX") {
					moveX();
				} else if (moveType == "moveY") {
					moveY();
				} else if (moveType == "moveXY") {
					moveX();
					moveY();
				}
			}
			//x += 1;
			/*
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
			*/
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
		
		private function moveX():void
		{
			x += speedX * directionX;
		}
		
		private function moveY():void
		{
			y += speedY * directionY;
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