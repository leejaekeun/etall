package labs.etall.net {
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.external.ExternalInterface;
	public class  Common {
		//getURL
		public static function getURL(url:String,window:String="_self"):void {
			var broswer:String=ExternalInterface.call("function getBrowser(){return navigator.userAgent}") as String;
			if (broswer.indexOf("Firefox")!=-1||broswer.indexOf("MSIE 7.0")!=-1) {
				ExternalInterface.call('window.open("'+url+'","'+window+'")');
			} else {
				navigateToURL(new URLRequest(url),window);
			}
		}
	}
}