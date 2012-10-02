package org.logosMVC.mvc
{
//	import org.flintparticles.common.initializers.Lifetime;
//	import org.flintparticles.twoD.particles.Particle2D;
	import flash.events.*;
	
	import org.flintparticles.common.events.ParticleEvent;

	
	public class Controller
	{
		private var model:Model;

		public function Controller(model:Model)
		{
			this.model = model;
		}	

		// save approch to model:
		public function passApprochEventToController(event:Event):void
		{
			switch(event.target.name){  
				case "approch_acceleration":
					model.approchAcceleration = event.target.value; 
					break;
				case "approch_maxDistance":
					model.approchMaxDistance = event.target.value;
					break;
				case "scaleEnd_Mac_Donalds":
					model.scaleEndMac_Donalds = event.target.value;
					break;				
				case "scaleStart_Other_Logos":
					model.scaleStartOther_Logos = event.target.value;
					break;
				case "scaleEnd_Other_Logos":
					model.scaleEndOther_Logos = event.target.value;
					break;				
			}
			model.currentUpdatedPanel = "approch";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}
		
		// save scale to model:
		public function passScaleEventToController(event:Event):void
		{
			switch(event.target.name){  
				case "scaleStart_Coca_Cola":
					model.scaleStartCoca_Cola = event.target.value;
					model.currentUpdatedPanel = "scale_Coca_Cola";
					break;
				case "scaleStart_Mac_Donalds":
					model.scaleStartMac_Donalds = event.target.value;
					model.currentUpdatedPanel = "scale_Mac_Donalds";
					break;
				case "scaleEnd_Mac_Donalds":
					model.scaleEndMac_Donalds = event.target.value;
					model.currentUpdatedPanel = "scale_Mac_Donalds";
					break;				
				case "scaleStart_Other_Logos":
					model.scaleStartOther_Logos = event.target.value;
					model.currentUpdatedPanel = "scale_Other_Logos";					
					break;
				case "scaleEnd_Other_Logos":
					model.scaleEndOther_Logos = event.target.value;
					model.currentUpdatedPanel = "scale_Other_Logos";					
					break;				
			}
			model.dispatchEvent(new Event(Event.CHANGE));			
		}
		
		// save display to model:
		public function passDisplayEventToController(event:Event):void
		{
			switch(event.target.name){
				case "checkboxCoca_Cola_display":
					model.displayCoca_Cola = event.target.selected; 
					break;
				case "checkboxMac_Donalds_display":
					model.displayMac_Donalds = event.target.selected; 					
					break;				
				case "checkboxOther_Logos_display":
					model.displayOther_Logos = event.target.selected; 					
					break;				
			}			
			model.currentUpdatedPanel = "display";
			model.dispatchEvent(new Event(Event.CHANGE));	
		}
		// save velocity to model
		public function passVelocityEventToController(event:Event):void
		{
			model.minVelocity = event.currentTarget.lowValue;		
			model.maxVelocity = event.currentTarget.highValue;
			model.currentUpdatedPanel = "velocity";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}		
		// dispatch reset rotation to view
		public function passResetRotationEventToController(event:Event):void
		{
			model.currentUpdatedPanel = "reset rotation";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}		
		// save rotation to model
		public function passRotationEventToController(event:Event):void
		{
			model.minRotation = event.currentTarget.lowValue;
			model.maxRotation = event.currentTarget.highValue;
			model.currentUpdatedPanel = "rotation";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}	
		// save lifetime to model
		public function passLifetimeEventToController(event:Event):void
		{
			model.minLifetime = event.currentTarget.lowValue;
			model.maxLifetime = event.currentTarget.highValue;
			model.currentUpdatedPanel = "lifetime";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}
		// save colorMode to model
		public function passColorEventToController(event:Event):void
		{	
			model.colorMode = event.currentTarget.colorMode;
			model.currentUpdatedPanel = "colorMode";
			model.dispatchEvent(new Event(Event.CHANGE));
		}
			
	}
}