package
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
		
	import org.logosMVC.mvc.Controller;
	import org.logosMVC.mvc.Model;
	import org.logosMVC.mvc.View;
	
	[SWF(width="1024", height="768", frameRate="60", backgroundColor='#ffffff')]
	
	public class Logos_MVC extends Sprite
	{
		
		public function Logos_MVC()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//stage.scaleMode = StageScaleMode.EXACT_FIT;
			//stage.scaleMode = StageScaleMode.NO_BORDER
			
			var model:Model = new Model();
			var controller:Controller = new Controller(model);
			var view:View = new View(model, controller);
			addChild(view);
		}
	}
}