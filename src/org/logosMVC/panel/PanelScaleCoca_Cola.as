package org.logosMVC.panel
{
	import com.bit101.components.HUISlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Model;
	
	public class PanelScaleCoca_Cola extends Sprite
	{
		public var scaleStart:HUISlider;
		
		public function PanelScaleCoca_Cola(model:Model)
		{
			// main panel:
			var sliderScaleCoca_ColaPanel:Panel = new Panel(this, 0, 0);
			sliderScaleCoca_ColaPanel.setSize(142, 77);
			
			// Main label:
			var labelVelocity:Label = new Label(sliderScaleCoca_ColaPanel, 10, 5, "SCALE COCA COLA");
			labelVelocity.textField.textColor = 0xFFAA00;
			
			// scale start slider:
			var start:Label = new Label(sliderScaleCoca_ColaPanel, 18, 25, "START");
			scaleStart = new HUISlider(sliderScaleCoca_ColaPanel, 9, 45);
			scaleStart.width = 160;
			scaleStart.labelPrecision = 1;
			scaleStart.minimum = 1;
			scaleStart.maximum = 5;
			scaleStart.tick = 0.1;
			scaleStart.name = "scaleStart_Coca_Cola"
			addChild(scaleStart);		
		}
	}
}