package
{
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Controller;
	import org.logosMVC.mvc.Model;
	import org.logosMVC.mvc.View;
	
	[SWF(width="1024", height="768", frameRate="60", backgroundColor='#ffffff')]
	
	public class Logos_MVC extends Sprite
	{
		
		public function Logos_MVC()
		{
			var model:Model = new Model();
			var controller:Controller = new Controller(model);
			var view:View = new View(model, controller);
			addChild(view);
		}
	}
}