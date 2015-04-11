package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utilFramework.inputs.UtilKeyboard;
	import utilFramework.loader.UtilLoader;
	import utilFramework.objets.GameObject;
	/**
	 * ...
	 * @author ...
	 */
	public class Hero extends GameObject
	{
		private var rand:Number;
		//private var limitX:Number;
		//private var limitY:Number;
		
		public function Hero() 
		{
			rand = Math.random();
			speedX = 4;			
			assetClass = UtilLoader.getAsset("mc_knight");
			bounceType = "bounceX";
			moveType = "moveX";
			directionX = 1;
			directionY = -1;
		}
		
		override public function init():void {
			limitX = stage.stageWidth - width;
			limitY = stage.stageHeight - height;
			x = Math.random() * limitX;
			y = Math.random() * limitY;
		}
		/*
		override public function update():void {
			
			if (rand >= 0.5) {
				x += speedX;
			}else {
				x -= speedX;
			}
			
			/*
			if (x >= limitX) {
				x = limitX;
				speedX *= -1;
			}
			if (x < 0) {
				x = 0;
				speedX *= -1;
			}
			*/
			/*
			if (UtilKeyboard.isLeftKeyDown) {
				this.x -= velocity;
			}
			if (UtilKeyboard.isRightKeyDown) {
				this.x += velocity;
			}
			
		}*/
		
		
		
	}

}