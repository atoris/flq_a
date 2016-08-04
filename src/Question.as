package src 
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class Question 
	{
		private var _arrQuestion:Array;
		private var _arrQuestionsFalse:Array;
		private var _numQuestion:int;
		private var _arrAllQuestios:Array;
		private var _trueQuestion:String;
		
		
		public function Question() 
		{			
			_arrQuestion = new Array();	
			_arrAllQuestios = new Array();
			_arrQuestionsFalse = LogoInfoArr.arrLogo;
		}
		
		public function getLogoNum():void 
		{
			_arrAllQuestios = LogoInfoArr.arrLogo;
			_arrAllQuestios.sort(Opt.randomize);
			
			
			_numQuestion = _arrAllQuestios[0]["num"];
			
			_arrQuestion[0] = _arrAllQuestios[0]["name"];
			_arrQuestion[1] = _arrAllQuestios[1]["name"];
			_arrQuestion[2] = _arrAllQuestios[2]["name"];
			_arrQuestion[3] = _arrAllQuestios[3]["name"];
			_trueQuestion = _arrQuestion[0] ;
			
			_arrQuestion.sort(Opt.randomize);
			
		
		}
		public function get numQuestion():int 
		{
			return _numQuestion;
		}
		
		public function get trueQuestion():String 
		{
			return _trueQuestion;
		}
		
		public function get arrQuestion():Array 
		{
			return _arrQuestion;
		}
		
		
		
		
	}

}