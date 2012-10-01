package org.logosMVC.panel
{
	import com.bit101.components.HRangeSlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.Style;
	
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Model;

	public class PanelVelocity extends Sprite
	{
		public var myVelocitySlider:HRangeSlider;
		public var labelCoca_Cola_velocity:Label;
		public var labelMac_Donalds_velocity:Label;
		
		public function PanelVelocity(model:Model)
		{
			////////////////////// bit-101:			
			Style.setStyle(Style.DARK);
			
			// main panel:
			var velocityPanel:Panel = new Panel(this, 0, 0);
			velocityPanel.setSize(142, 102);
			
			// Main label:
			var labelVelocity:Label = new Label(velocityPanel, 6, 5, "RANDOM VELOCITY");
			labelVelocity.textField.textColor = 0xFFAA00;		
			
			// Label:
			labelCoca_Cola_velocity = new Label(velocityPanel, 14, 25, "COCA COLA: 0");
			labelMac_Donalds_velocity = new Label(velocityPanel, 14, 45, "MAC DONALDS: 0");
									
			// Range slider:
			myVelocitySlider = new HRangeSlider(velocityPanel,14,80);
			myVelocitySlider.minimum = -5;
			myVelocitySlider.maximum = 5;
			myVelocitySlider.lowValue = 0;
			myVelocitySlider.highValue = 0;
			myVelocitySlider.tick = 1;
			myVelocitySlider.labelPrecision = 0;
			myVelocitySlider.name = "velocity";
			
		}		
		
	}
}