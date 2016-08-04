package src 
{
	
	/**
	 * ...
	 * @author Atoris
	 */
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class CutTile 
	{
		//private var tileBitmap:Bitmap;
		private var tileSize:int;
		private var sheetColumns:int;
		private var pt:Point;
		private var bmp:Bitmap;
		
		private var _arrRes:Array;
		
		private var _arrBitmap:Array;
		
		public function CutTile(num:int=0) 
		{
			
			//tileBitmap =_arrRes;
		}
		public function init():void{
			_arrRes = new Array(new Res.ENGLAND1(),new Res.ENGLAND2(),new Res.ENGLAND3(),new Res.ENGLAND4());
			
			_arrBitmap = new Array();
			tileSize=560;
			sheetColumns = (tileSize*5) / tileSize;
			pt = new Point(0, 0);
			
			for (var i:int = 0; i < _arrRes.length; i++) 
			{
				//tileBitmap = ;
				for (var j:int = 0; j < 25; j++) 
				{
					_arrBitmap.push(getBitmap(_arrRes[i],j));
				}
			}
			
		}
		public function getBitmap(tileBitmap:Bitmap,id:int):Bitmap
        {
			//Opt.container.addChild(tileBitmap);
			//return tileBitmap;
            var col:int = id % sheetColumns;
			var row:int = Math.floor(id / sheetColumns);
			
			var rect:Rectangle = new Rectangle(col * tileSize, row * tileSize, tileSize, tileSize);
			bmp = new Bitmap(new BitmapData(560, 560, true, 0));
			bmp.bitmapData.copyPixels (tileBitmap.bitmapData, rect, pt, null, null, true);
			//this.addChild(bmp);
			return bmp;
        }
		public function getMinBitmap(sourceBitmapData:Bitmap, startPoint:Point, w:Number, h:Number):Array
        {
			var arr:Array = new Array();
			
			for(var i:int=0;i<startPoint.x;i++){
				for(var j:int=0;j<startPoint.y;j++){
					/*var croppedBD:BitmapData = new BitmapData(w, h);
					croppedBD.copyPixels(tileBitmap.bitmapData, new Rectangle(startPoint.x, startPoint.y, w, h), new Point(0, 0));
					return croppedBD.clone();*/
					
					var rect:Rectangle = new Rectangle(i * w, j * h, w, h);
					
					bmp = new Bitmap(new BitmapData(w, h, true, 0));
					bmp.bitmapData.copyPixels (sourceBitmapData.bitmapData, rect,new Point(0,0));
					//this.addChild(bmp);
					
					arr.push( bmp);
					//croppedBD.dispose();
				}
			}
			return arr;
        }
		
		public function get arrBitmap():Array 
		{
			return _arrBitmap;
		}
		
		public function set arrBitmap(value:Array):void 
		{
			_arrBitmap = value;
		}
		
	}

}