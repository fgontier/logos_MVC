package org.logosMVC.panel
{
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.PushButton;
	
	import flash.display.Sprite;
	import org.logosMVC.mvc.Model;
	
	public class PanelSetting extends Sprite
	{
		public var loadFileButton:PushButton;
		public var saveFileButton:PushButton;
		
		public function PanelSetting(model:Model)
		{
			// main panel:
			var panel:Panel = new Panel(this, 0, 0);
			//panel.setSize(142, 93);
			panel.setSize(142, 138);

			/*
			// Main label:
			var label:Label = new Label(panel, 6, 5, "SETTINGS");
			label.textField.textColor = 0xFFAA00;
			
			// Push button:
			loadFileButton = new PushButton(panel, 14, 32, "LOAD FILE");
			loadFileButton.width = 110;	
			
			// Push button:
			saveFileButton = new PushButton(panel, 14, 62, "SAVE FILE");
			saveFileButton.width = 110;	
			*/
		}
	}
}