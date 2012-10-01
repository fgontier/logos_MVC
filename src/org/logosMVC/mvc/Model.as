package org.logosMVC.mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.flintparticles.twoD.particles.Particle2D;
	
	public class Model extends EventDispatcher
	{
		// lifetime
		public var minLifetime:Number = 5;
		public var maxLifetime:Number = 15;
		
		// velocity
		public var minVelocity:Number = 0;
		public var maxVelocity:Number = 0;
		
		// color
		public var colorMode:String  = "black";  // TODO call this value in colorPanel by default
		
		// rotation
		public var minRotation:Number = 0;
		public var maxRotation:Number = 0;
		
		// display
		public var displayCoca_Cola:Boolean = true;
		public var displayMac_Donalds:Boolean = true;
		public var displayOther_Logos:Boolean = true;
		
		// scale
		public var scaleStartCoca_Cola:Number = 1;
		public var scaleEndCoca_Cola:Number = 1;	// can't be changed. Logo can't be smaller than the stage width.
		public var scaleStartMac_Donalds:Number = 1;
		public var scaleEndMac_Donalds:Number = 1;
		public var scaleStartOther_Logos:Number = 1;
		public var scaleEndOther_Logos:Number = 1;
		
		// approch
		public var approchMaxDistance:Number = 0;
		public var approchAcceleration:Number = 0;
		
		// panel
		public var currentUpdatedPanel:String;
		
		
		public function Model()
		{
			
		}
		

		
	}
}