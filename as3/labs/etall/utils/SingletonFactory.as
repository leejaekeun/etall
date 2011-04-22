
package labs.etall.utils 
{
	import flash.utils.Dictionary;
	
	/**
	 * Used to create a singleton from a class without adapting the 
	 * class itself. This function returns the same instance of the
	 * class every time it is called. This function only works with
	 * classes that don't require parameters in the constructor.
	 * 
	 * @param type The class you want a singleton from
	 * 
	 * @return the singleton instance of the class
	 */
	public class SingletonFactory {
		public static var instances:Dictionary = new Dictionary( false );
		public static  function getSingleton( type:Class ):*
		{
			return type in instances ? instances[type] : instances[type] = new type();
		}
	}
}


