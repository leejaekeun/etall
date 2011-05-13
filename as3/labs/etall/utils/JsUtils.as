package labs.etall.utils
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.external.ExternalInterface;
	import flash.system.Capabilities; 
	
	/**
	 * ...
	 * @author 5ive
	 */
	public class JsUtils
	{
		//-----------------------------
		//   ブラウザ情報の取得
		//-----------------------------
		public static function getBrowser():String
		{
			return ExternalInterface.call("function(){return navigator.userAgent}");
		}
		
		//-----------------------------
		//   アラートの表示
		//-----------------------------
		public static function alert(txt:String):void
		{
			ExternalInterface.call("function(){alert('"+txt+"');}");
		}
		
		//-----------------------------
		//   クッキーの書き込み
		//-----------------------------
		public static function setCookie(name:String, value:String, endDay:uint = 0):void
		{
			ExternalInterface.call("function(){d=new Date();d.setTime(d.getTime()+'"+endDay+"'*1000*60*60*24);d=d.toGMTString();document.cookie='"+name+"="+escape(value)+";expires='+d;}");
		}
		
		//-----------------------------
		//   クッキーの読み込み
		//-----------------------------
		public static function getCookie(name:String):String
		{
			return ExternalInterface.call("function(){c=document.cookie+';';s=c.indexOf('"+name+"');if(s!=-1){e=c.indexOf(';',s);v=unescape(c.substring(s+'"+(name.length+1)+"',e));}return v}");
		}
		
		//-----------------------------
		//   タイトルバーの変更
		//-----------------------------
		public static function setTitle(title:String):void
		{
			ExternalInterface.call("function(){document.title='"+title+"';}");
		}
		
		//-----------------------------
		//   タイトルバーの変更
		//-----------------------------
		public static function getTitle():String
		{
			return ExternalInterface.call("function(){return document.title;}");
		}
		
		//-----------------------------
		//   現在のURLを取得
		//-----------------------------
		public static function getLocation():String
		{
			return ExternalInterface.call("function(){return location.href;}");
		}
		
		//-----------------------------
		//   ウインドウの移動
		//-----------------------------
		public static function windowMove(x:uint, y:uint):void
		{
			ExternalInterface.call("function(){moveTo('"+x+"','"+y+"');}");
		}
		
		//-----------------------------
		//   ウインドウのリサイズ
		//-----------------------------
		public static function windowResize(width:uint, height:uint):void
		{
			ExternalInterface.call("function(){resizeTo('"+width+"','"+height+"');}");
		}
		
		//-----------------------------
		//   ウインドウのシェイク
		//-----------------------------
		public static function windowShake():void
		{
			var posX:Array = [10, 3, -6, 8, -10, -7, 5, -3, 2, -1, 1, 0];
			var posY:Array = [-12, 6, -3, 10, -9, -2, 8, 2, -2, 1, -1, 0];
			var count:uint = 0;
			var timer:Timer = new Timer(60);
			timer.addEventListener(TimerEvent.TIMER, onTicks);
			timer.start();
			
			function onTicks(e:TimerEvent):void
			{
				if (count > posX.length)
				{
					count = 0;
					timer.stop();
					timer.removeEventListener(TimerEvent.TIMER, onTicks);
					timer = null;
					posX = [];
					posY = [];
				}
				else
				{
					ExternalInterface.call("function(){moveBy('"+posX[count]+"','"+posY[count]+"');}");
				}
				count++;
			}
		}
		
		//-----------------------------
		//   ウインドウの表示
		//-----------------------------
		public static function windowOpen(url:String, w:uint, h:uint, x:uint=0, y:uint=0, center:Boolean=false, full:Boolean=false, scrl:String="no", loc:String="no", menu:String="no"):void
		{
			if(center == true)
			{
				x = (Capabilities.screenResolutionX - w) / 2;
				y = (Capabilities.screenResolutionY - h) / 2;
			}
			
			if(full == true)
			{
				x = 0;
				y = 0;
				w = Capabilities.screenResolutionX;
				h = Capabilities.screenResolutionY;
			}
			ExternalInterface.call("function(){window.open('"+url+"', 'sub','width="+w+",height="+h+",left="+x+",top="+y+",scrollbars="+scrl+",location="+loc+",menubar="+menu+"');}");
		}
		
		//-----------------------------
		//   リファラの取得
		//-----------------------------
		public static function getReferrer():String
		{
			return ExternalInterface.call("function(){return document.referrer;}");
		}		
	}
}