package utilFramework.loader
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	
	/**
	 * ...
	 * @author Alfredo Panitz
	 */
	public class UtilLoader
	{
		static private var loader:Loader;
		static private var fncOnComplete:Function;
		
		static public function load(url:String, on_complete:Function = null):void
		{
			loader = new Loader();
			fncOnComplete = on_complete;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			var urlRequest:URLRequest = new URLRequest(url);
			loader.load(urlRequest);
		}
		
		static private function onError(e:IOErrorEvent):void 
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			trace("hubo un error al cargar el asset");
		}
		
		static private function onComplete(e:Event):void
		{
			loader.removeEventListener(Event.COMPLETE, onComplete);			
			if (fncOnComplete != null)
			{
				fncOnComplete();
			}
		}
		
		static public function getAsset(name:String):Class {
			var clip:Class = loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
			return clip;
		}
	}

}