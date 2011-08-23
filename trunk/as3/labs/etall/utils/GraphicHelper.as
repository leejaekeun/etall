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
		/**
		 * 画一个类似遮罩的框 中间透明 用于截图
		 * @param	canvas
		 * @param	thickX
		 * @param	thickY
		 * @param   marginRight
		 * @param   marginBottom
		 * @param	n_color
		 * @param	n_alpha
		 * @param	$width
		 * @param	$height
		 * @param	startX
		 * @param	startY
		 */
		static public function  drawBorder (canvas:Graphics, thickX:Number = 1, thickY:int = 1 ,marginRight:int=10,marginBottom:int=0, n_color:uint = 0, n_alpha:Number = .5, $width:int = 520, $height:int = 725, startX:int = 0,startY:int=0 ):void {
			var _width:Number = $width;
			var _height:Number = $height;
			var innerWid:Number = _width - thickX-marginRight;
			var innerHei:Number = _height - thickY-marginBottom;
			trace (innerWid,innerHei);
			
			
			canvas.clear();
			canvas.beginFill (n_color, n_alpha);
			//左上
			canvas.moveTo (startX, startY)
			//右上
			canvas.lineTo (_width + startX, startY);
			
			canvas.lineTo (_width + startX, _height + startY);
			
			canvas.lineTo (startX, _height + startY);
			
			canvas.lineTo(startX, thickY+startY);
			
			canvas.lineTo(startX+thickX, thickY+startY);
			canvas.lineTo (startX + thickX, innerHei+startY+thickY);
			
			canvas.lineTo(startX + thickX+innerWid, innerHei+thickY+startY);
			canvas.lineTo (startX + thickX+innerWid, thickY + startY);
			
			canvas.lineTo(startX, thickY+startY);
			canvas.lineTo (startX, startY);
			
			//canvas.endFill ();
			//canvas.lineTo (500, 0);
			
			//填充中间部分
			canvas.beginFill (0xff0000,0);
			canvas.drawRect(thickX+startX, thickY+startY, innerWid, innerHei);
			canvas.endFill ();
		}
	}
	
}