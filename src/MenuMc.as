package src {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class MenuMc extends MovieClip {
		
		private var _gameMc:GameMc;
		public function MenuMc() {
			// constructor code
			scaleX = scaleY = Opt.scale;
			x=Opt.SW/2;
			y = Opt.SH / 2;
			btn_1.addEventListener(MouseEvent.CLICK, cMouse);
			btn_2.addEventListener(MouseEvent.CLICK, cMouse);
			btn_3.addEventListener(MouseEvent.CLICK, cMouse);
			
			Opt.btnLNG(btn_1,"ПРОСТО");
			Opt.btnLNG(btn_2,"СЛОЖНО");
			Opt.btnLNG(btn_3,"ОЧЕНЬ СЛОЖНО");
			
			btn_1ad.addEventListener(MouseEvent.CLICK, cMouseAd);
			btn_2ad.addEventListener(MouseEvent.CLICK, cMouseAd);
			btn_3ad.addEventListener(MouseEvent.CLICK, cMouseAd);
			btn_4ad.addEventListener(MouseEvent.CLICK, cMouseAd);
		}
		private function cMouseAd(e:MouseEvent):void 
		{
			AdMobClass.hide();
			if (e.currentTarget==btn_1ad) 
			{
				AdMobClass.showBanner();
			}
			if (e.currentTarget==btn_2ad) 
			{
				AdMobClass.showBannerInterstitial();
			}
			
			if (e.currentTarget==btn_3ad) 
			{
				AdMobClass.showRewardedVideo();
			}
			if (e.currentTarget==btn_4ad) 
			{
				AdMobClass.showNonSkippableVideo();
			}
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
			
			Opt.container.removeChild(this);
			_gameMc=new GameMc();
			//_gameMc.arrImage=_arrImage;
			Opt.container.addChild(_gameMc);
			
		}
	}
	
}
