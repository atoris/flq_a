package src 
{
	import flash.display.Sprite;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Atoris
	 */
	
	public class TestSpeedFunction extends Sprite
	{
		private static var _start:Number;
		public function TestSpeedFunction() 
		{
			
		}
		public static function start():void 
		{
			_start = getTimer();
		}
		public static function stop():void{
			trace( getTimer() - _start);
		}
		
	}

}