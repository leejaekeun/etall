package labs.etall.utils 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	/**
	 * ...
	 * @author Etall
	 */
	public class Config
	{
		public static var xmlURL:String = "config.xml";
		public static var _stage:Stage;
		public static function setup( target:Sprite )
		{
			// CONFIG STAGE
			_stage = target.stage;
			_stage.align = StageAlign.TOP_LEFT;
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			xmlURL = hasKey ("xmlURL")?getValue ("xmlURL"):xmlURL;
		}
		
		public static function getValue(key:String):String {
			return _stage.loaderInfo.parameters[key];
		}
		
		public static function hasKey(key:String):Boolean {
			return Config.getValue(key)? true : false;
		}
	}

}