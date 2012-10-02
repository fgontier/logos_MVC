package org.logosMVC.mvc
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import org.flintparticles.common.events.*;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.particles.Particle;
	import org.flintparticles.twoD.particles.Particle2D;
	import org.logosMVC.logo.AppleMickeyMarlboroNike;
	import org.logosMVC.logo.CocaCola;
	import org.logosMVC.logo.MacDonalds;
	
	public class View extends Sprite
	{
		private var model:Model;
		private var controller:Controller;
		
		public var myCoca_Cola:CocaCola;
		public var myMac_Donalds:MacDonalds;
		public var myAppleMickeyMarlboroNike:AppleMickeyMarlboroNike;
		
		public var viewPanel:ViewPanel;
		
		public function View(model:Model, controller:Controller)
		{
			this.model = model;
			this.controller = controller;
			
			model.addEventListener(Event.CHANGE, model_changeHandler);
			
			
			myCoca_Cola = new CocaCola(model);
			myCoca_Cola.emitterCoca_Cola.addEventListener( ParticleEvent.PARTICLE_DEAD, revivedParticle );			
			addChild(myCoca_Cola);
			myMac_Donalds = new MacDonalds(model);
			myMac_Donalds.emitterMac_Donalds.addEventListener( ParticleEvent.PARTICLE_DEAD, revivedParticle );			
			addChild(myMac_Donalds);			
			myAppleMickeyMarlboroNike = new AppleMickeyMarlboroNike(model);
			myAppleMickeyMarlboroNike.emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, revivedParticle );			
			addChild(myAppleMickeyMarlboroNike);
			
			viewPanel = new ViewPanel(model);
			
			// approch neighbours panel
			viewPanel.panelApproachNeighbours.approchAcceleration.addEventListener(Event.CHANGE, approchChangeHandler);
			viewPanel.panelApproachNeighbours.approchMaxDistance.addEventListener(Event.CHANGE, approchChangeHandler);
			
			// scale event
			viewPanel.panelScaleCoca_Cola.scaleStart.addEventListener(Event.CHANGE, scaleChangeHandler);
			viewPanel.panelScaleMac_Donalds.scaleStart.addEventListener(Event.CHANGE, scaleChangeHandler);
			viewPanel.panelScaleMac_Donalds.scaleEnd.addEventListener(Event.CHANGE, scaleChangeHandler)
			viewPanel.panelScaleOther_Logos.scaleStart.addEventListener(Event.CHANGE, scaleChangeHandler);
			viewPanel.panelScaleOther_Logos.scaleEnd.addEventListener(Event.CHANGE, scaleChangeHandler);

			// velocity event
			viewPanel.panelVelocity.myVelocitySlider.addEventListener(Event.CHANGE, velocityChangeHandler);
			
			// rotation event
			viewPanel.panelRotation.myRotationSlider.addEventListener(Event.CHANGE, rotationChangeHandler);
			viewPanel.panelRotation.resetRotationButton.addEventListener(MouseEvent.CLICK, resetRotationHandler);
			
			// lifetime event
			viewPanel.panelLifetime.myLifetimeSlider.addEventListener(Event.CHANGE, lifetimeChangeHandler);
			
			// color event
			viewPanel.panelColor.addEventListener("panelColorEvent", colorChangeHandler);
			
			// display event
			viewPanel.panelDisplay.checkboxCoca_Cola_display.addEventListener(MouseEvent.CLICK, displayHandler);
			viewPanel.panelDisplay.checkboxMac_Donalds_display.addEventListener(MouseEvent.CLICK, displayHandler);
			viewPanel.panelDisplay.checkboxOther_Logos_display.addEventListener(MouseEvent.CLICK, displayHandler);
			
			addChild(viewPanel);
			
		}
		
		protected function approchChangeHandler(event:Event):void
		{
			controller.passApprochEventToController(event); //save approch  to controller
		}
		
		
		protected function scaleChangeHandler(event:Event):void
		{
			controller.passScaleEventToController(event); //save scale start to controller
		}
		
		protected function displayHandler(event:MouseEvent):void
		{
			controller.passDisplayEventToController(event); //save display to controller
		}
		
		protected function velocityChangeHandler(event:Event):void
		{
			controller.passVelocityEventToController(event); //save velocity to controller
		}
		
		protected function resetRotationHandler(event:MouseEvent):void
		{
			controller.passResetRotationEventToController(event); //save reset color to controller
		}
		
		protected function rotationChangeHandler(event:Event):void
		{
			controller.passRotationEventToController(event); //save color to controller
		}
				
		protected function colorChangeHandler(event:Event):void
		{	
			controller.passColorEventToController(event); //save color to controller
		}
						
		protected function lifetimeChangeHandler(event:Event):void
		{
			controller.passLifetimeEventToController(event); //save lifetime to controller
		}

		
		
		
		protected function revivedParticle(event:ParticleEvent):void
		{	
			event.particle.revive();
			event.target.addParticle(Particle2D(event.particle), true);
			updatePanels(Particle2D(event.particle));
		}
		
		protected function updatePanels(updatedParticle:Particle2D):void
		{	
			// Get the name of the updated particle and update the panels:
			switch(updatedParticle.dictionary.name){
				case "Coca_Cola":
					viewPanel.panelLifetime.labelCoca_Cola_lifetime.text = "COCA COLA: " + updatedParticle.lifetime.toFixed() + " seconds";
					viewPanel.panelColor.colorChooser_Coco_Cola.value = updatedParticle.color;
					viewPanel.panelVelocity.labelCoca_Cola_velocity.text = "COCA COCA: " + updatedParticle.velY.toFixed(); 
					break;
				case "Mac_Donalds":
					viewPanel.panelLifetime.labelMac_Donalds_lifetime.text = "MAC DONALDS: " + updatedParticle.lifetime.toFixed() + " seconds";
					viewPanel.panelColor.colorChooser_Mac_Donalds.value = updatedParticle.color;
					viewPanel.panelVelocity.labelMac_Donalds_velocity.text = "MAC DONALDS: " + updatedParticle.velX.toFixed(); 					
					break;				
				case "Apple":
					viewPanel.panelLifetime.labelApple_lifetime.text = "APPLE: " + updatedParticle.lifetime.toFixed() + " seconds";
					viewPanel.panelColor.colorChooser_Apple.value = updatedParticle.color;	
					viewPanel.panelRotation.labelApple_rotation.text = "APPLE: " + (updatedParticle.angVelocity * 100 ).toFixed();
					break;
				case "Mickey":
					viewPanel.panelLifetime.labelMickey_lifetime.text = "MICKEY: " + updatedParticle.lifetime.toFixed() + " seconds";
					viewPanel.panelColor.colorChooser_Mickey.value = updatedParticle.color;
					viewPanel.panelRotation.labelMickey_rotation.text = "MICKEY: " + (updatedParticle.angVelocity * 100 ).toFixed();
					break;
				case "Marlboro":
					viewPanel.panelLifetime.labelMarlboro_lifetime.text = "MARLBORO: " + updatedParticle.lifetime.toFixed() + " seconds";
					viewPanel.panelColor.colorChooser_Marlboro.value = updatedParticle.color;					
					viewPanel.panelRotation.labelMarlboro_rotation.text = "MARLBORO: " + (updatedParticle.angVelocity * 100 ).toFixed();					
					break;
				case "Nike":
					viewPanel.panelLifetime.labelNike_lifetime.text = "NIKE: " + updatedParticle.lifetime.toFixed() + " seconds";
					viewPanel.panelColor.colorChooser_Nike.value = updatedParticle.color;	
					viewPanel.panelRotation.labelNike_rotation.text = "NIKE: " + (updatedParticle.angVelocity * 100 ).toFixed();					
					break;			
			}
		}		
		
		
		protected function model_changeHandler(event:Event):void
		{
			
			switch(model.currentUpdatedPanel){
				case "approch":
					myAppleMickeyMarlboroNike.setApproch();
					reviveOther_LogosAfterModelChange();
					break;			
				case "scale_Coca_Cola":					
					myCoca_Cola.setScale();
					myCoca_Cola.emitterCoca_Cola.particles[0].revive();					
					break;				
				case "scale_Mac_Donalds":
					myMac_Donalds.setScale();
					myMac_Donalds.emitterMac_Donalds.particles[0].revive();
					break;
				case "scale_Other_Logos":
					myAppleMickeyMarlboroNike.setScale();					
					reviveOther_LogosAfterModelChange();					
					break;							
				case "lifetime":					
					myCoca_Cola.setLifetime();
					myMac_Donalds.setLifetime();
					myAppleMickeyMarlboroNike.setLifetime();
					reviveCoca_Cola_Mac_DonaldsAfterModelChange();
					reviveOther_LogosAfterModelChange();
					break;
				case "colorMode":
					myCoca_Cola.setColor();
					myMac_Donalds.setColor();
					myAppleMickeyMarlboroNike.setColor();
					reviveCoca_Cola_Mac_DonaldsAfterModelChange();
					reviveOther_LogosAfterModelChange();
					break;
				case "rotation":
					myAppleMickeyMarlboroNike.setRotation();
					reviveOther_LogosAfterModelChange();
					break;
				case "reset rotation":
					myAppleMickeyMarlboroNike.resetRotation();
					viewPanel.panelRotation.myRotationSlider.highValue = 0;
					viewPanel.panelRotation.myRotationSlider.lowValue = 0;
					break;
				case "velocity":
					myCoca_Cola.setVelocity();
					myMac_Donalds.setVelocity();
					reviveCoca_Cola_Mac_DonaldsAfterModelChange();
					break;
				case "display":
					myCoca_Cola.setDisplay();
					myMac_Donalds.setDisplay();
					myAppleMickeyMarlboroNike.setDisplay();					
					break;				
			}			
				
		}
		
		protected function reviveCoca_Cola_Mac_DonaldsAfterModelChange():void
		{
			// revive Coca Cola and Mac donalds particles for instant update
			myCoca_Cola.emitterCoca_Cola.particles[0].revive();
			myMac_Donalds.emitterMac_Donalds.particles[0].revive();			
		}
		
		protected function reviveOther_LogosAfterModelChange():void
		{
			// revive other logos particles for instant update
			myAppleMickeyMarlboroNike.emitter.particles[0].revive();
			myAppleMickeyMarlboroNike.emitter.particles[1].revive();
			myAppleMickeyMarlboroNike.emitter.particles[2].revive();
			myAppleMickeyMarlboroNike.emitter.particles[3].revive();			
		}
	}
}