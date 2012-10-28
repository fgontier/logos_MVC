package org.logosMVC.panel
{
	import com.bit101.components.HUISlider;
	import com.bit101.components.Label;	
	import com.bit101.components.Panel;
	
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Model;
	
	public class PanelFade extends Sprite
	{
		public var fadeEnd:HUISlider;

		public function PanelFade(model:Model)
		{
			// main panel:
			var sliderScaleCoca_ColaPanel:Panel = new Panel(this, 0, 0);
			sliderScaleCoca_ColaPanel.setSize(142, 63);
			
			// Main label:
			var label:Label = new Label(sliderScaleCoca_ColaPanel, 10, 5, "FADE");
			label.textField.textColor = 0xFFAA00;
			
			// fade start slider:
			fadeEnd = new HUISlider(sliderScaleCoca_ColaPanel, 9, 30);
			fadeEnd.width = 160;
			fadeEnd.labelPrecision = 1;
			fadeEnd.minimum = 0;
			fadeEnd.maximum = 1;
			fadeEnd.tick = 0.1;
			fadeEnd.name = "fade";
			addChild(fadeEnd);
		}
	}
}