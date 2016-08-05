package src {
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class NextLevelMc extends MovieClip {
		
		private var _gameMc:GameMc;
		private var _gameOver:Boolean;
		public function NextLevelMc() {
			// constructor code
			GoogleAnalitics.getTrackView("ПЕРЕХОД МЕЖДУ УРОВНЕЙ");
			if (Opt.numRec!=1) 
			{
				Opt.numRec--;
			}else{
				Opt.numRec = 10;
				if (!TimerCl.bGameOver) 
				{
					AdMobClass.showBannerInterstitial();
				}
				
			}
			AsSoundClass.init();
			if (!AsSoundClass.bSound) 
			{
				topMenu.btn_sound.visible = false;
				topMenu.btn_sound_off.visible = true;
			}else{
				topMenu.btn_sound.visible = true;
				topMenu.btn_sound_off.visible = false;
			}
			topMenu.timermc.txt1.text = String(Opt.time);
			topMenu.timermc.txt2.text = String(Opt.time);
			
			scaleX = scaleY = Opt.scale;
			messageBox.visible = false;
			x = Opt.SW / 2;
			y = Opt.SH / 2;
			nextBtn.addEventListener(MouseEvent.CLICK, cMouse);
			topMenu.btn_sound.addEventListener(MouseEvent.CLICK, cMouseTopMenu);
			topMenu.btn_sound_off.addEventListener(MouseEvent.CLICK, cMouseTopMenu);
			topMenu.btn_menu.addEventListener(MouseEvent.CLICK, cMouseTopMenu);
			messageBox.btn_ok.addEventListener(MouseEvent.CLICK, cMouseMessageBox);
			messageBox.btn_no.addEventListener(MouseEvent.CLICK, cMouseMessageBox);
			setChildIndex(messageBox, numChildren-1);
		}
		
		private function cMouseMessageBox(e:MouseEvent):void 
		{
			AsSoundClass.playClick();
			if (e.currentTarget==messageBox.btn_ok) 
			{				
				removeAll();
				
			}else{
				AsAnimations.animBackMenuOff(messageBox);
				//messageBox.visible = false;
			}
		}
		
		private function cMouse(e:MouseEvent):void 
		{
			AsSoundClass.playClick();
			if (e.currentTarget==nextBtn) 
			{
				if (!_gameOver) 
				{
					nextBtn.removeEventListener(MouseEvent.CLICK, cMouse);
					topMenu.btn_sound.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
					topMenu.btn_menu.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
					//Opt.container.removeChild(this);
					_gameMc = new GameMc();
					Opt.container.addChild(_gameMc);
					AsAnimations.transitionObj(this,_gameMc);
				}else{
					removeAll();					
				}				
			}
		}
		private function cMouseTopMenu(e:MouseEvent):void 
		{
			AsSoundClass.playClick();
			if (e.currentTarget==topMenu.btn_menu) 
			{
				if (!_gameOver) 
				{
					messageBox.visible = true;
					AsAnimations.animBackMenuOn(messageBox);
				}else{
					removeAll();
				}
				
			}
			if (e.currentTarget==topMenu.btn_sound_off || e.currentTarget==topMenu.btn_sound) 
			{
				AsSoundClass.setResult(topMenu.btn_sound_off,topMenu.btn_sound);				
			}
		}
		
		private function removeAll():void 
		{
			messageBox.btn_ok.removeEventListener(MouseEvent.CLICK, cMouseMessageBox);
			messageBox.btn_no.removeEventListener(MouseEvent.CLICK, cMouseMessageBox);
			topMenu.btn_sound.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
			topMenu.btn_menu.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
			nextBtn.removeEventListener(MouseEvent.CLICK, cMouse);
			//Opt.container.removeChild(this);
			var men:MenuMc = new MenuMc();
			Opt.container.addChild(men);
			AsAnimations.transitionObj(this,men);
			Opt.score = 0;
		}
		
		public function init(bmp:Bitmap,num:int,str:String,name:String):void{			
			
			
			cagebg.addChild(bmp);
			TimerCl.pause();
			topMenu.txt.text = String(Opt.score);
			topMenu.txt2.text = String(Opt.score);
			txt_name.text = name;
			if (str=="Y") 
			{
				AsSoundClass.playY();
				_gameOver = false;
				txt1.text = "+ " + String((Opt.numCage * Opt.numCage) - num);
				txt2.text = "+ " + String((Opt.numCage * Opt.numCage) - num);
				//txt_info.text = "CELLS: " + String(num) + "/"+String((Opt.numCage*Opt.numCage))+"\n" + "SCORE + " + String((Opt.numCage*Opt.numCage) - num);
				gotoAndStop(1);
			}else{
				AsSoundClass.playN();
				_gameOver = true;
				gotoAndStop(2);
				
				txt1.text = "+ 0" ;
				txt2.text = "+ 0" ;
				TimerCl.destroy();
				var gameOverMc:GameOverMc = new GameOverMc();
				addChild(gameOverMc);
				gameOverMc.txt.text = "Ваш счет: "+String(Opt.score);
				AsAnimations.animBackMenuOn(gameOverMc);
				
				SaveInfo.save(SaveInfo.RECORD, Opt.score);
				Opt.score = 0;
				//txt_info.text = "CELLS: " + String(num) + "/"+String((Opt.numCage*Opt.numCage))+"\n" + "SCORE + 0";				
			}
			//topMenu.txt.text = "SCORE: "+String(Opt.score);
			
		}
		public function playMc(str:String):void{
			
			
		}
	}
	
}
