package events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Alfredo
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = "changeView";
		public var view:Class;
		public function NavigationEvent(type:String, pView:Class, bubbles:Boolean=true, data:Object=null) 
		{
			view = pView;
			super(type, bubbles, data);			
		}
		
	}

}