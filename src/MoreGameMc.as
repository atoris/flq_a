package src 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Atoris
	 */
	public class MoreGameMc extends MovieClip
	{
		
		public function MoreGameMc() 
		{
			//GoogleAnalitics.getTrackView("ПРОИГРЫШ");
			scaleX = scaleY = Opt.scale;
			
			x = Opt.SW / 2;
			y = Opt.SH / 2;
			Opt.btnLNG(btn_menu, "Меню");
			btn_simon.addEventListener(MouseEvent.CLICK, cMouse);
			btn_menu.addEventListener(MouseEvent.CLICK, cMouse);
		}
		
		private function cMouse(e:MouseEvent):void 
		{
			if (e.currentTarget==btn_menu) 
			{
				var men:MenuMc = new MenuMc();
				Opt.container.addChild(men);
				AsAnimations.transitionObj(this,men);
			}
			if (e.currentTarget==btn_simon) 
			{
				GoSite.GoMoreGame("air.alexandr.sirota.simonforandroid");
			}
		}
		
	}

}