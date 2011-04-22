package labs.etall.movieclip
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	/**
	 * 2011-4-22 15:53
	 * @author Etall(etall@etall.cn)
	 */
	public class BitMapSprite extends Sprite 
	{
		private var baseBg:Sprite;
		
		private var bmclass:Class;
		private var _recHeight:int = -1;
		private var _recWidth:int = -1;
		
		public function BitMapSprite(str:String) 
		{
			bmclass = getDefinitionByName(str) as Class;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			baseBg = new Sprite();
			addChild(baseBg);
			Draw(baseBg.graphics);
			stage.addEventListener(Event.RESIZE, onResizeHandler);
		}
		
		private function Draw(graphics:Graphics):void 
		{
			graphics.clear();
			graphics.beginBitmapFill(new bmclass(0, 0));
			graphics.drawRect(0, 0, recWidth, recHeight);
			graphics.endFill();
		}
		
		private function onResizeHandler(e:Event):void 
		{
			Draw(baseBg.graphics);
		}
		
		public function get recWidth():int 
		{
			 if(_recWidth==-1){
				return stage.stageWidth;
			}else {
				return _recWidth;
			}
		}
		
		public function set recWidth(value:int):void 
		{
			_recWidth = value;
		}
		
		public function get recHeight():int 
		{
			if(_recHeight==-1){
				return stage.stageHeight;
			}else {
				return _recHeight;
			}
		}
		
		public function set recHeight(value:int):void 
		{
			_recHeight = value;
		}
		
	}

}