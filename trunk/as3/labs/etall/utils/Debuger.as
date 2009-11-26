package labs.etall.utils {
	import flash.display.*;
	import flash.events.*;
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.ui.*;
	import flash.utils.getTimer;	

	/**
	 * @author Mr.Right
	 */
	public class Debuger {
		private static var displayed : Boolean = false;
		private static var inited : Boolean = false;
		private static var stage : Stage;
		private static var content : DebugerContent;
		private static var ci : ContextMenuItem;
		private static var enabled:Boolean=false;

		public static function init(swf : Stage, context : InteractiveObject) : void {
			if(inited) return;
			
			inited = true;
			stage = swf;
			
			content = new DebugerContent();
			
			var cm : ContextMenu = new ContextMenu();
			cm.hideBuiltInItems();
			ci = new ContextMenuItem("Show Debuger", true);
			addEvent(ci, ContextMenuEvent.MENU_ITEM_SELECT, onSelect);
			cm.customItems = [ci];
			context.contextMenu = cm;
			
		}

		public static function trace($str:String):void {
			if(enabled){
				content.trace($str);
			}
		}

		public static function gc() : void {
			try {
				new LocalConnection().connect('foo');
				new LocalConnection().connect('foo');
			} catch (e : Error) {
			}
		}

		
		
		private static function onSelect(e : ContextMenuEvent) : void {
			if(!displayed) {
				show();
			} else {
				hide();
			}
		}

		private static function show() : void {
			ci.caption = "Hide Debuger";
			displayed = true;
			stage.addChild(content);
		}

		private static function hide() : void {
			ci.caption = "Show Debuger";
			displayed = false;
			stage.removeChild(content);
		}
		

		
		private static function addEvent(item : EventDispatcher, type : String, listener : Function) : void {
			item.addEventListener(type, listener, false, 0, true);
		}
		private static function removeEvent(item : EventDispatcher, type : String, listener : Function) : void {
			item.removeEventListener(type, listener);
		}
	}
}

import flash.display.*;
import flash.events.Event;
import flash.text.*;

internal class DebugerContent extends Sprite {


	private var infoTxtBx : TextField;
	private var box : Shape;


	public function DebugerContent() : void {
		box = new Shape();
			
		this.mouseChildren = true;
		this.mouseEnabled = false;
			
			
		infoTxtBx = new TextField();
		infoTxtBx.selectable = false;
		infoTxtBx.defaultTextFormat = new TextFormat("_sans", 12, 0xCCCCCC);
		infoTxtBx.multiline = true;
		
		
		addChild(box);
		addChild(infoTxtBx);
		
	
		
		this.addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);
		this.addEventListener(Event.REMOVED_FROM_STAGE, removed, false, 0, true);
	}

	public function trace(str : String) : void {
		infoTxtBx.htmlText+=str + "\n";
		autoScroll();
	}

	private function added(e : Event) : void {
		resize();
		stage.addEventListener(Event.RESIZE, resize, false, 0, true);
	}

	private function removed(e : Event) : void {
		stage.removeEventListener(Event.RESIZE, resize);
	}

	private function resize(e : Event = null) : void {
		infoTxtBx.width = stage.stageWidth/3, stage;
		infoTxtBx.height = stage.stageHeight;
		var vec : Graphics = box.graphics;
		vec.clear();
		
		vec.beginFill(0x000000, 0.5);
		vec.drawRect(0, 0, stage.stageWidth/3, stage.stageHeight);
		vec.lineStyle(1, 0xFFFFFF, 0.2);
			
		vec.endFill();
	}
	
	private function autoScroll() {
		if (infoTxtBx.maxScrollV > 0) {
			infoTxtBx.scrollV++;
		}
	}
}