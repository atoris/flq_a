package src 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Atoris
	 */
	public class TimerCl 
	{
		private static var _tim:Timer ;
		private static var _tNum:int;
		private static var _obJ:MovieClip;
		private static var _bGameOver:Boolean;
		public function TimerCl() 
		{
			
		}
		/**
		 * инициализация таймера
		 * @param	n количество максимальных тиков * на время
		 */
		public static function start(obj:MovieClip):void 
		{
			
			_obJ = obj;
			if (_tim==null) 
			{
				_tNum = Opt.time;
				_tim = new Timer(1000, Opt.time);
				_tim.addEventListener(TimerEvent.TIMER, tEvent);
				_tim.addEventListener(TimerEvent.TIMER_COMPLETE, tEventComplete);
				//_tim.start();
			}
			_bGameOver = false;
		}
		
		static private function tEventComplete(e:TimerEvent):void 
		{
			
			_tim.removeEventListener(TimerEvent.TIMER, tEvent);
			_tim.removeEventListener(TimerEvent.TIMER_COMPLETE, tEventComplete);
			//trace(Opt.trueQuestion,Opt.image);
			//Opt.removeAll();
			_bGameOver = true;
			//var menu:MenuMc = new MenuMc();
			//Opt.container.addChild(menu);
			
			var _nextLevelMc:NextLevelMc = new NextLevelMc();
			_nextLevelMc.visible = true;
			Opt.container.addChild(_nextLevelMc);
			//SaveInfo.save(SaveInfo.RECORD, Opt.score);
			_nextLevelMc.init(Opt.image,0,"N",Opt.trueQuestion);
			AsAnimations.transitionObj(Opt.container.getChildAt(0),_nextLevelMc);
		//	trace("GAME OVER");
		}
		public static function pause():void 
		{
			if (_tim!=null) 
			{
				_tim.stop();
			}
			
		}
		public static function play():void 
		{
			_tim.start();
		}
		public static function destroy():void{
			if (_tim!=null) 
			{
				_tim.removeEventListener(TimerEvent.TIMER, tEvent);
				_tim = null;
				_tNum = Opt.time;
				//Opt.time = 60;				
			}
			
		}
		
		/**
		 * работа таймера
		 */
		private static function tEvent(e:TimerEvent):void 
		{
			
			_tNum--;
			
			Opt.time = _tNum;
			//trace(_obJ.txt1);
			_obJ.txt1.text = String(_tNum);
			_obJ.txt2.text = String(_tNum);
			
		}
		
		static public  function get tNum():int 
		{
			return _tNum;
		}
		
		static public function set tNum(value:int):void 
		{
			_tNum = value;
		}
		
		static public function get tim():Timer 
		{
			return _tim;
		}
		
		static public function get bGameOver():Boolean 
		{
			return _bGameOver;
		}
		
	}

}