package src 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.SimpleButton;
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Atoris
	 */
	public class Opt 
	{
		public static var SW:int = 480;
		public static var SH:int = 800;
		public static var LNG:String = "RU";
		private static var btn:DisplayObjectContainer;//кнопка
		private static var lbl:TextField;//лейбл кнопки
		
		public static var scale:Number = 1;
		public static const DEBUG_ANDROID:String = "ANDROID";
		public static const DEBUG_PC:String = "PC";
		
		private static var _container:Sprite = new Sprite();
		private static var _arrImage:Array = new Array();
		
		private static var _score:int = 0;
		
		private static var _numCage:int=2;
		public function Opt() 
		{
			
		}
		/**
		 * метод изменения языка и надписей на кнопках 
		 * @param	b кнопка в которой нужно изменить язык и надпись
		 * @param	s текст на который нужно заменить
		 * @param	i глубина текстового поля TextField
		 */
		
		public static function btnLNG(b:SimpleButton,s:String,i:int=1):void 
		{
			btn = b.upState as DisplayObjectContainer;
			lbl = btn.getChildAt(i) as TextField;
			lbl.text = s;
			btn = b.overState as DisplayObjectContainer;
			lbl = btn.getChildAt(i) as TextField;
			lbl.text = s;
			btn = b.downState as DisplayObjectContainer;
			lbl = btn.getChildAt(i) as TextField;
			lbl.text = s;
			
			trace(((b.upState as DisplayObjectContainer).getChildAt(i) as TextField).text,((b.overState as DisplayObjectContainer).getChildAt(i) as TextField).text,((b.downState as DisplayObjectContainer).getChildAt(i) as TextField).text);
			/*
			btn = b.hitState as DisplayObjectContainer;
			lbl = btn.getChildAt(i) as TextField;
			lbl.text = s;*/
		}
		
		public static function getBtnLabelText(b:SimpleButton):String{
			btn = b.upState as DisplayObjectContainer;
			lbl = btn.getChildAt(1) as TextField;
			//trace(btn,lbl.text);
			//lbl.text = s;
			return lbl.text; 
		}
		public static function randomize ( a : *, b : * ) : int {
			return ( Math.random() > .5 ) ? 1 : -1;
		}
		static public function get container():Sprite 
		{
			return _container;
		}
		
		static public function set container(value:Sprite):void 
		{
			_container = value;
		}
		
		static public function get arrImage():Array 
		{
			return _arrImage;
		}
		
		static public function set arrImage(value:Array):void 
		{
			_arrImage = value;
		}
		
		static public function get score():int 
		{
			return _score;
		}
		
		static public function set score(value:int):void 
		{
			_score = value;
		}
		
		static public function get numCage():int 
		{
			return _numCage;
		}
		
		static public function set numCage(value:int):void 
		{
			_numCage = value;
		}
		
	}

}