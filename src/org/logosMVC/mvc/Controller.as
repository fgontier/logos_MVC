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

		
		// save lifetime to model
		public function passLifetimeEventToController(event:Event):void
		{
			model.lifeTime.minLifetime = event.currentTarget.lowValue;
			model.lifeTime.maxLifetime = event.currentTarget.highValue;
			model.currentUpdatedPanel = "lifetime";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}
		
		// random lifetime
		public function randomLifetime():Number
		{
			return model.lifeTime.minLifetime + Math.random() * (model.lifeTime.maxLifetime - model.lifeTime.minLifetime);
		}
		
		// save colorMode to model
		public function passColorEventToController(event:Event):void
		{
			switch(event.currentTarget.colorMode){
				case "Black":
					model.colorRandomInit4Logos.minColor = 0x000000;
					model.colorRandomInit4Logos.maxColor = 0x000000;
					model.colorRandomInit.minColor = 0x000000;
					model.colorRandomInit.maxColor = 0x000000;
					model.colorCoca_Cola = 0x000000;
					model.colorMac_Donalds = 0x000000;
					model.colorApple = 0x000000;
					model.colorMickey = 0x000000;
					model.colorMarlboro = 0x000000;
					model.colorNike = 0x000000;
					break;
				case "Color":
					model.colorRandomInit4Logos.minColor = 0xFF0000;
					model.colorRandomInit4Logos.maxColor = 0x0000FF;
					model.colorRandomInit.minColor = 0xFF0000;
					model.colorRandomInit.maxColor = 0x0000FF;
					model.colorCoca_Cola = Math.random() * 0xFFFFFF;;
					model.colorMac_Donalds = Math.random() * 0xFFFFFF;;
					model.colorApple = Math.random() * 0xFFFFFF;;
					model.colorMickey = Math.random() * 0xFFFFFF;;
					model.colorMarlboro = Math.random() * 0xFFFFFF;;
					model.colorNike = Math.random() * 0xFFFFFF;;					
					break;	
				case "Cut Out":	
					model.colorRandomInit4Logos.minColor = 0xFFFFFF;
					model.colorRandomInit4Logos.maxColor = 0xFFFFFF;
					model.colorRandomInit.minColor = 0x000000;
					model.colorRandomInit.maxColor = 0x000000;					
					model.colorCoca_Cola = 0x000000;
					model.colorMac_Donalds = 0x000000;
					model.colorApple = 0xFFFFFF;
					model.colorMickey = 0xFFFFFF;
					model.colorMarlboro = 0xFFFFFF;
					model.colorNike = 0xFFFFFF;
					break;
			}		
			model.currentUpdatedPanel = "colorMode";
			model.dispatchEvent(new Event(Event.CHANGE));
		}
		
		// save rotation to model  THIS DOESN'T WORK > ALL VALUES CHANGE AT THE SAME TIME
		public function passRotationEventToController(event:Event):void
		{
			model.rotateVelocity.minAngVelocity = event.currentTarget.lowValue / 100;
			model.rotateVelocity.maxAngVelocity = event.currentTarget.highValue / 100;
			model.currentUpdatedPanel = "rotation";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}	
		
		// random rotate velocity
		public function randomRotateVelocity():Number
		{
			return model.rotateVelocity.minAngVelocity + Math.random() * (model.rotateVelocity.maxAngVelocity - model.rotateVelocity.minAngVelocity);
		}
		
		// dispatch reset rotation to view
		public function passResetRotationEventToController(event:Event):void
		{
			model.currentUpdatedPanel = "reset rotation";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}
		
		// save velocity to model
		public function passVelocityEventToController(event:Event):void
		{

			model.startPointCoca_Cola.y = event.currentTarget.lowValue;
			model.endPointCoca_Cola.y = event.currentTarget.highValue;
			model.lineZoneCoca_Cola.start = model.startPointCoca_Cola;
			model.lineZoneCoca_Cola.end = model.endPointCoca_Cola;
			
			model.startPointMac_Donalds.x = event.currentTarget.lowValue;
			model.endPointMac_Donalds.x = event.currentTarget.highValue;
			model.lineZoneMac_Donalds.start = model.startPointMac_Donalds;
			model.lineZoneMac_Donalds.end = model.endPointMac_Donalds;			
			
			model.currentUpdatedPanel = "velocity";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}		
		
		// save fade to model
		public function passFadeEventToController(event:Event):void
		{			
			model.fade.endAlpha = event.currentTarget.value;  // KINDA WORK FLASH WHEN PARTICLE REVIVES
			model.currentUpdatedPanel = "fade";
			model.dispatchEvent(new Event(Event.CHANGE));			
		}				
		
		// save approch to model:
		public function passApproachEventToController(event:Event):void
		{
			switch(event.target.name){  
				case "approach_acceleration":
					model.approachNeighbours.acceleration = event.target.value / 2;
					break;
				case "approach_maxDistance":
					model.approachNeighbours.maxDistance = event.target.value;
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
					model.scaleAllCoca_Cola.startScale = event.target.value;
					model.currentUpdatedPanel = "scale_Coca_Cola";
					break;
				case "scaleStart_Mac_Donalds":
					model.scaleAllMac_Donalds.startScale = event.target.value;
					model.currentUpdatedPanel = "scale_Mac_Donalds";
					break;
				case "scaleEnd_Mac_Donalds":
					model.scaleAllMac_Donalds.endScale = event.target.value;					
					model.currentUpdatedPanel = "scale_Mac_Donalds";
					break;				
				case "scaleStart_Other_Logos":
					model.scaleOtherLogos.startScale = event.target.value;
					model.currentUpdatedPanel = "scale_Other_Logos";					
					break;
				case "scaleEnd_Other_Logos":
					model.scaleOtherLogos.endScale = event.target.value;
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
							
	}
}



/*
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


// save lifetime to model
public function passLifetimeEventToController(event:Event):void
{
model.lifeTime.minLifetime = event.currentTarget.lowValue;
model.lifeTime.maxLifetime = event.currentTarget.highValue;
model.currentUpdatedPanel = "lifetime";
model.dispatchEvent(new Event(Event.CHANGE));			
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

// save colorMode to model
public function passColorEventToController(event:Event):void
{
switch(event.currentTarget.colorMode){
case "Black":
model.colorRandomInit4Logos.minColor = 0x000000;
model.colorRandomInit4Logos.maxColor = 0x000000;
model.particleApple.color = 0x000000;
model.particleMickey.color = 0x000000;
model.particleMarlboro.color = 0x000000;
model.particleNike.color = 0x000000;
model.colorMode = "Black";
break;
case "Color":
model.colorRandomInit4Logos.minColor  = 0xFF0000;
model.colorRandomInit4Logos.maxColor  = 0x0000FF;
//model.myColorRandomInit.minColor  = 0x0000FF; // see ColorInit class for code change minColor/minColor					
model.particleApple.color = Math.random() * 0xFFFFFF;
model.particleMickey.color = Math.random() * 0xFFFFFF;
model.particleMarlboro.color = Math.random() * 0xFFFFFF;
model.particleNike.color = Math.random() * 0xFFFFFF;
model.colorMode = "Color";
break;	
case "Cut Out":	
model.colorRandomInit4Logos.minColor = 0xFFFFFF;
model.colorRandomInit4Logos.maxColor = 0xFFFFFF;
model.particleApple.color = 0xFFFFFF;
model.particleMickey.color = 0xFFFFFF;
model.particleMarlboro.color = 0xFFFFFF;
model.particleNike.color = 0xFFFFFF;
model.colorMode = "Cut Out";
break;
}		
model.colorMode = event.currentTarget.colorMode;
model.currentUpdatedPanel = "colorMode";
model.dispatchEvent(new Event(Event.CHANGE));
}

}
}

*/