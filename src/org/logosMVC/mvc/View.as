package org.logosMVC.mvc
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
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
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void 
		{	
			removeEventListener(Event.ADDED_TO_STAGE, init);

			////////////////////// ADD RESIZE EVENT LISTENER TO STAGE  //////////////////////
			
			stage.addEventListener(Event.RESIZE, stage_resizeHandler);
			
			
			////////////////////// ADD EVENT LISTENER TO MODEL  //////////////////////
			
			model.addEventListener(Event.CHANGE, model_changeHandler);

			
			////////////////////// CREATE OBJECTS  //////////////////////

			myCoca_Cola = new CocaCola(model);
			myCoca_Cola.emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, revivedParticle );			
			addChild(myCoca_Cola);
			
			myMac_Donalds = new MacDonalds(model);
			myMac_Donalds.emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, revivedParticle );			
			addChild(myMac_Donalds);
			
			myAppleMickeyMarlboroNike = new AppleMickeyMarlboroNike(model);
			myAppleMickeyMarlboroNike.emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, revivedParticle );			
			addChild(myAppleMickeyMarlboroNike);
			
			viewPanel = new ViewPanel(model);

			
			////////////////////// ADD EVENT LISTENER TO PANELS  //////////////////////
			
			// lifetime event
			viewPanel.panelLifetime.myLifetimeSlider.addEventListener(Event.CHANGE, lifetimeChangeHandler);
			
			// fade event
			viewPanel.panelFade.fadeEnd.addEventListener(Event.CHANGE, fadeChangeHandler);
			
			// approach neighbours panel
			viewPanel.panelApproachNeighbours.approchAcceleration.addEventListener(Event.CHANGE, approachChangeHandler);
			viewPanel.panelApproachNeighbours.approchMaxDistance.addEventListener(Event.CHANGE, approachChangeHandler);
			
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
		
			// color event
			viewPanel.panelColor.addEventListener("panelColorEvent", colorChangeHandler);
			
			// display event
			viewPanel.panelDisplay.checkboxCoca_Cola_display.addEventListener(MouseEvent.CLICK, displayHandler);
			viewPanel.panelDisplay.checkboxMac_Donalds_display.addEventListener(MouseEvent.CLICK, displayHandler);
			viewPanel.panelDisplay.checkboxOther_Logos_display.addEventListener(MouseEvent.CLICK, displayHandler);
			
			addChild(viewPanel);
			stage_resizeHandler(null);
		}
		
		public function stage_resizeHandler(event:Event):void
		{
			viewPanel.bgdRight.x = stage.stageWidth - 1024;	// align right the right panel
			myMac_Donalds.y = stage.stageHeight - 770;		// align bottom the logo Mac Donalds
			model.wrapAroundBox.right = stage.stageWidth;	// reset the wrap around box right side
			model.wrapAroundBox.bottom = stage.stageHeight;	// reset the wrap around box bottom side
			myCoca_Cola.width = stage.stageWidth + 10;		// reset the Coca Cola width + 10 to go to the edge
			myCoca_Cola.scaleY = myCoca_Cola.scaleX;		// scale the Coca Cola hight proportionaly
		}
		
		////////////////////// SAVE EVENTS FROM PANELS TO THE CONTROLLER //////////////////////
	
		protected function approachChangeHandler(event:Event):void
		{
			controller.passApproachEventToController(event); //save approch to controller
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
			controller.passResetRotationEventToController(event); //save reset rotation to controller
		}
		
		protected function rotationChangeHandler(event:Event):void
		{
			controller.passRotationEventToController(event); //save rotation to controller
		}
				
		protected function colorChangeHandler(event:Event):void
		{	
			controller.passColorEventToController(event); //save color to controller
		}
						
		protected function lifetimeChangeHandler(event:Event):void
		{
			controller.passLifetimeEventToController(event); //save lifetime to controller
		}
		
		protected function fadeChangeHandler(event:Event):void
		{
			controller.passFadeEventToController(event); //save fade to controller
		}

		
		////////////////////// UPDATE PANELS AFTER LOADING SAVED CONFIG FILE //////////////////////
		
		protected function configEventHander(event:Event):void
		{
			// fucked up way to update the range slider but it works 
			// can't change both value at the same time because of CHANGE event > remove/add event listener
			viewPanel.panelLifetime.myLifetimeSlider.removeEventListener(Event.CHANGE, lifetimeChangeHandler);
			viewPanel.panelLifetime.myLifetimeSlider.lowValue = model.lifeTime.minLifetime;
			viewPanel.panelLifetime.myLifetimeSlider.addEventListener(Event.CHANGE, lifetimeChangeHandler);
			viewPanel.panelLifetime.myLifetimeSlider.highValue = model.lifeTime.maxLifetime;
			
			// display
			viewPanel.panelDisplay.checkboxCoca_Cola_display.selected = model.displayCoca_Cola;
			viewPanel.panelDisplay.checkboxMac_Donalds_display.selected = model.displayMac_Donalds;
			viewPanel.panelDisplay.checkboxOther_Logos_display.selected = model.displayOther_Logos;
			myCoca_Cola.setDisplay();
			myMac_Donalds.setDisplay();
			myAppleMickeyMarlboroNike.setDisplay();	
			
			// color
			viewPanel.panelColor.radioButtonGreyMode.selected = model.radioButtonGreyMode;
			viewPanel.panelColor.radioButtonColorMode.selected = model.radioButtonColorMode;
			viewPanel.panelColor.radioButtonCutOutMode.selected = model.radioButtonCutOutMode;
			controller.changeColor();
			
			// rotation
			viewPanel.panelRotation.myRotationSlider.removeEventListener(Event.CHANGE, rotationChangeHandler);
			viewPanel.panelRotation.myRotationSlider.highValue = 5;

			viewPanel.panelRotation.myRotationSlider.lowValue = model.rotateVelocity.minAngVelocity *100;
			viewPanel.panelRotation.myRotationSlider.addEventListener(Event.CHANGE, rotationChangeHandler);
			viewPanel.panelRotation.myRotationSlider.highValue = model.rotateVelocity.maxAngVelocity *100;	
		}

		
		////////////////////// REVIVE A PARTICLE AFTER IT DIED //////////////////////
		
		protected function revivedParticle(event:ParticleEvent):void
		{	
			event.particle.revive();
			event.target.addParticle(Particle2D(event.particle), true);
			updatePanels(Particle2D(event.particle));
		}
		
		
		////////////////////// UPDATE PANELS AFTER A PARTICLE IS REVIVED //////////////////////

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

		
		////////////////////// UPDATE PARTICLES AND PANELS TEXT AFTER CHANGE ON PANEL //////////////////////
		
		protected function model_changeHandler(event:Event):void
		{	
			switch(model.currentUpdatedPanel){
				
				case "lifetime":
					myCoca_Cola.emitter.particles[0].lifetime = controller.randomLifetime();
					myMac_Donalds.emitter.particles[0].lifetime = controller.randomLifetime();
					myAppleMickeyMarlboroNike.emitter.particles[0].lifetime = controller.randomLifetime();
					myAppleMickeyMarlboroNike.emitter.particles[1].lifetime = controller.randomLifetime();
					myAppleMickeyMarlboroNike.emitter.particles[2].lifetime = controller.randomLifetime();
					myAppleMickeyMarlboroNike.emitter.particles[3].lifetime = controller.randomLifetime();
					// update lifetime panel
					viewPanel.panelLifetime.labelCoca_Cola_lifetime.text = "COCA COLA: " + myAppleMickeyMarlboroNike.emitter.particles[0].lifetime.toFixed() + " seconds";
					viewPanel.panelLifetime.labelMac_Donalds_lifetime.text = "MAC DONALDS: " + myMac_Donalds.emitter.particles[0].lifetime.toFixed() + " seconds";
					viewPanel.panelLifetime.labelApple_lifetime.text = "APPLE: " + myAppleMickeyMarlboroNike.emitter.particles[0].lifetime.toFixed() + " seconds";
					viewPanel.panelLifetime.labelMickey_lifetime.text = "MICKEY: " + myAppleMickeyMarlboroNike.emitter.particles[1].lifetime.toFixed() + " seconds";
					viewPanel.panelLifetime.labelMarlboro_lifetime.text = "MARLBORO: " + myAppleMickeyMarlboroNike.emitter.particles[2].lifetime.toFixed() + " seconds";
					viewPanel.panelLifetime.labelNike_lifetime.text = "NIKE: " + myAppleMickeyMarlboroNike.emitter.particles[3].lifetime.toFixed() + " seconds";
					break;
				
				case "colorMode":
					myCoca_Cola.emitter.particles[0].color = model.colorCoca_Cola;
					myMac_Donalds.emitter.particles[0].color = model.colorMac_Donalds;
					myAppleMickeyMarlboroNike.emitter.particles[0].color = model.colorApple;
					myAppleMickeyMarlboroNike.emitter.particles[1].color = model.colorMickey;
					myAppleMickeyMarlboroNike.emitter.particles[2].color = model.colorMarlboro;
					myAppleMickeyMarlboroNike.emitter.particles[3].color = model.colorNike;					
					updatePanelsAllParticles();
					break;
				
				case "rotation":
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[0]).angVelocity = controller.randomRotateVelocity();
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[1]).angVelocity = controller.randomRotateVelocity();
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[2]).angVelocity = controller.randomRotateVelocity();
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[3]).angVelocity = controller.randomRotateVelocity();
					// update panel rotation
					viewPanel.panelRotation.labelApple_rotation.text = "APPLE: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[0]).angVelocity * 100 ).toFixed();
					viewPanel.panelRotation.labelMickey_rotation.text = "MICKEY: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[1]).angVelocity * 100 ).toFixed();
					viewPanel.panelRotation.labelMarlboro_rotation.text = "MARLBORO: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[2]).angVelocity * 100 ).toFixed();					
					viewPanel.panelRotation.labelNike_rotation.text = "NIKE: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[3]).angVelocity * 100 ).toFixed();					
					break;				

				case "reset rotation":
					// reset rotation
					myAppleMickeyMarlboroNike.resetRotation();

					viewPanel.panelRotation.myRotationSlider.removeEventListener(Event.CHANGE, rotationChangeHandler);
					viewPanel.panelRotation.myRotationSlider.highValue = 5;
					viewPanel.panelRotation.myRotationSlider.lowValue = 0;
					viewPanel.panelRotation.myRotationSlider.highValue = 0;
					viewPanel.panelRotation.myRotationSlider.addEventListener(Event.CHANGE, rotationChangeHandler);
					
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[0]).angVelocity = 0;
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[1]).angVelocity = 0;
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[2]).angVelocity = 0;
					Particle2D(myAppleMickeyMarlboroNike.emitter.particles[3]).angVelocity = 0;
					// update panel rotation
					viewPanel.panelRotation.labelApple_rotation.text = "APPLE: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[0]).angVelocity * 100 ).toFixed();
					viewPanel.panelRotation.labelMickey_rotation.text = "MICKEY: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[1]).angVelocity * 100 ).toFixed();
					viewPanel.panelRotation.labelMarlboro_rotation.text = "MARLBORO: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[2]).angVelocity * 100 ).toFixed();					
					viewPanel.panelRotation.labelNike_rotation.text = "NIKE: " + (Particle2D(myAppleMickeyMarlboroNike.emitter.particles[3]).angVelocity * 100 ).toFixed();
					break;
				
				case "velocity":
					Particle2D(myCoca_Cola.emitter.particles[0]).velY = model.lineZoneCoca_Cola.getLocation().y;
					Particle2D(myMac_Donalds.emitter.particles[0]).velX = model.lineZoneMac_Donalds.getLocation().x;		
					updatePanels(Particle2D(myCoca_Cola.emitter.particles[0]))
					updatePanels(Particle2D(myMac_Donalds.emitter.particles[0]))
					break;

				case "display":
					myCoca_Cola.setDisplay();
					myMac_Donalds.setDisplay();
					myAppleMickeyMarlboroNike.setDisplay();					
					break;				
			}							
		}
		
		protected function updatePanelsAllParticles():void
		{
			updatePanels(Particle2D(myCoca_Cola.emitter.particles[0]));
			updatePanels(Particle2D(myMac_Donalds.emitter.particles[0]));
			updatePanels(Particle2D(myAppleMickeyMarlboroNike.emitter.particles[0]));
			updatePanels(Particle2D(myAppleMickeyMarlboroNike.emitter.particles[1]));
			updatePanels(Particle2D(myAppleMickeyMarlboroNike.emitter.particles[2]));
			updatePanels(Particle2D(myAppleMickeyMarlboroNike.emitter.particles[3]));			
		}
		
		
	}
}