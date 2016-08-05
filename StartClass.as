package  {
	
	import flash.display.MovieClip;
	import src.*;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.desktop.NativeApplication;
	public class StartClass extends MovieClip {
		
		private var _menuMc:MenuMc;
		private var _cutTile:CutTile;
		private var _arrImage:Array;
		private var _question:Question;
		private var _debugName:String;
		private var _cont:Sprite = new Sprite();
		private var _numClick:int = 0;
		
		public function StartClass() {
					
			init(0,0,0);
		}
		public function init(sw:Number,sh:Number,sc:Number):void{
			GoogleAnalitics.init();
			
			
			//addChild(_cont);
			//Opt.container = _cont;
			
			//new Opt();
			//_debugName = Opt.DEBUG_ANDROID;
			//onResize();
			//Opt.container.scaleX = Opt.container.scaleY = Opt.scale();
			//new LogoInfoArr();
			_arrImage = new Array();
			_question = new Question();
			_cutTile = new CutTile();
			_cutTile.init();
			//var mc:MovieClip=new MovieClip();
			//mc.scaleX
			/*for (var i:int = 0; i < 130; i++) 
			{
				_arrImage.push(_cutTile.getBitmap(i));				
				
			}*/
			_arrImage = _cutTile.arrBitmap;
			
			
			//addEventListener(MouseEvent.CLICK, cMouse);
			
			//addChild(_arrImage[12]);
			Opt.arrImage = _arrImage;
			SaveInfo.init();
			AdMobClass.initAD();
			
			//var preloader:PreloaderMc = new PreloaderMc();
			//addChild(preloader);
			//preloader.scaleX = preloader.scaleY = Opt.scale/2;
			//preloader.x = Opt.SW / 2;
			//preloader.y = Opt.SH / 2;
			
			
			_menuMc = new MenuMc();
			Opt.container.addChild(_menuMc);
			Opt.numRec = 10;
			
			AdMobClass.showBanner();
			
			
			
			//addChild(_cutTile.getBitmap(3));
			//addChild(_cutTile.Draw(10));
		}
		
		
		
		private function cMouse(e:MouseEvent):void 
		{
			Opt.removeAll();
			Opt.container.addChild(_arrImage[_numClick]);
			
			_numClick++;
			trace(_numClick);
		}
		
		
		private function onResize():void 
		{
			/*if (_debugName==Opt.DEBUG_ANDROID) 
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
			*/
		}
		
		
	}
	
}
