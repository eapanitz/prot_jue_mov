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
	public class Dragon extends GameObject
	{
		private var rand:Number;
		//private var limitX:Number;
		//private var limitY:Number;		
		
		public function Dragon() 
		{
			rand = Math.random();
			speedX = 4;
			speedY = 5;
			assetClass = UtilLoader.getAsset("mc_dragon");
			bounceType = "bounceXY";
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
				y += speedY;
			}else {
				x -= speedX;
				y += speedY;
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
			
			if (y >= limitY) {
				y = limitY;
				speedY *= -1;
			}
			if (y < 0) {
				y = 0;
				speedY *= -1;
			}
			
		}*/
		
	}

}