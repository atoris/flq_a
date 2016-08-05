package src {
	
	import flash.display.MovieClip;
	
	import flash.events.MouseEvent;
	public class RecordMc extends MovieClip {
		
		
		public function RecordMc() {
			GoogleAnalitics.getTrackView("ТАБЛИЦА РЕКОРДОВ");
			scaleX = scaleY = Opt.scale;
			
			x = Opt.SW / 2;
			y = Opt.SH / 2;
			Opt.btnLNG(btn, "Меню");	
			txt.text = String(SaveInfo.load(SaveInfo.RECORD));
			btn.addEventListener(MouseEvent.CLICK, cMouse);
		}
		
		private function cMouse(e:MouseEvent):void 
		{
			AsSoundClass.playClick();
			var men:MenuMc = new MenuMc();
			Opt.container.addChild(men);
			AsAnimations.transitionObj(this,men);
			
		}
	}
	
}
