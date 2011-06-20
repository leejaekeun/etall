package labs.etall.utils{
	import flash.media.Camera;
	public class CameraHelper{
		static public function getDefaultCamera():Camera
		{	
			// check for usb in one of cameras, should be default	
			// otherwise find default and use it		
			if(flash.system.Capabilities.os.toLowerCase().indexOf("mac") != -1)	
			{		
				for(var n:String in Camera.names)		
				{			
					if(Camera.getCamera(n).name.toLowerCase().indexOf("usb") != -1)			
					{				
						return Camera.getCamera(n);			
					}					
				}			
			}
			
			return Camera.getCamera();
		}
		
	}
}