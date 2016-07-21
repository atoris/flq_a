package src 
{
	/**
	 * ...
	 * @author Atoris
	 */
	public class LogoInfoArr 
	{
		private static var _arrLogo:Array;
		private static var _length:int = 0;
		public function LogoInfoArr() 
		{
			arrLogo = new Array(	[0, "en", "Блэкберн Роверс", "Blackburn Rovers"],
									[1, "en", "Лидс Юнайтед", "Leeds United"],
									[2, "en", "Портсмут", "Portsmouth"],
									[3, "en", "Шеффилд Уэнсдей", "Sheffield Wednesday"],
									[4, "en", "Вулверхэмптон Уондерерс", "Wolverhampton Wanderers "],
									[5, "en", "Тоттенхэм Хотспур", "Tottenham Hotspur"],
									[6, "en", "Астон Вилла", "Aston Villa"],
									[7, "en", "Норвич Сити", "Norwich City"],
									[8, "en", "Ньюкасл Юнайтед", "Newcastle United"],
									[9, "en", "Борнмут", "Bournemouth"],
									[10, "en", "Болтон Уондерерс", "Bolton Wanderers"],
									[11, "en", "Челси", "Chelsea"],
									[12, "en", "Кристал Пэлас", "Crystal Palace"],
									[13, "en", "Эвертон", "Everton"],
									[14, "en", "Лестер Сити", "Leicester City"],
									[15, "en", "Саутгемптон", "Southampton"],
									[16, "en", "Вест Хэм Юнайтед", "West Ham United"],
									[17, "en", "Хаддерсфилд Таун", "Huddersfield Town"],
									[18, "en", "Ливерпуль", "Liverpool"],
									[19, "en", "Сандерленд", "Sunderland"],
									[20, "en", "Манчестер Сити", "Manchester City"],
									[21, "en", "Манчестер Юнайтед", "Manchester United"],
									[22, "en", "Ноттингем Форест", "Nottingham Forest"],
									[23, "en", "Сток Сити", "Stoke City"],
									[24, "en", "Суонси Сити", "Swansea City"],
									[25, "en", "Уотфорд", "Watford"],
									[26, "en", "Вест Бромвич Альбион", "West Bromwich Albion"],
									[27, "en", "Арсенал", "Arsenal"],
									[28, "en", "Бернли", "Burnley"],
									[29, "en", "Дерби Каунти", "Derby County"]
									);
												
			//trace(arrLogo[0][0]);
		}
		
		static public function get length():int 
		{
			_length = arrLogo.length;
			return _length;
		}
		
		static public function get arrLogo():Array 
		{
			return _arrLogo;
		}
		
		static public function set arrLogo(value:Array):void 
		{
			_arrLogo = value;
		}
		
		
		
	}

}