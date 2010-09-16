package labs.etall.utils{
	/**
	 * 
	 * @author  etall
	 *
	 */
	import flash.utils.ByteArray;
	
	public class NumberUtil{
		
		/**
		 * 返回某个数的整数倍的数（或者叫做去余）
		 * @param	num          原始数
		 * @param	intNumber    基数(被除数)
		 * @return  Number       去余后的数
		 */
		public static function CeilInt(num:Number,intNumber:Number):Number{
			return num - num % intNumber;
		}
		
	}
}