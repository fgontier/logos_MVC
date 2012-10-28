package org.logosMVC.panel
{
	import com.bit101.components.HUISlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	
	import flash.display.Sprite;
	
	public class PanelApproachNeighbours extends Sprite
	{
		public var approchAcceleration:HUISlider;
		public var approchMaxDistance:HUISlider;
		
		public function PanelApproachNeighbours()
		{
			// main panel:
			var approachNeighboursPanel:Panel = new Panel(this, 0, 0);
			approachNeighboursPanel.setSize(142, 135);

			// Main label:
			var label:Label = new Label(approachNeighboursPanel, 6, 5, "APPROACH NEIGHBOURS");
			var label1:Label = new Label(approachNeighboursPanel, 6, 17, "APPLE MICKEY MARLBORO"); 
			var label2:Label = new Label(approachNeighboursPanel, 6, 28, "NIKE"); 
			label.textField.textColor = label1.textField.textColor = label2.textField.textColor = 0xFFAA00;
		
			// acceleration slider:
			var labelMaxDistance:Label = new Label(approachNeighboursPanel, 14, 45, "MAX DISTANCE");
			approchMaxDistance = new HUISlider(approachNeighboursPanel, 5, 65);
			approchMaxDistance.width = 160;
			approchMaxDistance.maximum = 2000;
			approchMaxDistance.tick = 10;
			approchMaxDistance.labelPrecision = 0;
			approchMaxDistance.name = "approach_maxDistance";
			addChild(approchMaxDistance);
			
			// acceleration slider:
			var labelAcceleration:Label = new Label(approachNeighboursPanel, 14, 85, "ACCELERATION");
			approchAcceleration = new HUISlider(approachNeighboursPanel, 5, 105);
			approchAcceleration.width = 160;
			approchAcceleration.maximum = 1;
			approchAcceleration.tick = 0.1;
			approchAcceleration.labelPrecision = 1;
			approchAcceleration.name = "approach_acceleration";
			addChild(approchAcceleration);
		}
	}
}