package utilFramework.inputs
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Alfredo
	 */
	public class UtilMouse
	{
		static public var clickedObj:Sprite;
		
		static public function init(stage:Stage, config:Dictionary = null):void
		{
			clickedObj = new Sprite();
			stage.addEventListener(MouseEvent.CLICK, onClick);
			if (config != null)
			{
				if (config['isMouseDownEnabled'])
				{
					stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
					stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				}				
			}		
		}
		
		static public function clear():void {
			clickedObj = null;
		}
		
		static private function onClick(e:MouseEvent):void 
		{
			clickedObj = e.target as Sprite;
			trace(clickedObj.parent);
		}		
		
		static private function onMouseDown(e:MouseEvent):void 
		{
			
		}		
		
		static private function onMouseUp(e:MouseEvent):void 
		{
			
		}		
	
	}

}