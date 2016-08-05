package src {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class MenuMc extends MovieClip {
		
		private var _gameMc:GameMc;
		public static var bool:Boolean = false;
		public function MenuMc() {
			// constructor code
			GoogleAnalitics.getTrackView("МЕНЮ");
			AsSoundClass.init();
			if (!AsSoundClass.bSound) 
			{
				btn_sound.visible = false;
				btn_sound_off.visible = true;
			}else{
				btn_sound.visible = true;
				btn_sound_off.visible = false;
			}
			scaleX = scaleY = Opt.scale;
			x=Opt.SW/2;
			y = Opt.SH / 2;
			
			
			Opt.btnLNG(btn_1,"ПРОСТО");
			Opt.btnLNG(btn_2,"НОРМАЛЬНО");
			Opt.btnLNG(btn_3,"СЛОЖНО");
			
			AsAnimations.onBtn([btn_1, btn_2, btn_3]);
			TimerCl.destroy();
			Opt.time = 60;
			btn_1.addEventListener(MouseEvent.CLICK, cMouse);
			btn_2.addEventListener(MouseEvent.CLICK, cMouse);
			btn_3.addEventListener(MouseEvent.CLICK, cMouse);
			btn_sound_off.addEventListener(MouseEvent.CLICK, cMouse);
			btn_sound.addEventListener(MouseEvent.CLICK, cMouse);
			btn_more.addEventListener(MouseEvent.CLICK, cMouse);
			btn_rec.addEventListener(MouseEvent.CLICK, cMouse);
		}
		
		
		
		
		
		private function cMouse(e:MouseEvent):void 
		{
			AsSoundClass.playClick();
			var more:MoreGameMc = new MoreGameMc();
			var rec:RecordMc = new RecordMc();
			
			if (e.currentTarget==btn_1){
				Opt.numCage = 2;
				_gameMc = new GameMc();
				removeListener(_gameMc);
			}
			if (e.currentTarget==btn_2){
				Opt.numCage = 3;
				_gameMc = new GameMc();
				removeListener(_gameMc);
			}
			if (e.currentTarget==btn_3){
				Opt.numCage = 4;
				_gameMc = new GameMc();
				removeListener(_gameMc);
			}
			if (e.currentTarget==btn_sound_off || e.currentTarget==btn_sound) 
			{
				AsSoundClass.setResult(btn_sound_off,btn_sound);
				
			}
			if (e.currentTarget==btn_rec) 
			{
				removeListener(rec);
			}
			if (e.currentTarget==btn_more) 
			{
				removeListener(more);
			}
			
			
			
		}
		
		private function removeListener(mc:MovieClip):void{
			btn_1.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_2.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_3.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_sound_off.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_sound.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_more.removeEventListener(MouseEvent.CLICK, cMouse);
			btn_rec.removeEventListener(MouseEvent.CLICK, cMouse);
			
			Opt.container.addChild(mc);
			AsAnimations.transitionObj(this,mc,.3);
		}
	}
	
}
