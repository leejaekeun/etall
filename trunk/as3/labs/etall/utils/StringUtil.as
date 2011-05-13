package labs.etall.utils{
	
	import flash.utils.ByteArray;
	
	public class StringUtil{
				
		//忽略大小字母比较字符是否相等;
		public static function equalsIgnoreCase(char1:String,char2:String):Boolean{
			return char1.toLowerCase() == char2.toLowerCase();
		}
		
		//比较字符是否相等;
		public static function equals(char1:String,char2:String):Boolean{
			return char1 == char2;
		}
		
		//是否为Email地址;
		public static function isEmail(char:String):Boolean{
			if(char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		
		//是否是数值字符串;
		public static function isNumber(char:String):Boolean{
			if(char == null){
				return false;
			}
			return !isNaN(Number(char));
		}
		
		//是否为Double型数据;
		public static function isDouble(char:String):Boolean{
			char = trim(char);
			var pattern:RegExp = /^[-\+]?\d+(\.\d+)?$/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		//Integer;
		public static function isInteger(char:String):Boolean{
			if(char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /^[-\+]?\d+$/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		//English;
		public static function isEnglish(char:String):Boolean{
			if(char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /^[A-Za-z]+$/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		//中文;
		public static function isChinese(char:String):Boolean{
			if(char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /^[\u0391-\uFFE5]+$/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		//双字节
		public static function isDoubleChar(char:String):Boolean{
			if(char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /^[^\x00-\xff]+$/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		
		//含有中文字符
		public static function hasChineseChar(char:String):Boolean{
			if(char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /[^\x00-\xff]/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		//注册字符;
		public static function hasAccountChar(char:String,len:uint=15):Boolean{
			if(char == null){
				return false;
			}
			if(len < 10){
				len = 15;
			}
			char = trim(char);
			var pattern:RegExp = new RegExp("^[a-zA-Z0-9][a-zA-Z0-9_-]{0,"+len+"}$", ""); 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		//URL地址;
		public static function isURL(char:String):Boolean{
			if(char == null){
				return false;
			}
			char = trim(char).toLowerCase();
			var pattern:RegExp = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/; 
			var result:Object = pattern.exec(char);
            if(result == null) {
                return false;
            }
            return true;
		}
		
		// 是否为空白;		
		public static function isWhitespace(char:String):Boolean{
			switch (char){
	            case " ":
	            case "\t":
	            case "\r":
	            case "\n":
	            case "\f":
	                return true;	
				default:
	                return false;
	        }
		}
		
		//去左右空格;
		public static function trim(char:String):String{
			if(char == null){
				return null;
			}
			return rtrim(ltrim(char));
		}
		
		//去左空格; 
		public static function ltrim(char:String):String{
			if(char == null){
				return null;
			}
			var pattern:RegExp = /^\s*/; 
			return char.replace(pattern,"");
		}
		
		//去右空格;
		public static function rtrim(char:String):String{
			if(char == null){
				return null;
			}
			var pattern:RegExp = /\s*$/; 
			return char.replace(pattern,"");
		}
		
		//是否为前缀字符串;
		public static function beginsWith(char:String, prefix:String):Boolean{			
			return (prefix == char.substring(0, prefix.length));
		}
		
		//是否为后缀字符串;
		public static function endsWith(char:String, suffix:String):Boolean{
			return (suffix == char.substring(char.length - suffix.length));
		}
		
		//去除指定字符串;
		public static function remove(char:String,remove:String):String{
			return replace(char,remove,"");
		}
		
		//字符串替换;
		public static function replace(char:String, replace:String, replaceWith:String):String{			
			return char.split(replace).join(replaceWith);
		}
		
		//utf16转utf8编码;
		public static function utf16to8(char:String):String{
			var out:Array = new Array();
			var len:uint = char.length;
			for(var i:uint=0;i<len;i++){
				var c:int = char.charCodeAt(i);
				if(c >= 0x0001 && c <= 0x007F){
					out[i] = char.charAt(i);
				} else if (c > 0x07FF) {
					out[i] = String.fromCharCode(0xE0 | ((c >> 12) & 0x0F),
												 0x80 | ((c >>  6) & 0x3F),
												 0x80 | ((c >>  0) & 0x3F));
				} else {
					out[i] = String.fromCharCode(0xC0 | ((c >>  6) & 0x1F),
												 0x80 | ((c >>  0) & 0x3F));
				}
			}
			return out.join('');
		}
		
		//utf8转utf16编码;
		public static function utf8to16(char:String):String{
			var out:Array = new Array();
			var len:uint = char.length;
			var i:uint = 0;
			var char2:int,char3:int;
			while(i<len){
				var c:int = char.charCodeAt(i++);
				switch(c >> 4){
					case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
						// 0xxxxxxx
						out[out.length] = char.charAt(i-1);
						break;
					case 12: case 13:
						// 110x xxxx   10xx xxxx
						char2 = char.charCodeAt(i++);
						out[out.length] = String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
						break;
					case 14:
						// 1110 xxxx  10xx xxxx  10xx xxxx
						char2 = char.charCodeAt(i++);
						char3 = char.charCodeAt(i++);
						out[out.length] = String.fromCharCode(((c & 0x0F) << 12) |
							((char2 & 0x3F) << 6) | ((char3 & 0x3F) << 0));
						break;
				}
			}
			return out.join('');
		}
		
		//转换字符编码;
		public static function encodeCharset(char:String,charset:String):String{
			var bytes:ByteArray = new ByteArray();
			bytes.writeUTFBytes(char);
			bytes.position = 0;
			return bytes.readMultiByte(bytes.length,charset);
		}
		
		//添加新字符到指定位置;		
		public static function addAt(char:String, value:String, position:int):String {
			if (position > char.length) {
				position = char.length;
			}
			var firstPart:String = char.substring(0, position);
			var secondPart:String = char.substring(position, char.length);
			return (firstPart + value + secondPart);
		}
		
		//替换指定位置字符;
		public static function replaceAt(char:String, value:String, beginIndex:int, endIndex:int):String {
			beginIndex = Math.max(beginIndex, 0);			
			endIndex = Math.min(endIndex, char.length);
			var firstPart:String = char.substr(0, beginIndex);
			var secondPart:String = char.substr(endIndex, char.length);
			return (firstPart + value + secondPart);
		}
		
		//删除指定位置字符;
		public static function removeAt(char:String, beginIndex:int, endIndex:int):String {
			return StringUtil.replaceAt(char, "", beginIndex, endIndex);
		}
		
		//修复双换行符;
		public static function fixNewlines(char:String):String {
			return char.replace(/\r\n/gm, "\n");
		}
		
		
		//是否为手机号码;
		public static function isMobilePhoneNumber(char:String):Boolean {
			if (char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /^0?1(3\d|5\d|8\d)\d{8}$/;
			var result:Object = pattern.exec(char);
			if (result == null){
				return false;
			}
			return true;
		}

		//是否为身份证号码;
		public static function isIdCardNumber(char:String):Boolean {
			if (char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])(\d{4}|\d{3}[Xx])$/;
			var result:Object = pattern.exec(char);
			if (result == null){
				return false;
			}
			return true;
		}
		
		/*
		 * 国内邮政编码
		 */
		public static function isZIP(zip:String):Boolean {
			//原来邮编是可以以0打头的
			return (/^(?:\d{6}|[1-9]\d{4})$/).test(zip);
		}
		
		/*
		 * 验证 是否国内固话
		 */
		public static function isTel(tel:String):Boolean {
			var re:RegExp = /^(?:0{1,2}\d+[ \-]+)?0?\d{2,3}[ \-]+\d{7,9}(?:[^\d]+\d+)?$/;
			return re.test(tel);
		}
		
		//是否为QQ号码;
		public static function isQQNumber(char:String):Boolean {
			if (char == null){
				return false;
			}
			char = trim(char);
			var pattern:RegExp = /^[1-9]*[1-9][0-9]*$/;
			var result:Object = pattern.exec(char);
			if (result == null){
				return false;
			}
			return true;
		}
		
		//是否为IP地址;
		public static function isIPAddress(char:String):Boolean {
			if (char == null){
				return false;
			}
			char = trim(char).toLowerCase();
			var pattern:RegExp = /\d+\.\d+\.\d+\.\d+/;
			var result:Object = pattern.exec(char);
			if (result == null){
				return false;
			}
			return true;
		}
		
		//格式化数字; 
		public static function fomartNumber(a:Number,w:Number=3,s:String=","):String {
			var _a:String=String(a);
			var i:Number=_a.toString().length;
			var b:Array= new Array();
			var r:String="";
			if (i>=w) {
				for (var g:uint=1; g<i; g++) {
					b[i-g] = _a.substring(_a.length-w*g, _a.length-(g-1)*w);
				}
				for (var c:uint=b.length-Math.ceil(i/w); c<b.length; c++) {
					r=r+b[c]+s;
				}
				return (r.substr(0, r.length-1));
			} else {
				return (_a);
			}
		}
		
		//不满位的数字前面加0
		public static function fixNumber(num:Number, n:Number):String {
			var t:String=String(num);
			while (t.length<n) {
				t="0"+t;
			}
			if (t.length > n) {
				t = t.substring(0, n);
			}
			return (t);
		}
		
		//返回文件名 不包含点
		public static function fileName(url:String):String {
			return(url.split("\/")[url.split("\/").length - 1].split(".").shift());
		}
		//返回文件名后缀 不包含点
		public static function fileType(url:String):String {
			return(url.split("\/")[url.split("\/").length - 1].split(".").pop());
		}
		
		/**
		 *  替换数组中有序参数
		 *  var url:String="http://etall.cn/username={0}&themes={1}"
		 *  url=replaceParam(url,["etall",5]);
		 * // output:http://etall.cn/username=etall&themes=5
		 * @param	URI
		 * @param	arg
		 * @return
		 */
		public  static function replaceParam(URI:String, arg:Array = null):String {
			if(arg!=null){
				for(var i:String in arg){
					URI=URI.replace("{"+i+"}",arg[i]);		
				}
			}
			return(URI);
		}
		/**
		 * 替换标签参数
		 * 用法：
		 * 	 var url:String="http://etall.cn/username={username}"
		 *   url=ParametersReplace(url,{username:'etall'});
		 *   // output: http://etall.cn/username=etall
		 * @param	str
		 * @param	filter
		 * @return
		 */
		
		public static function ParametersReplace (str:String, filter:Object):String
		{
			for (var s:String in filter) {
				str=str.replace(new RegExp("(\{)"+s+"(\})","g"),filter[s]);
			}
			return str;
		}
		
		public static function reverse (str:String):String {
			var reverse:String = '';
			for (var i:int = str.length-1; i>=0; i--)
			{
				reverse = reverse + str.charAt(i);
			}
			return(reverse);
		}
		
	}
}