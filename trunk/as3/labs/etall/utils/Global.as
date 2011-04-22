package labs.etall.utils{
{
	import flash.events.EventDispatcher;
	dynamic public class Global extends EventDispatcher
	{
		private static var global:Global;
		
		public function Global(){super();}
		public static function getInstance():Global
		{
			if(global == null)
			{
				global = new Global();
			}
			return global;
		}
	}
}