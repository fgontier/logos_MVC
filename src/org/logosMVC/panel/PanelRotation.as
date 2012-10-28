package org.logosMVC.panel
{
	import com.bit101.components.HRangeSlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.PushButton;
	import com.bit101.components.Style;
	
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Model;
	
	public class PanelRotation extends Sprite
	{
		public var myRotationSlider:HRangeSlider;
		public var labelApple_rotation:Label;
		public var labelMickey_rotation:Label;
		public var labelMarlboro_rotation:Label;
		public var labelNike_rotation:Label;
		public var resetRotationButton:PushButton;
		
		public function PanelRotation(model:Model)
		{
			////////////////////// bit-101:			
			Style.setStyle(Style.DARK);		
			
			// main panel:
			var rotationPanel:Panel = new Panel(this, 0, 0);
			rotationPanel.setSize(142, 155);
			
			// Main label:
			var labelRotation:Label = new Label(rotationPanel, 6, 5, "RANDOM ROTATION");
			labelRotation.textField.textColor = 0xFFAA00;			
			
			// Label:
			labelApple_rotation = new Label(rotationPanel, 14, 25, "APPLE: 0");
			labelMickey_rotation = new Label(rotationPanel, 14, 40, "MICKEY: 0");
			labelMarlboro_rotation = new Label(rotationPanel, 14, 55, "MARLBORO: 0");
			labelNike_rotation = new Label(rotationPanel, 14, 70, "NIKE: 0");
			
			// Range slider:
			myRotationSlider = new HRangeSlider(rotationPanel,14,105);
			myRotationSlider.minimum = -5;
			myRotationSlider.maximum = 5;
			myRotationSlider.highValue = model.minRotation;
			myRotationSlider.lowValue = model.maxRotation;
			myRotationSlider.labelPrecision = 0;
			myRotationSlider.tick = 1;
			
			// Push button:
			resetRotationButton = new PushButton(rotationPanel, 14, 125, "RESET");
			resetRotationButton.width = 110;				
		}
	}
}