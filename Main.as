package  {
	
	import flash.display.MovieClip;
	import src.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	//import com.devactionscript.googleanalytics.FreeAneGoogleAnalytics;
	public class Main extends MovieClip {
		
		private var _menuMc:MenuMc;
		private var _cutTile:CutTile;
		private var _arrImage:Array;
		private var _question:Question;
		private var _debugName:String;
		private var _cont:Sprite = new Sprite();
		//private var _googleAnalyticsAne:FreeAneGoogleAnalytics = FreeAneGoogleAnalytics.getInstance();	
		public function Main() {
					
			//_googleAnalyticsAne.trakingId = "UA-81011789-1";
			//_googleAnalyticsAne.trackView("/YOUR_VIEW");
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addChild(_cont);
			Opt.container = _cont;
			
			//new Opt();
			_debugName = Opt.DEBUG_ANDROID;
			onResize();
			//Opt.container.scaleX = Opt.container.scaleY = Opt.scale();
			new LogoInfoArr();
			_arrImage = new Array();
			_question = new Question();
			_cutTile = new CutTile();
			var mc:MovieClip=new MovieClip();
			//mc.scaleX
			for (var i:int = 0; i < 36; i++) 
			{
				_arrImage.push(_cutTile.getBitmap(i));				
				
			}
			//addChild(_arrImage[12]);
			Opt.arrImage = _arrImage;
			
			AdMobClass.initAD();
			_menuMc = new MenuMc();
			Opt.container.addChild(_menuMc);
			
			
			
			
			//addChild(_cutTile.getBitmap(3));
			//addChild(_cutTile.Draw(10));
		}
		
		
		
		private function onResize():void 
		{
			if (_debugName==Opt.DEBUG_ANDROID) 
			{
				Opt.SW = stage.fullScreenWidth;
				Opt.SH = stage.fullScreenHeight;
				//Options.SH_CAGE = Options.SH - 100;
			}else {
				Opt.SW = stage.stageWidth; // а у тебя должно быть stage.fullScreenWidth
				Opt.SH = stage.stageHeight; // и stage.fullScreenHeight
				//Options.SH_CAGE = Options.SH - 100;
			}
			
			Opt.scale = Math.max(Opt.SW / bg.width, Opt.SH / bg.height);
			//bg.scaleX = bg.scaleY = Opt.scale;
			
		}
		
	}
	
}
