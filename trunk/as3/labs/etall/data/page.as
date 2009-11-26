/*
Page Class
VERSION: 0.1 alpha
DATE: 09/22/2009
ACTIONSCRIPT VERSION: 3.0 
(cc)2009 01media by Etall


@usage:

	example:
	var pg:page;
	var data:XML=new XML(<test><n></n></test>);
	pg=new page(data);
	
	pg.perPageNum=2;
	pg.init();
	
	trace(pg.currentPage,pg.totalPages);
	
	pg.addEventListener(pageEvent.PAGE_CHANGE,onPageChange);
	
	pg.gotoPage(1);
	pg.nextPage();
	pg.prevPage();
	
*/
package labs.etall.data {
	import flash.events.EventDispatcher;
	import flash.events.Event;
	public class page extends EventDispatcher {
		private var _data:XML; //xml data
		
		private var _perPageNum:int=10; //每页显示条数
		private var _total:int;//总条数
		
		private var _totalPage:int;//总页数
		private var _currentPage:int;//当前页 从0开始
		private var _defaultpage:int = 0;//默认起始页 从0开始
		
		public var nextEnabled:Boolean;//下一页可点?
		public var prevEnabled:Boolean;//上一页可点?
		
		private var returnData:Array;
		public function page($xml:XML):void {
			_data = $xml;
		}
		
		public function init() {
			prevEnabled = nextEnabled = false;
			_total = _data.children().length(); //所有条目 trace(_total);
			_totalPage = Math.ceil(_total / _perPageNum);
			showPage(_defaultpage);
		}
		
		
		//显示第几页
		public function showPage($i:int=0):Array {
			
			_currentPage = $i;
			
			returnData = new Array();
			
			for (var i:uint = _currentPage*_perPageNum; i < Math.min(_total, (_currentPage+1) * _perPageNum); i++ ) {
				returnData.push(_data.children()[i]);
				//trace(_data.children()[i]);
			}
			//trace(returnData);
			refreshButton();
			return returnData;
			
		}
		
		public function gotoPage($i:int=1) {
			showPage($i - 1);
		} 
		
		//刷新按钮状态
		private function refreshButton() {
			
			//当前页小于总页数  下一页按钮可用
			if (_currentPage < _totalPage-1) {
				nextEnabled= true;
			}else {
				nextEnabled= false;
			}
			//当前页大于总页数 上一页可用
			if (_currentPage > 0) {
				prevEnabled = true;
			}else {
				prevEnabled = false;
			}
			
			dispatchEvent(new pageEvent(pageEvent.PAGE_CHANGE, {n:nextEnabled,p:prevEnabled,pageData:returnData }));
			
		}
		//显示下一页
		public function nextPage() {
			if (_currentPage < _totalPage-1) {
				_currentPage++;
			}
			showPage(_currentPage);
		}
		//显示上一页
		public function prevPage() {
			if (_currentPage > 0) {
				_currentPage--;
			}
			showPage(_currentPage);
		}
		
		public function lastPage() {
			showPage(_totalPage-1);
		}
		
		public function firstPage() {
			showPage(0);
		}
		
		
		
		// SET
		
		//默认第几页
		public function set defaultpage($p:int):void {
			_defaultpage = $p-1;
		}
		//每页条数
		
		public function  set perPageNum($p:int):void {
			_perPageNum = $p;
		}
		//GET
		
		public function get totalPages():int {
			return _totalPage;
		}
		
		public function get currentPage():int {
			return _currentPage+1;
		}
		public function get perPageNum():int {
			return(_perPageNum);
		}
		
	}	
}
