package src {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class MenuMc extends MovieClip {
		
		private var _gameMc:GameMc;
		public function MenuMc() {
			// constructor code
			GoogleAnalitics.getTrackView("МЕНЮ");
			scaleX = scaleY = Opt.scale;
			x=Opt.SW/2;
			y = Opt.SH / 2;
			btn_1.addEventListener(MouseEvent.CLICK, cMouse);
			btn_2.addEventListener(MouseEvent.CLICK, cMouse);
			btn_3.addEventListener(MouseEvent.CLICK, cMouse);
			
			Opt.btnLNG(btn_1,"САЛАГА");
			Opt.btnLNG(btn_2,"ФУТБОЛИСТ");
			Opt.btnLNG(btn_3,"ТРЕНЕР");
			
			AsAnimations.onBtn([btn_1, btn_2, btn_3]);
			TimerCl.destroy();
			Opt.time = 60;
		}
		
		private function cMouse(e:MouseEvent):void 
		{
			if (e.currentTarget==btn_1){
				Opt.numCage = 2;
			}
			if (e.currentTarget==btn_2){
				Opt.numCage = 3;
			}
			if (e.currentTarget==btn_3){
				Opt.numCage = 4;
			}
			btn_1.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_2.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_3.removeEventListener(MouseEvent.CLICK, cMouse);
			
			//Opt.container.removeChild(this);
			_gameMc=new GameMc();
			//_gameMc.arrImage=_arrImage;
			Opt.container.addChild(_gameMc);
			//AsAnimations.restartBtn([btn_1, btn_2, btn_3]);
			AsAnimations.transitionObj(this,_gameMc,.3);
			
		}
	}
	
}
