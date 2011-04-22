/**
 * An extension of Mathieu Badimon's FIVe3D Drawing class.
 * This class draws an additional shape onto a FIVe3D Graphics3D instance.
 * This class includes code from by Ric Ewing.
 * 
 * @author 	Zack Jordan
 * 			{ P I X E L W E L D E R S }
 * 
 * modify by etall  
 */
package labs.etall.utils{
{
 
 
	import flash.display.Graphics;
 
	public class PXWDrawing 
	{
 
		/**
		 * Draws a wedge shape onto a Graphics3D instance.
		 * 
		 * @param 	graphics		a Graphics3D instance on which to draw
		 * @param 	x				x position of the center of this wedge
		 * @param	y				y position of the center of this wedge
		 * @param	startAngle		the angle of one straight line of this wedge
		 * @param	arc				the angle (in degrees) of the total arc of this wedge
		 * @param	xRadius			the external radius along the x axis
		 * @param	yRadius			the external radius along the y axis
		 * @param	innerXRadius	the internal radius along the x axis
		 * @param	innerYRadius	the internal radius along the y axis
		 * @param	color			the color of the wedge fill
		 * @param	fillAlpha		the alpha value of the wedge fill
		 * 
		 * @return					nothing
		 */
		static public function drawWedge( 
			graphics:Graphics, 
			x:Number, 
			y:Number, 
			startAngle:Number, 
			arc:Number, 
			xRadius:Number, 
			yRadius:Number, 
			innerXRadius:Number, 
			innerYRadius:Number, 
			color:uint = 0xFF0000, 
			fillAlpha:Number = .5 
		): void
		{
			var segAngle	: Number
			var theta		: Number
			var angle		: Number
			var angleMid	: Number
			var segs		: Number
			var bx		: Number
			var by		: Number
			var cx		: Number
			var cy		: Number;
 
			segs = Math.ceil( Math.abs( arc ) / 45 );
			segAngle = arc / segs;
			theta = ( segAngle / 180 ) * Math.PI;
			angle = ( startAngle / 180 ) * Math.PI;
 
			graphics.lineStyle( 1, 0xffffff, 0 );
			graphics.beginFill( color, fillAlpha );
			graphics.moveTo( 
				x + Math.cos( startAngle / 180 * Math.PI ) * innerXRadius,
				y - Math.sin( -startAngle/180 * Math.PI ) * innerYRadius 
			);
 
			// line 1
			graphics.lineTo( 
				x + Math.cos( startAngle / 180 * Math.PI ) * xRadius,
				y -Math.sin( -startAngle / 180 * Math.PI ) * yRadius 
			);
 
			// outer arc
			for ( var i:int = 0; i < segs; i++ ) {
				angle += theta;
				angleMid = angle - ( theta / 2 );
				bx = x + Math.cos( angle ) * xRadius;
				by = y + Math.sin( angle ) * yRadius;
				cx = x + Math.cos( angleMid ) * ( xRadius / Math.cos( theta / 2 ) );
				cy = y + Math.sin( angleMid ) * ( yRadius / Math.cos( theta / 2 ) );
				graphics.curveTo( cx, cy, bx, by );
			}
 
			// line 2
			graphics.lineTo( 
				x + Math.cos( ( startAngle + arc ) / 180 * Math.PI ) * innerXRadius, 
				y - Math.sin( -( startAngle + arc ) / 180 * Math.PI ) * innerYRadius 
			);
 
			theta = ( segAngle / 180 ) * Math.PI;
			angle = ( ( startAngle + arc ) / 180 ) * Math.PI;
 
			// inner arc
			for (var j:int = 0; j < segs; j++ ) {
				angle -= theta;
				angleMid = angle +( theta / 2 );
				bx = x + Math.cos( angle ) * innerXRadius;
				by = y + Math.sin( angle ) * innerYRadius;
				cx = x + Math.cos( angleMid ) * ( innerXRadius / Math.cos( theta / 2 ) );
				cy = y + Math.sin( angleMid ) * ( innerYRadius / Math.cos( theta / 2 ) );
				graphics.curveTo( cx, cy, bx, by );
			}			
			graphics.endFill();			
		}
	}		
}