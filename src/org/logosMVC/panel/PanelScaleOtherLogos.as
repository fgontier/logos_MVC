package org.logosMVC.panel
{
	import com.bit101.components.HUISlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Model;
	
	public class PanelScaleOtherLogos extends Sprite
	{
		public var scaleStart:HUISlider;
		public var scaleEnd:HUISlider;

		public function PanelScaleOtherLogos(model:Model)
		{
			// main panel:
			var sliderScaleOther_LogosPanel:Panel = new Panel(this, 0, 0);
			sliderScaleOther_LogosPanel.setSize(142, 115);
			
			// Main label:
			var labelVelocity:Label = new Label(sliderScaleOther_LogosPanel, 10, 5, "SCALE OTHER LOGOS");
			labelVelocity.textField.textColor = 0xFFAA00;
			
			// scale start slider:
			var start:Label = new Label(sliderScaleOther_LogosPanel, 18, 25, "START");
			scaleStart = new HUISlider(sliderScaleOther_LogosPanel, 9, 45);
			scaleStart.width = 160;
			scaleStart.labelPrecision = 1;
			scaleStart.minimum = 0;
			scaleStart.maximum = 5;
			scaleStart.tick = 0.1;
			scaleStart.value = 1;
			scaleStart.name = "scaleStart_Other_Logos"
			addChild(scaleStart);
			
			// scale end slider:
			var end:Label = new Label(sliderScaleOther_LogosPanel, 18, 65, "END");
			scaleEnd = new HUISlider(sliderScaleOther_LogosPanel, 9, 85);
			scaleEnd.width = 160;
			scaleEnd.labelPrecision = 1;
			scaleEnd.minimum = 0;
			scaleEnd.maximum = 5;
			scaleEnd.tick = 0.1;
			scaleEnd.value = 1;
			scaleEnd.name = "scaleEnd_Other_Logos"
			addChild(scaleEnd);			
		}
	}
}