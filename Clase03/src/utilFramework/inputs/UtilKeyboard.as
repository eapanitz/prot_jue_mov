package utilFramework.inputs 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author ...
	 */
	public class UtilKeyboard 
	{
		static private var stage:Stage;
		static public var isLeftKeyDown:Boolean;
		static public var isRightKeyDown:Boolean;
		static public var isUpKeyDown:Boolean;
		static public var isDownKeyDown:Boolean;	
		
		static public function init(p_stage:Stage):void {
			stage = p_stage;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}		
		
		static private function onKeyDown(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.UP:
					isUpKeyDown = true;
					break;
				case Keyboard.DOWN:
					isDownKeyDown = true;
					break;
				case Keyboard.LEFT:
					isLeftKeyDown = true;
					break;	
				case Keyboard.RIGHT:
					isRightKeyDown = true;
					break;	
			}
		}
		
		static private function onKeyUp(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.UP:
					isUpKeyDown = false;
					break;
				case Keyboard.DOWN:
					isDownKeyDown = false;
					break;
				case Keyboard.LEFT:
					isLeftKeyDown = false;
					break;	
				case Keyboard.RIGHT:
					isRightKeyDown = false;
					break;	
			}			
		}
		
		static public function destroy():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
	}

}