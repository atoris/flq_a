package src 
{
	
	/**
	 * ...
	 * @author Atoris
	 */
	
	import flash.display.DisplayObject;
	import com.greensock.*;
	import com.greensock.easing.*;
	public class AsAnimations 
	{
		
		public function AsAnimations() 
		{
			
		}
		
		public static function transitionObj(obj1:DisplayObject,obj2:DisplayObject,delay:Number=.3):void 
		{
			obj2.x = Opt.SW + obj1.width;
			obj2.alpha = 0;
			var xPosObj1:Number =-obj1.width / 2;
			var xPosObj2:Number = obj1.x;
			if (tll!=null) 
			{
				tll.kill();
			}
			var tll:TimelineLite = new TimelineLite();
			
			//tll.startTime(5);
			
			TweenLite.to(obj1, .3, {x:xPosObj1, alpha:0, ease:Quad.easeInOut});
			TweenLite.to(obj2, .3,{x:xPosObj2,alpha:1, ease:Quad.easeInOut,onComplete:removeObj,onCompleteParams:[obj1]});
			
			//tll.shiftChildren(100);
			//var tl1:TweenLite = TweenLite.to();
			//var tl2:TweenLite = TweenLite.to();
			//TweenMax.to();
			//TweenMax.to();
		}
		
		public static function onBtn(arrObj:Array):void 
		{
			
			var timeline:TimelineLite = new TimelineLite();
			var xPos:Number = arrObj[0].x;
			for (var i:int = 0; i < arrObj.length; i++) 
			{
				//arrObj[i].scaleX = arrObj[i].scaleY = 0;
				//arrObj[i].x = Opt.SW + arrObj[i].width / 2;
				//arrObj[i].alpha = 0;
				timeline.shiftChildren(.1);
				//timeline.append(new TweenLite(arrObj[i], .2, {x:xPos, scaleX:1, scaleY:1, alpha:1, ease:Back.easeOut } ));
				
			}
			
			//var tl:TweenLite = new TweenLite(arrObj[i], .2, {x:xPos, scaleX:1, scaleY:1, alpha:1, ease:Back.easeOut } );
			
			//trace(getAnim);	
		}
		public static function restartBtn(arrObj:Array):void{
			if (timeline!=null) 
			{
				timeline.kill();
			}
			var timeline:TimelineLite = new TimelineLite();
			for (var i:int = 0; i < arrObj.length; i++) 
			{
				timeline.shiftChildren(.1);
				timeline.append(new TweenLite(arrObj[i], .2, {x:-arrObj[i].width-arrObj[i].width/2} ));				
			}
		}
		
		
		
		public static function animBackMenuOn(obj:DisplayObject, delay:Number = .3):void{
			//trace("xxx");
			obj.alpha = 0;
			//obj.scaleX = obj.scaleY = 0;
			TweenMax.to(obj, delay, {alpha:1});
			
		}
		public static function animBackMenuOff(obj:DisplayObject, delay:Number = .3):void 
		{
			trace("animBackMenuOff");
			TweenMax.to(obj, delay, {alpha:0,visible:false});
			//obj.visible = false;
		}
		
		static private function removeObj(obj:DisplayObject):void 
		{
			//trace("removeObj",obj);
			if (obj!=null) 
			{
				if(obj.parent) {
					obj.parent.removeChild(obj);
				}
				//Opt.container.removeChild(obj);
			}
			
		}
		
	}

}