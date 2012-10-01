package org.logosMVC.panel
{
	import com.bit101.components.HRangeSlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.Style;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import org.logosMVC.mvc.Model;
	
	public class PanelLifetime extends Sprite
	{
		public var myLifetimeSlider:HRangeSlider;

		public var labelCoca_Cola_lifetime:Label;
		public var labelMac_Donalds_lifetime:Label;
		public var labelApple_lifetime:Label;
		public var labelMickey_lifetime:Label;
		public var labelMarlboro_lifetime:Label;
		public var labelNike_lifetime:Label;		
				
		public function PanelLifetime(model:Model)
		{
			////////////////////// bit-101:			
			Style.setStyle(Style.DARK);
			
			// main panel:
			var lifetimePanel:Panel = new Panel(this, 0, 0);
			lifetimePanel.setSize(142, 155);
			
			// Main label:
			var labelLifetime:Label = new Label(lifetimePanel, 6, 5, "RANDOM LIFETIME");
			labelLifetime.textField.textColor = 0xFFAA00;
			
			// Labels:
			labelCoca_Cola_lifetime = new Label(lifetimePanel, 14, 25, "COCA COLA");
			labelMac_Donalds_lifetime = new Label(lifetimePanel, 14, 40, "MAC DONALDS");
			labelApple_lifetime = new Label(lifetimePanel, 14, 55, "APPLE");
			labelMickey_lifetime = new Label(lifetimePanel, 14, 70, "MICKEY");
			labelMarlboro_lifetime = new Label(lifetimePanel, 14, 85, "MARLBORO");
			labelNike_lifetime = new Label(lifetimePanel, 14, 100, "NIKE");	

			// Range Slider:
			myLifetimeSlider = new HRangeSlider(lifetimePanel,14,135);
			myLifetimeSlider.tag = 1;
			myLifetimeSlider.minimum = 1;
			myLifetimeSlider.maximum = 600;
			myLifetimeSlider.lowValue = model.minLifetime;
			myLifetimeSlider.highValue = model.maxLifetime;		
			myLifetimeSlider.tick = 1;
			myLifetimeSlider.labelPrecision = 0;
			myLifetimeSlider.name = "lifetimeSlider";
		}
		
	}
}