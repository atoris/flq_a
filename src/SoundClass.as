package src
{
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.media.SoundMixer;
	/**
	 * ...
	 * @author Atoris
	 */
	public class SoundClass 
	{
		
		public function SoundClass() 
		{
			
		}
		public static function stop(btn:MovieClip):void{
			
			var transform:SoundTransform=new SoundTransform(0,0);
			SoundMixer.soundTransform=transform;
			SoundMixer.stopAll();
		}
		public static function play(btn:MovieClip):void 
		{
			btn.gotoAndPlay(1);
			btn.nextFrame();
			var transform:SoundTransform=new SoundTransform(1,0);
			SoundMixer.soundTransform=transform;
			
		}
	}

}