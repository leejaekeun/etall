/*
gotoTarget Class
VERSION: 0.1 alpha
DATE: 11/23/2007
ACTIONSCRIPT VERSION: 3.0 
(cc)2007 01media by Etall
*/
package labs.etall.movieclip {
	import flash.display.SimpleButton;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class gotoTarget extends MovieClip {
		private var frame:int = 1;
		public function gotoTarget() {
			stop();
		}
		public function goto($i) {
			frame = $i;
			addEventListener (Event.ENTER_FRAME, gotoFrame);
		}
		
		private function  gotoFrame(event:Event) {
			if (this.currentFrame < frame)
			{
				nextFrame ();
				
			}else if(currentFrame>frame) {
				prevFrame();
			}
			else {
				removeEventListener(Event.ENTER_FRAME, gotoFrame);
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
	}
}
