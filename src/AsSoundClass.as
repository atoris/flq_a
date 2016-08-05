package src 
{
	import com.greensock.core.SimpleTimeline;
	import flash.display.SimpleButton;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.media.SoundMixer;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class AsSoundClass 
	{
		private static var _bSound:Boolean = true;
		private static var _sc:SoundChannel;
		private static var _s1:Sound1;
		private static var _s2:Sound2;
		private static var _s3:Sound3;
		public function AsSoundClass() 
		{
			
		}
		
		
		public static function init():void{
			
			_bSound= (SaveInfo.load(SaveInfo.SOUND)=="true")?true:false;
		}
		
		public static function playClick():void{
			if (_bSound) 
			{
				if (_s1==null) 
				{
					_s1 = new Sound1();
				}				
				_sc = _s1.play();
			}
		}
		public static function playY():void{
			if (_bSound) 
			{
				if (_s2==null) 
				{
					_s2 = new Sound2();
				}				
				_sc = _s2.play();
			}
		}
		public static function playN():void{
			if (_bSound) 
			{
				if (_s3==null) 
				{
					_s3 = new Sound3();
				}
				_sc = _s3.play();
			}
		}
		
		public static function setResult(btn1:SimpleButton, btn2:SimpleButton):void{
			btn1.visible = !btn1.visible;
			btn2.visible = !btn2.visible;
			_bSound = !_bSound;
			
			SaveInfo.save(SaveInfo.SOUND, _bSound);
			
			var transform:SoundTransform;
			
			if (_bSound) 
			{
				transform=new SoundTransform(1,0);
				SoundMixer.soundTransform=transform;
			}else{
				transform = new SoundTransform(0, 0);
				SoundMixer.soundTransform=transform;
				SoundMixer.stopAll();
			}			
			
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