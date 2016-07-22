package src {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class GameOverMc extends MovieClip {
		
		
		public function GameOverMc() {
			// constructor code
			//GoogleAnalitics.getTrackView("ПРОИГРЫШ");
			//scaleX = scaleY = Opt.scale;
			
			//x = Opt.SW / 2;
			//y = Opt.SH / 2;
			
			Opt.btnLNG(btn, "Меню");
			btn.addEventListener(MouseEvent.CLICK, cMouse);
			
		}
		
		private function cMouse(e:MouseEvent):void 
		{
			if (Opt.numVideo!=1) 
			{
				Opt.numVideo--;
			}else{
				Opt.numVideo = 5;
				AdMobClass.showNonSkippableVideo();
				trace("ВИДЕО РЕКЛАМА");
			}
			trace(Opt.numVideo,"Opt.numVideo");
			var menu:MenuMc = new MenuMc();
			Opt.container.addChild(menu);
			AsAnimations.transitionObj(Opt.container.getChildAt(0),menu);
		}
	}
	
}
