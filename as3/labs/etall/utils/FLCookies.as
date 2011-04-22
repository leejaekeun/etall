package labs.etall.utils {
	import flash.net.SharedObject;

	public class FLCookies
	{
		public static function setCookie (key:String, val:*):void {
			var so:SharedObject;
			so = SharedObject.getLocal (key, "/");
			so.data[key]=val;
			so.flush();// writes changes to disk
			so.close();
		}
		public static function getCookie (key:String):* {
			
			var so:SharedObject;
			so=SharedObject.getLocal(key,"/");
			var val:Object=so.data[key];
			so.close ();
			so = null;
			return val;
		}
	}
}