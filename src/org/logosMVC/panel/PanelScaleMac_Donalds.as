package org.logosMVC.panel
{
	import com.bit101.components.HUISlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Model;
	
	public class PanelScaleMac_Donalds extends Sprite
	{
		public var scaleStart:HUISlider;
		public var scaleEnd:HUISlider;
		
		public function PanelScaleMac_Donalds(model:Model)
		{
			// main panel:
			var scalePanel:Panel = new Panel(this, 0, 0);
			scalePanel.setSize(142, 115);
			
			// Main label:
			var labelVelocity:Label = new Label(scalePanel, 10, 5, "SCALE MAC DONALDS");
			labelVelocity.textField.textColor = 0xFFAA00;
			
			// scale start slider:
			var start:Label = new Label(scalePanel, 18, 25, "START");
			scaleStart = new HUISlider(scalePanel, 9, 45);
			scaleStart.width = 160;
			scaleStart.labelPrecision = 1;
			scaleStart.minimum = 0;
			scaleStart.maximum = 5;
			scaleStart.tick = 0.1;
			scaleStart.value = 1;
			scaleStart.name = "scaleStart_Mac_Donalds"
			addChild(scaleStart);
			
			// scale end slider:
			var end:Label = new Label(scalePanel, 18, 65, "END");
			scaleEnd = new HUISlider(scalePanel, 9, 85);
			scaleEnd.width = 160;
			scaleEnd.labelPrecision = 1;
			scaleEnd.minimum = 0;
			scaleEnd.maximum = 5;
			scaleEnd.tick = 0.1;
			scaleEnd.value = 1;
			scaleEnd.name = "scaleEnd_Mac_Donalds"
			addChild(scaleEnd);				
		}
	}
}