package 
{
	/**
	 * ...
	 * @author Atoris
	 */
	
	import com.freshplanet.ane.AirGooglePlayGames.AirGooglePlayGames;
    import com.freshplanet.ane.AirGooglePlayGames.AirGooglePlayGamesEvent;
	
	public class GooglePlayServices 
	{
		
		public function GooglePlayServices() 
		{
			
		}
		
		
		public static function init():void
        {
		
            if(AirGooglePlayGames.isSupported)
            {
                AirGooglePlayGames.getInstance().addEventListener(AirGooglePlayGamesEvent.ON_SIGN_IN_SUCCESS, onSignInSuccess);
                AirGooglePlayGames.getInstance().addEventListener(AirGooglePlayGamesEvent.ON_SIGN_OUT_SUCCESS, onSignOutSuccess);
                AirGooglePlayGames.getInstance().addEventListener(AirGooglePlayGamesEvent.ON_SIGN_IN_FAIL, onSignInFail);
                AirGooglePlayGames.getInstance().signIn();
            }			 
            else {trace("google play is not supported")};
			//var appKey:String = "b001825246f5769fce5843385d2a5f81cd5601e9d353cb25";
			//appodeal.disableLocationPermissionCheck();
			//appodeal.initialize(appKey, AdType.BANNER);
        }
        private static function onSignInSuccess(e:AirGooglePlayGamesEvent):void
        {
            trace("Google play logged in");
            //LocalySavedData.GoogleRightsCheck("Granted");
            RemoveListeners();
        }
        private static function onSignOutSuccess(e:AirGooglePlayGamesEvent):void
        {
            trace("logout");
            RemoveListeners();
        }
        private static function onSignInFail(e:AirGooglePlayGamesEvent):void
        {
            trace("Google failed");
            //LocalySavedData.GoogleRightsCheck("UserCancelled");
            RemoveListeners();
        }
        private static function RemoveListeners():void
        {
            AirGooglePlayGames.getInstance().removeEventListener(AirGooglePlayGamesEvent.ON_SIGN_IN_SUCCESS, onSignInSuccess);
            AirGooglePlayGames.getInstance().removeEventListener(AirGooglePlayGamesEvent.ON_SIGN_OUT_SUCCESS, onSignOutSuccess);
            AirGooglePlayGames.getInstance().removeEventListener(AirGooglePlayGamesEvent.ON_SIGN_IN_FAIL, onSignInFail);    
        }
		
		
		
        public static function Score(number):void
        {
            trace("GooglePlay score sent " + number);
            AirGooglePlayGames.getInstance().reportScore("CgkI9OKd1PQcEAIQBg",number);
        }
        public static function ShowLeaderBoard():void
        {
			
            AirGooglePlayGames.getInstance().showLeaderboard("CgkI9OKd1PQcEAIQBg");
            
        }
		
	}

}