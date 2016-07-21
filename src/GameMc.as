package  src{
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import src.CutTile;
	import flash.geom.Point;
	import com.greensock.TweenLite;
	import com.greensock.TimelineLite;
	import src.LogoInfoArr;
	import src.Question;
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	import com.greensock.TweenMax;
	import flash.display.SimpleButton;
	import flash.events.KeyboardEvent;
	import flash.desktop.NativeApplication;
	import flash.ui.Keyboard;
	public class GameMc extends MovieClip {
		
		private var _cageMc:MovieClip;
		private var _gridMc:MovieClip;
		private var _cutTile:CutTile;
		public var arrImage:Array;
		private var _wCage:Number;
		private var _hCage:Number;
		private var _arrBmp:Array;
		private var _arrCage:Array;
		private var _num:int = 0;
		
		private var _tll1:TimelineLite;
		private var _tll2:TimelineLite;
		
		private var _tl1:TweenLite;
		private var _tl2:TweenLite;		
		
		private var _questions:Question;
		private var _arrBtn:Array;
		private var _numCell:int;
		private var _nextLevelMc:NextLevelMc;
		private var _image:Bitmap;
		
		
		public function GameMc() {
			TweenPlugin.activate([TintPlugin]);
			
			scaleX = scaleY = Opt.scale;
			x=Opt.SW/2;
			y=Opt.SH/2;
			
			
			_questions = new Question();
			_tll1 = new TimelineLite();
			_tll2 = new TimelineLite();
			arrImage=new Array();
			arrImage=Opt.arrImage;
			_cutTile = new CutTile();
			
			
			messageBox.visible = false;
			
			
			_gridMc=new MovieClip();
			addChild(_gridMc);
			_gridMc.x=cagebg.x;
			_gridMc.y=cagebg.y;
			cagebg.visible=false;
			addCage(Opt.numCage,Opt.numCage);
			_arrBmp = new Array();
			topMenu.txt.text = String(Opt.score);
			topMenu.txt2.text = String(Opt.score);
			_questions.getLogoNum();
			_arrBmp = _cutTile.getMinBitmap(arrImage[_questions.numQuestion], new Point(Opt.numCage,Opt.numCage), _wCage, _hCage);
			_image = arrImage[_questions.numQuestion];
			
			topMenu.btn_sound.addEventListener(MouseEvent.CLICK, cMouseTopMenu);
			topMenu.btn_menu.addEventListener(MouseEvent.CLICK, cMouseTopMenu);
			messageBox.btn_ok.addEventListener(MouseEvent.CLICK, cMouseMessageBox);
			messageBox.btn_no.addEventListener(MouseEvent.CLICK, cMouseMessageBox);
			
			addBmpCage();
			addBtn();
			setChildIndex(messageBox, numChildren - 1);
			
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN,checkKeypress);
		}
		
		private function checkKeypress(e:KeyboardEvent):void 
		{
			if (e.keyCode==Keyboard.BACK) 
			{
				e.preventDefault();
				messageBox.visible = true;
				AsAnimations.animBackMenuOn(messageBox);
			}
			
		}
		
		private function cMouseMessageBox(e:MouseEvent):void 
		{
			if (e.currentTarget==messageBox.btn_ok) 
			{
				removeAll();
			}else{
				AsAnimations.animBackMenuOff(messageBox);
				//messageBox.visible = false;
			}
		}
		
		private function cMouseTopMenu(e:MouseEvent):void 
		{
			if (e.currentTarget==topMenu.btn_menu) 
			{
				messageBox.visible = true;
				AsAnimations.animBackMenuOn(messageBox);
				
			}else{
				trace("SOUND");
			}
		}
		
		private function removeAll():void 
		{
			for (var i:int = 0; i < _arrBtn.length; i++) 
			{
				_arrBtn[i].removeEventListener(MouseEvent.CLICK,cBtn);
			}
			for (var j:int = 0; j <_arrCage.length ; j++) 
			{
				_arrCage[j].removeEventListener(MouseEvent.CLICK, cMouse);
			}
			messageBox.btn_ok.removeEventListener(MouseEvent.CLICK, cMouseMessageBox);
			messageBox.btn_no.removeEventListener(MouseEvent.CLICK, cMouseMessageBox);
			topMenu.btn_sound.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
			topMenu.btn_menu.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
			
			//Opt.container.removeChild(this);
			
			var men:MovieClip = new MenuMc();
			Opt.container.addChild(men);
			AsAnimations.transitionObj(this,men);
			Opt.score = 0;
		}
		
		private function addBtn():void 
		{
			_arrBtn = new Array();
			_arrBtn[0] = btn_1;
			_arrBtn[1] = btn_2;
			_arrBtn[2] = btn_3;
			_arrBtn[3] = btn_4;
			
			
			for (var i:int = 0; i < 4; i++) 
			{
				Opt.btnLNG(_arrBtn[i], _questions.arrQuestion[i]);
				//_arrBtn[i].name = _questions.arrQuestion[i];
				//_arrBtn[i].txt.text = _questions.arrQuestion[i];
			}
			AsAnimations.onBtn(_arrBtn);
			start();
		}
		private function btnRename():void 
		{
			_questions.getLogoNum();
			_arrBmp = new Array();
			
			_arrBmp = _cutTile.getMinBitmap(arrImage[_questions.numQuestion], new Point(Opt.numCage, Opt.numCage), _wCage, _hCage);
			
			addBmpCage();
			
			for (var i:int = 0; i < _arrBtn.length; i++) 
			{
				Opt.btnLNG(_arrBtn[i], _questions.arrQuestion[i]);
			}
		}
		
		private function start():void 
		{
			for (var i:int = 0; i < _arrBtn.length; i++) 
			{
				_arrBtn[i].addEventListener(MouseEvent.CLICK,cBtn);
			}
		}
		
		private function cBtn(e:MouseEvent):void 
		{
			if (_nextLevelMc==null) 
			{
				_nextLevelMc = new NextLevelMc();
				_nextLevelMc.visible = true;
				Opt.container.addChild(_nextLevelMc);
				
			}
			
			if (Opt.getBtnLabelText(e.target as SimpleButton)==_questions.trueQuestion) 
			{
				
				Opt.score+= (Opt.numCage*Opt.numCage) - _numCell+1;
				//topMenu.txt.text = "SCORE: " + String(Opt.score);
				_nextLevelMc.init(_image,_numCell-1,"Y",_questions.trueQuestion);
				//btnRename();
				
				
			}else {
				
				Opt.score = 0;
				//topMenu.txt.text = "SCORE: " + String(Opt.score);
				_nextLevelMc.init(_image,_numCell,"N",_questions.trueQuestion);
				
				//btnRename();
			}
			
			for (var i:int = 0; i < _arrBtn.length; i++) 
			{
				_arrBtn[i].removeEventListener(MouseEvent.CLICK,cBtn);
			}
			for (var j:int = 0; j <_arrCage.length ; j++) 
			{
				_arrCage[j].removeEventListener(MouseEvent.CLICK, cMouse);
			}
			topMenu.btn_sound.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
			topMenu.btn_menu.removeEventListener(MouseEvent.CLICK, cMouseTopMenu);
			
			//AsAnimations.restartBtn(_arrBtn);
			AsAnimations.transitionObj(this,_nextLevelMc,.3);
			//Opt.container.removeChild(this);
		}
		
		
		
		private function cMouse(e:MouseEvent):void 
		{
			if (e.target.rotationY==-180) 
			{
				
				var maskMc:MovieClip;
				if (Opt.numCage==5) 
				{
					maskMc = new MaskMc5();
				}
				if (Opt.numCage==4) 
				{
					maskMc = new MaskMc4();
				}
				if (Opt.numCage==3) 
				{
					maskMc = new MaskMc3();
				}
				if (Opt.numCage==2) 
				{
					maskMc = new MaskMc2();
				}
				
				
				_numCell++;
				e.target.addChild(maskMc);
				e.target.mask = maskMc;
				TweenLite.to(e.target.getChildAt(1), .3, { alpha:1 } );
				TweenLite.to(e.target, .3, { rotationY:0 } );
			}
		}
		private function addCage(iPos:int,jPos:int):void{
			_arrCage=new Array();
			for	(var i:int=0;i<iPos;i++){
				
				for (var j:int = 0; j < jPos; j++){
					if (Opt.numCage==5) 
					{
						_cageMc = new CageMc5();
					}
					if (Opt.numCage==4) 
					{
						_cageMc = new CageMc4();
					}
					if (Opt.numCage==3) 
					{
						_cageMc = new CageMc3();
					}
					if (Opt.numCage==2) 
					{
						_cageMc = new CageMc2();
					}
					
					_cageMc.x = i * (_cageMc.width)+_cageMc.width/2;//+_cageMc.width/2;
					_cageMc.y = j * (_cageMc.width)+_cageMc.height/2;//+_cageMc.width/2;
					_arrCage.push(_cageMc);
					_wCage = _cageMc.width;
					_hCage = _cageMc.height;
					_gridMc.addChild(_cageMc);
				}
				var mc:MovieClip;
			}
		}
		private function addBmpCage():void{
			var arr:Array = new Array();
			for (var i:int = 0; i < _arrBmp.length; i++) {
				arr.push(i);
				
			}
			_arrBmp.sort(Opt.randomize);
			
			
			for (var k:int = 0; k < _arrBmp.length; k++) 
			{
				if (_arrCage[k].numChildren==2) 
				{
					_arrCage[k].removeChildAt(1);
				}
				//_arrBmp[k].rotationZ = int(Math.random() * 3) * 90;
				_arrBmp[k].x = - _wCage / 2;
				_arrBmp[k].y = - _hCage / 2;
				
				_arrCage[k].addChild(_arrBmp[k]);
				
				TweenLite.to(_arrCage[k], 0, { rotationY: -180 } );
				TweenLite.to(_arrBmp[k], 0, {alpha:0} );
				
				
			}
			
			for (var j:int = 0; j <_arrCage.length ; j++) 
			{
				_arrCage[j].addEventListener(MouseEvent.CLICK, cMouse);
			}
		}
	}
	
}
