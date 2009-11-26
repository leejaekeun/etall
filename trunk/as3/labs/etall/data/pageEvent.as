/*
Page Class
VERSION: 0.1 alpha
DATE: 09/22/2009
ACTIONSCRIPT VERSION: 3.0 
(cc)2009 01media by Etall
*/
package  labs.etall.data {
	import flash.events.Event;
	public class pageEvent extends Event {
		//Event
		public static const PAGE_CHANGE:String = 'pageChanged';
		public var data:Object=[];
		public function pageEvent($type:String,$data:Object=null){																	   
			super($type);
			data = $data;
		}
	}
}