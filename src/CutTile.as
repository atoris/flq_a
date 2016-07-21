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
		private var tileBitmap:Bitmap;
		private var tileSize:int;
		private var tileSheetLength:int;
		private var sheetColumns:int;
		private var pt:Point;
		private var bmp:Bitmap;
		
		private var _arrRes:Array;
		public function CutTile(num:int=0) 
		{
			_arrRes = new Array( {name:"en" , cl:new Res.ENGLAND()});
			tileBitmap =_arrRes[num]["cl"];
			tileSize=640;
			tileSheetLength = 20;
			sheetColumns = tileBitmap.bitmapData.width / tileSize;
			pt = new Point(0, 0);
			
			
		}
		public function getBitmap(id:int):Bitmap
        {
            var col:int = id % sheetColumns;
            var row:int = Math.floor(id / sheetColumns);
			
            var rect:Rectangle = new Rectangle(col * tileSize, row * tileSize, tileSize, tileSize);
			bmp = new Bitmap(new BitmapData(tileSize, tileSize, true, 0));
            bmp.bitmapData.copyPixels (tileBitmap.bitmapData, rect, pt, null, null, true);
            //this.addChild(bmp);
			return bmp;
        }
		public function getMinBitmap(sourceBitmapData:Bitmap, startPoint:Point, w:Number, h:Number):Array
        {
			var arr:Array=new Array();
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
		
	}

}