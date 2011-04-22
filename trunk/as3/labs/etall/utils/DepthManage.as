package  labs.etall.utils
{
	import flash.geom.Point;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Mr.Right
	 */
	public class DepthManage
	{
		public static var cItems:Array = new Array();
		public static var _container:MovieClip;
		public static function init(s:MovieClip) {
			_container = s;
		}
		public static function addObject(p:MovieClip):void {
			cItems.push(p);
		}
		/**
		 * 深度排序
		 * 按y排序后再按x排序
		 */
		public static function arrange():void  
		{  
			cItems.sortOn(["y","x"], Array.NUMERIC);  
			var i:int =cItems.length;  
			while(i--){ 
				if (_container.getChildAt(i) != cItems[i]) {  
					_container.setChildIndex(cItems[i], i);  
				}  
			}  
		 }
		
	}
	
}