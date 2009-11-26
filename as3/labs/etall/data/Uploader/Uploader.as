package  labs.etall.data.Uploader
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.events.ProgressEvent;
	import flash.utils.ByteArray;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;
	import flash.events.ErrorEvent;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLVariables;
	import flash.events.MouseEvent;
	import fl.controls.Button;
	import flash.geom.Rectangle;
	
	//目前最快的jpgEncoder  as3_jpeg_wrapper.swc
	/**import cmodule.as3_jpeg_wrapper.CLibInit;*/
	/**
	 * sample for UploadPostHelper 
	 * 2009 (cc)01media by Etall
	 */
	public class Uploader
	{
		private static var bitmapData:BitmapData;
		private static var byteArray:ByteArray;
		private static var fileName:String;
		private static var parameters:Object;// = optional generic object containing name value pairs to accompany the post
		private static var urlRequest:URLRequest;
		private static var urlLoader:URLLoader;
		public static var uploadPath:String = "/app/sendmail.asp?action=saveorgimage";
		public static var filePath:String;
		public static var completeFunction:Function = null;
		/*
		private static var as3_jpeg_wrapper: Object;*/

		
		public static function saveToServer(target:*=null,quality:int=80):void {
			if(target is DisplayObject){
				bitmapData = new BitmapData(target.width, target.height, true, 0xFFFFFF);
				bitmapData.draw(target);
			}
			if (target is BitmapData) {
				bitmapData = target;
			}
			/*
			var loader:CLibInit = new CLibInit;
			as3_jpeg_wrapper = loader.init();
			var baSource: ByteArray = bitmapData.clone().getPixels( new Rectangle( 0, 0, bitmapData.width, bitmapData.height) );	
			var baAlchmey: ByteArray = as3_jpeg_wrapper.write_jpeg_file(baSource, bitmapData.width, bitmapData.height, 3, 2, quality);
			byteArray = baAlchmey;*/
			//trace("快速");
							
							
			byteArray = new JPEGEncoder(quality).encode(bitmapData);
			fileName = "tempName.jpg";
			
			urlRequest = new URLRequest();
			urlRequest.url = uploadPath;
			urlRequest.contentType = 'multipart/form-data; boundary=' + UploadPostHelper.getBoundary();
			urlRequest.method = URLRequestMethod.POST;
			urlRequest.data = UploadPostHelper.getPostData(fileName,byteArray,parameters);
			urlRequest.requestHeaders.push( new URLRequestHeader( 'Cache-Control', 'no-cache' ) );
			
			urlLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			urlLoader.addEventListener(Event.COMPLETE, onComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			urlLoader.addEventListener(ProgressEvent.PROGRESS, onProgerss);
			urlLoader.load(urlRequest);
		}
		
		private static function onProgerss(event:ProgressEvent):void {
			trace(event);
		}
		
		//handler for succesful loading of request
		private static function onComplete(eventObj:Event):void {
			var vars:URLVariables=new URLVariables(eventObj.target.data);
			//trace(vars.filename);
			
			//this.dispatchEvent(new Event(Event.COMPLETE));
			filePath = vars.filename;
			completeFunction!=null?completeFunction():null;
			
		}  
		private static function onError(eventObj:ErrorEvent):void { } //handler for faulty loading of request
	}

}

















