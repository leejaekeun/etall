/*
MoveClipBtn Class
VERSION: 0.1 alpha
DATE: 11/23/2007
ACTIONSCRIPT VERSION: 3.0 
(cc)2007 01media by Etall
*/
package labs.etall.movieclip{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class MovieClipBtn extends gotoTarget {
		public var staticframe:int = 1;
		public function MovieClipBtn() {
			buttonMode=true;
			addEventListener(MouseEvent.ROLL_OUT,BtnHandler);
			addEventListener(MouseEvent.ROLL_OVER,BtnHandler);
		}
		
		private  function BtnHandler(event:Event):void {
			switch(event.type){
				case MouseEvent.ROLL_OUT:
					goto(staticframe);
					break;
				case MouseEvent.ROLL_OVER:
					goto(this.totalFrames);
					break;
				
			}
		}
	}
}
