package org.logosMVC.panel
{
	import com.bit101.components.CheckBox;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	
	import flash.display.Sprite;
	
	import org.logosMVC.mvc.Model;

	public class PanelDisplay extends Sprite
	{
		public var checkboxCoca_Cola_display:CheckBox;
		public var checkboxMac_Donalds_display:CheckBox;
		public var checkboxOther_Logos_display:CheckBox;
		
		public function PanelDisplay(model:Model)
		{
			////////////////////// bit-101:			
			//Style.setStyle(Style.DARK);
			
			// main panel:
			var displayPanel:Panel = new Panel(this, 0, 0);
			displayPanel.setSize(142, 85);
			
			// Main label:
			var labelVelocity:Label = new Label(displayPanel, 6, 5, "DISPLAY");
			labelVelocity.textField.textColor = 0xFFAA00;
			
			checkboxCoca_Cola_display = new CheckBox(displayPanel, 20, 29, " COCA COLA");
			checkboxCoca_Cola_display.name = "checkboxCoca_Cola_display";
			checkboxCoca_Cola_display.selected = model.displayCoca_Cola;
			checkboxMac_Donalds_display = new CheckBox(displayPanel, 20, 45, " MAC DONALDS");
			checkboxMac_Donalds_display.name = "checkboxMac_Donalds_display";			
			checkboxMac_Donalds_display.selected = model.displayMac_Donalds;			
			checkboxOther_Logos_display = new CheckBox(displayPanel, 20, 61, " OTHER LOGOS");
			checkboxOther_Logos_display.name = "checkboxOther_Logos_display";
			checkboxOther_Logos_display.selected = model.displayOther_Logos;							
		}
	}
}