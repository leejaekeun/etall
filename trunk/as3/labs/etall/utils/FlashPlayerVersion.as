package  labs.etall.utils
{
	
	/**
	 * 
	 * platform 
	 * majorVersion 
	 * buildNumber  
	 * internalBuildNumber
	 * @author etall
	 */
	import flash.system.Capabilities;
	public class  FlashPlayerVersion
	{
		private var versionObject:Object;
		public function FlashPlayerVersion() {
			var pattern:RegExp=/^(?P<platform>(\w+)) (?P<majorVersion>(\d+)),(?P<minorVersion>(\d+)),(?P<buildNumber>(\d+)),(?P<internalBuildNumber>(\d+))$/i;
			versionObject = pattern.exec(Capabilities.version);
		}
		public function get platform():Number {
			return(versionObject.platform);
		}
		public function get majorVersion():Number {
			return(versionObject.majorVersion);
		}
		public function get minorVersion():Number {
			return(versionObject.minorVersion);
		}
		public function get buildNumber():Number {
			return(versionObject.buildNumber);
		}
		public function get internalBuildNumber():Number {
			return(versionObject.internalBuildNumber);
		}
		
	}
	
}