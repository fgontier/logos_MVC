package org.logosMVC.mvc
{
	import com.greensock.*;
	import com.greensock.plugins.*;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.logosMVC.panel.PanelApproachNeighbours;
	import org.logosMVC.panel.PanelColor;
	import org.logosMVC.panel.PanelDisplay;
	import org.logosMVC.panel.PanelLifetime;
	import org.logosMVC.panel.PanelRotation;
	import org.logosMVC.panel.PanelScaleCoca_Cola;
	import org.logosMVC.panel.PanelScaleMac_Donalds;
	import org.logosMVC.panel.PanelVelocity;
	import org.logosMVC.panel.PanelScaleOtherLogos;
	
	public class ViewPanel extends Sprite
	{
		
		public var panelLifetime:PanelLifetime;
		public var panelColor:PanelColor;
		public var panelRotation:PanelRotation;
		public var panelVelocity:PanelVelocity;
		public var panelDisplay:PanelDisplay;
		public var panelApproachNeighbours:PanelApproachNeighbours;
		public var panelScaleCoca_Cola:PanelScaleCoca_Cola;
		public var panelScaleMac_Donalds:PanelScaleMac_Donalds;
		public var panelScaleOther_Logos:PanelScaleOtherLogos;
		
		public function ViewPanel(model:Model)
		{
			TweenPlugin.activate([AutoAlphaPlugin]);			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			////////////////////// background left		
			var bgdLeft:Shape = new Shape;
			bgdLeft.graphics.beginFill(0x000000);
			bgdLeft.graphics.drawRect(0,0,154,768);
			bgdLeft.graphics.endFill();
			addChild(bgdLeft);
			
			////////////////////// monitor			
			var mymovieMonitor:movieMonitor = new movieMonitor();
			mymovieMonitor.x = 5;
			mymovieMonitor.y = 5;
			addChild(mymovieMonitor);
			
			////////////////////// lifetime			
			panelLifetime = new PanelLifetime(model);
			panelLifetime.x = 6;
			panelLifetime.y = 160;
			addChild(panelLifetime);
			
			////////////////////// color			
			panelColor = new PanelColor();
			panelColor.x = 6;
			panelColor.y = 320;
			addChild(panelColor);
		
			////////////////////// rotation			
			panelRotation = new PanelRotation(model);
			panelRotation.x = 6;
			panelRotation.y = 500;
			addChild(panelRotation);
						
			////////////////////// velocity			
			panelVelocity = new PanelVelocity(model);
			panelVelocity.x = 6;		//			myPanelVelocity.x = 156;
			panelVelocity.y = 660;		//			myPanelVelocity.y = 500;
			addChild(panelVelocity);
			
			
			////////////////////// background right		
			var bgdRight:Shape = new Shape;
			bgdRight.graphics.beginFill(0x000000);
			bgdRight.graphics.drawRect(870,0,154,768);
			bgdRight.graphics.endFill();
			addChild(bgdRight);			
			
			////////////////////// display			
			panelDisplay = new PanelDisplay(model);
			panelDisplay.x = 875;
			panelDisplay.y = 4;
			addChild(panelDisplay);			

			////////////////////// scale Coca Cola			
			panelScaleCoca_Cola = new PanelScaleCoca_Cola(model);
			panelScaleCoca_Cola.x = 875;
			panelScaleCoca_Cola.y = 94;
			addChild(panelScaleCoca_Cola);
			
			////////////////////// scale Mac Donalds			
			panelScaleMac_Donalds = new PanelScaleMac_Donalds(model);
			panelScaleMac_Donalds.x = 875;
			panelScaleMac_Donalds.y = 176;
			addChild(panelScaleMac_Donalds);
			
			////////////////////// scale Other Logos			
			panelScaleOther_Logos = new PanelScaleOtherLogos(model);
			panelScaleOther_Logos.x = 875;
			panelScaleOther_Logos.y = 296;
			addChild(panelScaleOther_Logos);
			
			////////////////////// approachNeighbours			
			panelApproachNeighbours = new PanelApproachNeighbours();
			panelApproachNeighbours.x = 875;
			panelApproachNeighbours.y = 416;
			addChild(panelApproachNeighbours);			
		}	
		
		
		protected function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener (Event.MOUSE_LEAVE, leaveHandler); // show/hide the control panel:
		}
		
		protected function leaveHandler(event:Event):void
		{
			TweenLite.to( this, .5, {autoAlpha:0});
			stage.addEventListener (MouseEvent.MOUSE_MOVE, returnHandler);
		}
		
		protected function returnHandler(event:Event):void
		{
			TweenLite.to( this, .5, {autoAlpha:1});
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, returnHandler);
		}
	}
}