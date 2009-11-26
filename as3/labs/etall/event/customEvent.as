package labs.etall.event {
	import flash.events.Event;
	 public class customEvent extends Event {
		 public static const REMARK:String = "remark";
		 public static const POSITIONEVENT:String = "positionEvent";
		 public static const EFFECTEVENT:String = "effectEvent";
		 public static const POSITION:String = "ballPosition";
		 public static const TIMECHANGE:String = "timeChange";
		 public static const LOG_ADD:String = "addLog";
		 public static const LOG_SELECT:String = "logSelect";
		 public var data:Object;
		 
		 public function customEvent($type:String,$data:Object=null){																	   
			super($type);
			data = $data;
		}
	}
 }
 