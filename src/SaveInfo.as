package src 
{
	/**
	 * ...
	 * @author Atoris
	 */
	import flash.net.SharedObject;
	public class SaveInfo 
	{
		private static var soRec:SharedObject 
		private static var soSound:SharedObject 
		public static const RECORD:String = "RECORD";
		public static const SOUND:String = "SOUND";
		public function SaveInfo() 
		{
			
		}
		public static function init():void{
			soRec = SharedObject.getLocal(RECORD); 
			//soSound = new SharedObject.getLocal(SOUND);
		}
		
		public static function save(n:String,arg:*):void{
			if (n==RECORD) 
			{
				if (soRec.size == 0) 
				{ 
					soRec.data.rec = Opt.score; 
				} else{
					if(int(soRec.data.rec)<Opt.score){
						soRec.data.rec = Opt.score; 
					}
				}
				soRec.flush();					
			}
			if (n==SOUND) 
			{
				if (soRec.size == 0) 
				{ 
					soRec.data.sound = AsSoundClass.bSound; 
				} else{					
					soRec.data.sound = AsSoundClass.bSound; 					
				}
				soRec.flush();
			}
			
		}
		public static function load(n:String):String 
		{
			var str:*;
			if (n==RECORD) 
			{
				str=soRec.data.rec				
			}
			if (n==SOUND) 
			{
				str=soRec.data.sound		
			}
			return str;
		}
	}

}