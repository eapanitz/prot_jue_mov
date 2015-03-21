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
	public class Hero extends Sprite
	{
		
		private var skin:Sprite;
		private var speed:Number;
		
		public function Hero() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			speed = 1;
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = UtilLoader.getAsset("mc_knight");
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
			if (UtilKeyboard.isDownKeyDown) {
				alphabet("ABCDEFGHIJKLMNOPQRSTUVWXYZ123456","");
			}
		}
		
		private function alphabet(strAlphabet:String, strCharSplit:String):Array {			
			var arrAlphabet:Array = strAlphabet.split("");			
			var count:Number = 0;
			var arrCruceLetras:Array = new Array();
			while (count < arrAlphabet.length + 1) {
				for (var i:Number = 0; i < arrAlphabet.length; i++) {
					if (count == 0) {						
						arrCruceLetras.push(arrAlphabet[i]);
						trace(arrAlphabet[i]);
					} else {
						arrCruceLetras.push(arrAlphabet[count - 1] + arrAlphabet[i]);
						trace(arrAlphabet[count - 1] + arrAlphabet[i]);
					}				
				}
				count++; 
			}
			return arrCruceLetras;
		}
		
	}

}