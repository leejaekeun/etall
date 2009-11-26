package labs.etall.utils 
{
	import flash.display.Graphics;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Mr.Right
	 */
	public class GraphicHelper 
	{
		static public function creatBox(_width:Number=10, _height:Number=10, _color:int=0xff0000,_alpha:Number=0):MovieClip {
			var _Rect:MovieClip = new MovieClip();
			_Rect.graphics.beginFill(_color,_alpha);
			_Rect.graphics.drawRect(0, 0, _width,_height);
			_Rect.graphics.endFill();
			return(_Rect);
		}
	}
	
}