package src
{
	/**
	 * ...
	 * @author Atoris
	 */
	import com.appodeal.aneplugin.*;
	public class AdMobClass 
	{
		private static var appodeal:Appodeal = new Appodeal();
		
		public function AdMobClass() 
		{
			
		}
		public static function initAD():void 
		{
			var appKey:String = "4aa7522404cc1b600096912323618d39a889c86d47265d3c";
			appodeal.disableLocationPermissionCheck();
			appodeal.initialize(appKey,AdType.BANNER_BOTTOM|AdType.INTERSTITIAL|AdType.REWARDED_VIDEO|AdType.NON_SKIPPABLE_VIDEO);
			//appodeal.setTesting(true); 
		}
		
		public static function showBanner():void{
			appodeal.show(AdType.BANNER_BOTTOM);
		}
		public static function showBannerInterstitial():void{
			appodeal.show(AdType.INTERSTITIAL);
		}
		
		
		public static function showRewardedVideo():void{
			appodeal.show(AdType.REWARDED_VIDEO);
		}
		public static function showNonSkippableVideo():void 
		{
			appodeal.show(AdType.NON_SKIPPABLE_VIDEO);
			
		}
		
		public static function hide():void{
			/*appodeal.hide(AdType.BANNER_BOTTOM);
			appodeal.hide(AdType.INTERSTITIAL);
			appodeal.hide(AdType.NON_SKIPPABLE_VIDEO);
			appodeal.hide(AdType.REWARDED_VIDEO);*/
		}
	}

}