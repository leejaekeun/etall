/**
 * SWFLibrary v1.5, Pixelwelders Framework
 * Copyright 2008 (c) Zack Jordan, Pixelwelders LLC
 * { P I X E L W E L D E R S . C O M }
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

/**
 * === I N S T R U C T I O N S ===
 * This class allows items from a Flash library to be used in an ActionScript-only project (e.g. a Flex ActionScript project).
 * 
 * 1 - In Flash, select "Export for ActionScript" in the symbol's Linkage settings in the Library (ex. 'Character').
 * 2 - Publish the Flash file as a SWF.
 * 3 - Load the SWF into an instance of SWFLibrary
 * 4 - Access the symbol through SWFLibrary, using the class name chosen in Step 1.
 * 
 * A SWFLibrary can be used with four lines of code.  Here's what you'll need: 
 * 
 * // === ===
 * // creates an instance of SWFLibrary, adds a listener, and loads a SWF
 * var gameAssets:SWFLibrary = new SWFLibrary
 * gameAssets.addEventListener( Event.COMPLETE, handleAssetsLoaded );
 * gameAssets.load( "myCustomGameAssets.swf" );
 * 
 * // accesses the asset (assumes there is a symbol exported as 'Character' in the loaded SWF, as seen in step 1 above)
 * var mySprite:Sprite = gameAssets.getSprite( "Character" );
 * addChild( mySprite );
 * 
 * // gets the asset as a MovieClip (assuming, of course, that it actually is a movieclip)
 * var myMC:MovieClip = gameAssets.getSprite( "Character" );
 * addChild( myMC );
 * 
 * // getting a sound
 * var mySound:Sound = gameAssets.getSound( "SoundLinkageNameHere" );
 * mySound.play();
 * // === ===
 * 
 * After a symbol has been retrieved from SWFLibrary, it may be treated just like any other object.
 * 
 */
package com.pixelwelders.util
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.net.URLRequest;

	public class SWFLibrary extends EventDispatcher
	{
		
		private var _libraryURL			: String;
		private var _loaded				: Boolean;
		private var _request			: URLRequest;
		private var _loader				: Loader;
		private var _loaderInfo			: LoaderInfo;
		
		/**
		 * constructor
		 * 
		 * @param						none
		 * @return						nothing
		 */
		public function SWFLibrary()
		{
			super();			
			
			_request = new URLRequest();
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, handleLoadComplete )
			
			_loaded = false;
		}
		
		// === A P I ===
		/**
		 * load a SWF into this 
		 * 
		 * @param		assetURL		the URL of a SWF file to load
		 * @return						nothing
		 */ 
		public function load( assetURL:String ): void
		{
			_loaded = false;
			_request.url = assetURL;
			_loader.load( _request );
			
			_libraryURL = assetURL;
		}
		
		/**
		 * get whether this is loaded or not
		 * 
		 * @param						none
		 * @return						nothing
		 */
		public function get loaded(): Boolean
		{
			return _loaded;
		}
		
		/**
		 * retrieves an instance of the specified Sprite
		 * 
		 * @param		className		name of the class that extends Sprite
		 * @return						an instance of that class, or null if not found
		 */ 
		public function getSprite( className:String ): Sprite
		{
			var Asset:Class = getAsset( className );
			
			if ( Asset ) return Sprite( new Asset() );
			return null;
		}
		
		/**
		 * retrieves an instance of the specified MovieClip
		 * 
		 * @param		className		name of the class that extends Sprite
		 * @return						an instance of that class, or null if not found
		 */
		 public function getMovieClip( className:String ): MovieClip
		 {
		 	var Asset:Class = getAsset( className );
		 	
		 	if ( Asset ) return MovieClip( new Asset() );
		 	return null;
		 }
		
		/**
		 * retrieves an instance of the specified Sound
		 * 
		 * @param		className		name of the class that extends Sound
		 * @return						an instance of that sound, or null if not found
		 */
		public function getSound( className:String ): Sound
		{
			var Asset:Class = getAsset( className );
			
			if ( Asset ) return Sound( new Asset() );
			return null;
		}
		
		// === P R I V A T E   M E T H O D S ===
		/**
		 * finds the requested class in the SWF and returns it uninstantiated as a Class object
		 *
		 * @param		className		the name of the requested class
		 * @return						the requested class as a Class object
		 */
		private function getAsset( className:String ): Class
		{
			try
			{
				var Asset:Class = _loaderInfo.applicationDomain.getDefinition( className ) as Class;
			} 
			catch ( error:ReferenceError )
			{
				trace( "Asset '" + className + "' not found in '" + _libraryURL + "'" );
				return null;
			}
			
			return Asset;
		}
		
		// === E V E N T   H A N D L E R S ===
		/**
		 * called when the SWF has been successfully loaded
		 * dispatches AssetEvent.LOADED when called
		 * 
		 * @param		event			an Event object from _loader.contentLoaderInfo
		 * @return						nothing
		 */
		private function handleLoadComplete( event:Event ): void
		{
			_loaded = true;
			_loaderInfo = _loader.contentLoaderInfo;
			
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
	}
}