package labs.etall.utils 
{
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * 简单图形绘制
	 * @author Etall
	 */
	public class GraphicHelper 
	{
		/**
		 * 创建一个指定宽度高度背景色和透明度的矩形MC
		 * @param	_width
		 * @param	_height
		 * @param	_color
		 * @param	_alpha
		 * @return
		 */
		static public function creatBox(_width:Number=10, _height:Number=10, _color:int=0xff0000,_alpha:Number=0):MovieClip {
			var _Rect:MovieClip = new MovieClip();
			_Rect.graphics.beginFill(_color,_alpha);
			_Rect.graphics.drawRect(0, 0, _width,_height);
			_Rect.graphics.endFill();
			return(_Rect);
		}
		
		/**
		 * 返回一组圆上的点 常用于转盘奖品的布局控制
		 * 
		 * @param	sx              起点X
		 * @param	sy				起点Y
		 * @param	radius			半径
		 * @param	arc				每个点的间隔角度
		 * @param	startAngle		起始角度
		 * @return
		 */
		static public   function getCirclePoint(sx:Number, sy:Number, radius:Number, arc:Number, startAngle:Number = 0):Array {
			
			var ax:Number;
			var ay:Number;
			var bx:Number;
			var by:Number;
			var pointList:Array = [];
			var segAngle:Number;
			var angle:Number;
			var numOfSegs:Number = 360 / arc;
			segAngle = (arc / 180) * Math.PI;
			angle = (startAngle / 180) * Math.PI;

			// Calculate the start point
			ax = sx + Math.cos(angle) * radius;
			ay = sy + Math.sin (angle) * radius;
			
			for (var i:int=0; i<numOfSegs; i++) 
			{
				angle += segAngle;
				bx = sx + Math.cos(angle) * radius;
				by = sy + Math.sin (angle) * radius;
				pointList.push (new Point (bx, by));
			}
			return pointList;
		}
	}
	
}