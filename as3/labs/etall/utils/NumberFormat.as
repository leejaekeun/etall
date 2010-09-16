package labs.etall.utils {  
	/**
	 * 阿拉伯数字转简体中文 支持到万位
	 * @author Etall
	 */
	public class NumberFormat
	{
		private static const  Unit:Array = ["", "十", "百", "千", "万"];
		private static const  CN:Array = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十"];
		public function NumberFormat() 
		{
			
		}
		public static function toChinese (num:Number):String {
			var stringNum:String = num.toString ();
			var posNum:Array=new Array();
			for (var i:int = 0; i < stringNum.length; i++ ) {
				posNum.push (formatNumber(Number(stringNum.substring (i, i + 1)),Number(stringNum.length-i),Number(stringNum.length)));
			}
			var retunValue:String="";
			var j:int = 0;
			while (j<posNum.length) {
				retunValue += posNum[j];
				j++;
			}
			if(retunValue.length>1){
				while (retunValue.substr ( -1) == CN[0]) { 
					retunValue = retunValue.substring (0, retunValue.length - 1);
				}
			}
			
			retunValue = retunValue.replace(/零零+/g,"零");
			return (retunValue);
		}
		
		private static function formatNumber (num:Number, len:Number,total:Number):String {
			/**
			 * 值为1 且 总位数的长度等于 值所在位数 直接返回位
			 * 如10  直接返回十
			 */
			if (num==1&&total.toString().length==len-1) {
				return (Unit[len - 1]);
			}	
			
			
			if (num == 0 ) {
				return (CN[num]);
			}
			
			
			return (CN[num] + Unit[len-1]);
		}
		
	}

}