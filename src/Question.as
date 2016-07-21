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
			
		}
		
		public function getLogoNum():void 
		{
			_arrAllQuestios = LogoInfoArr.arrLogo;
			_arrAllQuestios.sort(Opt.randomize);
			var ran:int;
			_arrQuestionsFalse = new Array();
			
			_numQuestion = _arrAllQuestios[0][0];
			_arrQuestion[0] = _arrAllQuestios[0][2];
			_arrQuestion[1] = _arrAllQuestios[1][2];
			_arrQuestion[2] = _arrAllQuestios[2][2];
			_arrQuestion[3] = _arrAllQuestios[3][2];
			_trueQuestion = _arrQuestion[0] ;
			_arrQuestion.sort(Opt.randomize);
			//trace(_arrQuestion);
			
			/*	ran = int(Math.random() * _arrAllQuestios.length);
				_numQuestion = ran;
				_arrQuestionTrue.push(ran);
				_arrAllQuestios.splice(ran, 1);
				for (var i:int = 0; i < 3; i++) 
				{
					ran = int(Math.random() * _arrAllQuestios.length);
					_arrQuestionsFalse.push(getFalseQuestions(ran));
				}				
			*/	
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