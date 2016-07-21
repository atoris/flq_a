package src 
{
	/**
	 * ...
	 * @author Atoris
	 */
	import com.devactionscript.googleanalytics.FreeAneGoogleAnalytics;
	public class GoogleAnalitics 
	{
		private static var _googleAnalyticsAne:FreeAneGoogleAnalytics = FreeAneGoogleAnalytics.getInstance();	
		public function GoogleAnalitics() 
		{
			
		}
		
		public static function init():void{
			_googleAnalyticsAne.trakingId = "UA-81011789-1";
			_googleAnalyticsAne.trackView("Включение игры");
		
		}
		public static function getTrackView(str:String):void{
			_googleAnalyticsAne.trackView(str);
			//_googleAnalyticsAne.trackClickEvent();
		}
		
	}

}