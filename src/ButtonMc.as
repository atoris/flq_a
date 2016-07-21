package src 
{
	/**
	 * ...
	 * @author Atoris
	 */
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.events.Event;
	public class ButtonMc extends MovieClip
	{
		public function ButtonMc() 
		{
			stop();
			addEventListener(MouseEvent.MOUSE_DOWN,mDown);
			addEventListener(MouseEvent.MOUSE_UP,mUp);
			if (Opt.LNG=="RU") 
			{
				gotoAndStop(3);
			}else{
				gotoAndStop(1);
			}
			
			addEventListener(MouseEvent.MOUSE_MOVE, mMove);
		}
		
		
		
		
		
		private function mDown(e:MouseEvent):void{
			if (Opt.LNG=="RU") 
			{
				gotoAndStop(4);
			}else{
				gotoAndStop(2);	
			}
			
		}
		private function mUp(e:MouseEvent):void{
			if (Opt.LNG=="RU") 
			{
				gotoAndStop(3);
			}else{
				gotoAndStop(1);	
			}
		}
		
		
		
	}

}