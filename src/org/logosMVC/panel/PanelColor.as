package org.logosMVC.panel
{
	import com.bit101.components.ColorChooser;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.RadioButton;
	import com.bit101.components.Style;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
//	import org.flintparticles.twoD.particles.Particle2D;
	import org.logosMVC.mvc.Model;

	public class PanelColor extends Sprite
	{
		public var colorMode:String;
		
		public var colorChooser_Coco_Cola:ColorChooser;
		public var colorChooser_Mac_Donalds:ColorChooser;
		public var colorChooser_Apple:ColorChooser;
		public var colorChooser_Mickey:ColorChooser;
		public var colorChooser_Marlboro:ColorChooser;
		public var colorChooser_Nike:ColorChooser;
		
		public var radioButtonGreyMode:RadioButton;
		public var radioButtonColorMode:RadioButton;		
		public var radioButtonCutOutMode:RadioButton;		
		
		public function PanelColor()
		{
			
		////////////////////// bit-101:			
		Style.setStyle(Style.DARK);
		
		// main panel:
		var colorPanel:Panel = new Panel(this, 0, 0);
		colorPanel.setSize(142, 175);
		
		// Main label:
		var labelColor:Label = new Label(colorPanel, 6, 5, "RANDOM COLOR");
		labelColor.textField.textColor = 0xFFAA00;
		
		var labelCoca_Cola_color:Label = new Label(colorPanel, 15, 27, "COCA COLA");
		colorChooser_Coco_Cola = new ColorChooser(colorPanel, 72, 27, 0x000000);
		var labelMac_Donalds_color:Label = new Label(colorPanel, 2, 47, "MAC DONALDS");
		colorChooser_Mac_Donalds = new ColorChooser(colorPanel, 72, 47, 0x000000);
		var labelApple_color:Label = new Label(colorPanel, 36, 67, "APPLE");
		colorChooser_Apple = new ColorChooser(colorPanel, 72, 67, 0x000000)
		var labelMickey_color:Label = new Label(colorPanel, 30, 87, "MICKEY");
		colorChooser_Mickey = new ColorChooser(colorPanel, 72, 87, 0x000000);
		var labelMarlboro_color:Label = new Label(colorPanel, 15, 107, "MARLBORO");
		colorChooser_Marlboro = new ColorChooser(colorPanel, 72, 107, 0x000000);
		var labelNike_color:Label = new Label(colorPanel, 45, 127, "NIKE");
		colorChooser_Nike = new ColorChooser(colorPanel, 72, 127, 0x000000);
		
		// Radio buttons:
		radioButtonGreyMode = new RadioButton(colorPanel, 6, 155, "Black", true, radioButtonHandler);
		radioButtonColorMode = new RadioButton(colorPanel, 48, 155, "Color", false, radioButtonHandler);
		radioButtonCutOutMode = new RadioButton(colorPanel, 91, 155, "Cut Out", false, radioButtonHandler);
		}

		private function radioButtonHandler(event:MouseEvent):void
		{	
			colorMode = event.currentTarget.label;
			dispatchEvent(new Event("panelColorEvent",true,false))
		}
	}
}