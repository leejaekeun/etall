/*
 * Copyright 2009 (c) Etall, http://etall.cn.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

 package labs.etall.data {
	import flash.display.Sprite;
	import flash.text.TextField;
	public class BindingUtil{		
		
		//通用绑定数据 待整理
		public static  function BindingText ($data:Object, $obj:Sprite) {
			var obj:*;
			if($data is Object){
				for (var i:String in $data) {
					//trace(i);
					obj= $obj.getChildByName(i);
					if (obj != null) {
						if(obj is TextField)obj.htmlText = $data[i];
						obj.mouseEnabled = false;
					}
				}
			}
			if ($data is XML) {
				for each(var item:XML in $data.children()) {
					obj = $obj.getChildByName(item.name());
					if (obj != null) {
						if (obj is TextField)obj.htmlText = item;
						obj.mouseEnabled = false;
					}
				}
			}
		}
	}
}