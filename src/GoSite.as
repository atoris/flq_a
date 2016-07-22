package src 
{
	/**
	 * ...
	 * @author Atoris
	 */
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.net.URLRequest;	
	import flash.net.navigateToURL;
	public class GoSite 
	{
		
		public function GoSite() 
		{
			
		}
		public static function GoMoreGame(appUrl:String) 
		{
			//Security.allowDomain("*");
			//var targetURL:URLRequest = new URLRequest("https://play.google.com/store/apps/details?id=air.alexandr.sirota.simonforandroid");
			
			navigateToURL(new URLRequest("market://search?q=pname:"+appUrl));
		}
	}

}