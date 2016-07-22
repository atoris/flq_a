package  {
	
	import flash.display.MovieClip;
	
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import com.appodeal.aneplugin.*;
	public class Main extends MovieClip {
		
		private var _scale:Number;
		private var _sw:Number;
		private var _sh:Number;
		public function Main() {
			// constructor code
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_sw = stage.fullScreenWidth;
			_sh = stage.fullScreenHeight;
			
			_scale = Math.max(_sw / bg.width, _sh / bg.height);
			
			logo.scaleX = logo.scaleY = _scale;
			
			
			var myLoader:Loader = new Loader();                     // create a new instance of the Loader class
			var url:URLRequest = new URLRequest("Football logo quiz.swf"); // in this case both SWFs are in the same folder 
			myLoader.load(url); 
			//myLoader.init(_sw,_sh,_scale);
			// load the SWF file
			addChild(myLoader); 
		}
	}
	
}
