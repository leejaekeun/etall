package labs.etall.utils{
{
	/**
	 * 使用位图作为背景  项目：美特斯邦威女装产品中用 待修改为通用
	 * @author Etall
	 */
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;

	public class BgHelper 
	{
		public function BgHelper()
		{
		}
		
		static  public function getBackGround(bitmapClass:String):BitmapData
		{
			var myclass:Class = getDefinitionByName(bitmapClass) as Class;
			
			var tempMC:Sprite=new Sprite();
			tempMC.addChild(new Bitmap(new myclass()));
			var b:Bitmap = new Bitmap(upanddown(new myclass()));
			tempMC.addChild(b);
			b.x = 317;
			var t:BitmapData = new BitmapData(tempMC.width,tempMC.height);
			t.draw(tempMC);

			var tbm:Bitmap = new Bitmap(upanddown(t));
			tbm.y = tempMC.height;
			tempMC.addChild(tbm);
			var bmd:BitmapData = new BitmapData(317 * 2,393 * 2);
			bmd.draw(tempMC);
			return bmd;
		}
		
		static private function upanddown(bt:BitmapData):BitmapData
		{
			var bmd:BitmapData = new BitmapData(bt.width,bt.height,true,0x00000000);
			for (var xx=0; xx<bt.width; xx++)
			{
				for (var yy=0; yy<bt.height; yy++)
				{
					bmd.setPixel32(xx, bt.height-yy-1, bt.getPixel32(xx,yy));
				}
			}
			return bmd;
		}
		
		static private function rightandleft(bt:BitmapData):BitmapData
		{
			var bmd:BitmapData = new BitmapData(bt.width,bt.height,true,0x00000000);
			for (var yy=0; yy<bt.height; yy++)
			{
				for (var xx=0; xx<bt.width; xx++)
				{
					bmd.setPixel32(bt.width-xx-1, yy, bt.getPixel32(xx,yy));
				}
			}
			return bmd;
		}
		
	}

}