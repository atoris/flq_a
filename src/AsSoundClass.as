package src 
{
	import com.greensock.core.SimpleTimeline;
	import flash.display.SimpleButton;
	/**
	 * ...
	 * @author Atoris
	 */
	public class AsSoundClass 
	{
		private static var _bSound:Boolean=true;
		public function AsSoundClass() 
		{
			
		}
		
		
		public static function init():void{
			
			_bSound= (SaveInfo.load(SaveInfo.SOUND)=="true")?true:false;
		}
		public static function setResult(btn1:SimpleButton, btn2:SimpleButton):void{
			btn1.visible = !btn1.visible;
			btn2.visible = !btn2.visible;
			_bSound = !_bSound;
			
			SaveInfo.save(SaveInfo.SOUND, _bSound);
		}
		static public function get bSound():Boolean 
		{
			return _bSound;
		}
		
		static public function set bSound(value:Boolean):void 
		{
			_bSound = value;
		}
		
	}

}