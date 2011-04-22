package labs.etall.movieclip 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import labs.etall.movieclip.MovieClipBtn;
	/**
	 * ...
	 * @author Etall
	 */
	public class ButtonGroupControl 
	{
		private var group:Array;
		private var _current:MovieClipBtn;
		public function ButtonGroupControl() 
		{
			
		}
		public function addButton(btn:MovieClipBtn):void {
			if (!group) group = new Array();
			group.push(btn);
		}
		
		public function init():void {
			for each(var i:MovieClipBtn in group) {
				i.addEventListener(MouseEvent.ROLL_OVER, onSelectHandler);
				i.addEventListener(MouseEvent.ROLL_OUT, onSelectHandler);
				i.addEventListener(MouseEvent.CLICK, onSelectHandler);
			}
		}
		
		private function onSelectHandler(event:MouseEvent):void {
			var btn:MovieClipBtn = event.currentTarget as MovieClipBtn;
			switch(event.type) {
				case MouseEvent.ROLL_OVER:
					Show(btn);
					break;
				case MouseEvent.CLICK:
					current = btn;
					Show(current);
					break;
				case MouseEvent.ROLL_OUT:
					Show(current);
					break;
				default:
					break;
			}
		}
		
		private function Show(btn:MovieClipBtn):void 
		{
			for each(var i:MovieClipBtn in group) {
				if (i == btn) {
					 i.goto(i.totalFrames);
				}else {
					i.goto(1);
				}
				
			}
		}
		
		public function set current(btn:MovieClipBtn):void {
			_current = btn;
		}
		
		public function get current():MovieClipBtn 
		{
			return _current;
		}
		
		
		public function Select(btn:MovieClipBtn):void {
			current = btn;
			current.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			Show(current);
		}
	}

}