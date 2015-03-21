package utilFramework.loader 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	/**
	 * ...
	 * @author Alfredo Panitz
	 */
	public class UtilLoader 
	{
		private var loader:Loader;
		private var fncOnComplete:Function;
		
		public function UtilLoader(url:String, on_complete:Function) 
		{
			loader = new Loader();
			fncOnComplete = on_complete;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			var urlRequest:URLRequest = new URLRequest(url);
			loader.load(urlRequest);
		}
		
		private function onComplete(e:Event):void 
		{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			Global.assets = e.target.applicationDomain;
			trace("termina la carga");
			fncOnComplete();
		}
		
	}

}