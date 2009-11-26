package  labs.etall.text
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Mr.Right
	 */
	public class DyText extends  MovieClip
	{	
		private var txt:String="TEST TEST";
		private var dir:Number=0;
		private var myhscroll:Number = 0;
		private var tf:TextField;
		private var format:TextFormat;
		private var speed:Number = .5;
		public function DyText(x:Number, y:Number, width:Number, height:Number)
		{	
			format = new TextFormat();
            format.font = "Verdana";
            //format.color = 0xFF0000;
            format.size = 12;
			format.align = TextFormatAlign.CENTER;
			//format.bold = true;
			
			tf=createCustomTextField(x, y, width, height);
			tf.addEventListener(MouseEvent.MOUSE_OVER,ionMouseOver);
			tf.addEventListener(MouseEvent.MOUSE_OUT, ionMouseOut);	
			
		}
		
		public function set Color($color:Number):void {
			format.color = $color;
			tf.defaultTextFormat = format;
		}
		
		public function set align($a:String):void {
			format.align = TextFormatAlign[$a];
			
			tf.defaultTextFormat = format;
		}
		
		public function set Value($text:String):void {
			tf.text = $text;
		}
		
		public function set HtmlText(p_str:String):void {
			tf.htmlText = p_str;
		}
		
		private function createCustomTextField(x:Number, y:Number, width:Number, height:Number):TextField {
            var result:TextField = new TextField();
			
            result.x = x; result.y = y;
            result.width = width; result.height = height;
            result.selectable = false;
			result.defaultTextFormat = format;
			addChild(result);
            return result;
        }

		
		function ionMouseOver(event:MouseEvent):void {
			//trace("over")
			if (event.target.maxScrollH>0) {
				//trace("outer")
				event.target.addEventListener(Event.ENTER_FRAME,iautoPlay);
			}
		}
		function ionMouseOut(event:MouseEvent):void {
			event.target.removeEventListener(Event.ENTER_FRAME,iautoPlay);
			event.target.scrollH=0;
		}
		function iautoPlay(event:Event):void {
			if (dir==0) {
				dir=speed;
				myhscroll=0;
			}// end if
			myhscroll=myhscroll+dir;
			if (myhscroll>tf.maxScrollH) {
				dir=-1;
			} else if (myhscroll < 0) {
				dir=1;
			}// end else if
			event.target.scrollH=myhscroll;
		}
	}
	
}