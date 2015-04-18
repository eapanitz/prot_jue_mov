package 
{
	import events.NavigationEvent;
	import starling.display.Sprite;
	import starling.events.Event;
	import views.Menu;
	/**
	 * ...
	 * @author Alfredo
	 */
	public class ManageView extends Sprite
	{
		private var current:Sprite;
		
		public function ManageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function start():void 
		{
			current = new Menu();
			addChild(current);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
			
		}
		
		private function onChangeView(e:NavigationEvent):void 
		{
			//trace(e.view);
			removeChild(current);
			var c:Class = e.view;
			current = new c();
			addChild(current);
		}
		
	}

}