package labs.etall.movieclip
{
	// Import Flash classes
	import flash.display.MovieClip;
	import flash.events.*;



	public class ButtonGroup extends MovieClip
	{
		private var logoia:Array;
		public var _current:int = -1;
		public var total:int = 3;
		public var staticFrame:int = 1;
		
		public function ButtonGroup():void
		{	
			init();
		}
		
		
		private function init() {
			total = numChildren;
			for (var i:uint = 0; i < total; i++ ) 
			{
				(getChildAt(i) as gotoTarget).addEventListener(MouseEvent.ROLL_OVER, onNavOver);
				(getChildAt(i) as gotoTarget).addEventListener(MouseEvent.ROLL_OUT, onNavOver);
				(getChildAt(i) as gotoTarget).addEventListener(MouseEvent.CLICK, onNavOver);
				(getChildAt(i) as gotoTarget).buttonMode = true;
			}
			showSelect();
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		
		private function onNavOver(event:Event):void {
			switch(event.type) {
				case MouseEvent.ROLL_OVER:
					show(event.currentTarget.name.substr( -1));
					break;
				case MouseEvent.CLICK:
					_current = event.currentTarget.name.substr( -1);
					trace(_current);
					showSelect();
					dispatchEvent(new Event(Event.CHANGE));
					break;
				case MouseEvent.ROLL_OUT:
					showSelect();
					break;
				default:
					break;
			}
		}
		private function show($i:int=0):void {
			resetAll();
			(getChildAt($i) as gotoTarget).goto((getChildAt($i) as gotoTarget).totalFrames);	
		}
		private function resetAll(event:Event=null):void {
			for (var i:uint = 0; i < total; i++ ) {
				(getChildAt(i) as gotoTarget).goto(staticFrame);
				(getChildAt(i) as gotoTarget).buttonMode = true;
			}
		}
		private function showSelect() {
			if(_current!=-1){
				show(_current);
			}
		}
		public function set current($i:int):void {
			if ($i != -1) {
				_current = $i;
				showSelect();
			}else {
				resetAll();
			}
		}
		public function get current():int {
			return(_current);
		}
	}
}

