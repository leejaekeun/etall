
package labs.etall.error  {
	import ArgumentError;
	
	/**
		@author etall
		@version 2011-4-22 15:40
	*/
	public class ArguementTypeError extends ArgumentError {
		
		
		/**
			Creates a new ArguementTypeError.
			
			@param paramName: The name of the parameter with the incorrect type.
		*/
		public function ArguementTypeError(paramName:String = null) {
			super((paramName == null) ? 'You passed an argument with an incorrect type to this method.' : 'The argument type you passed for parameter "' + paramName + '" is not allowed by this method.');
		}
	}
}