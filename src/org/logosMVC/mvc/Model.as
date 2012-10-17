package org.logosMVC.mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.flintparticles.common.initializers.ColorRandomInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.particles.Particle2D;
	
	public class Model extends EventDispatcher
	{
		
		// particles
//		public var particleCoca_Cola:Particle2D;
		public var particleApple:Particle2D
		public var particleMickey:Particle2D = new Particle2D();
		public var particleMarlboro:Particle2D = new Particle2D();
		public var particleNike:Particle2D = new Particle2D();
		
		// lifetime
		public var lifeTime:Lifetime;
		public var minLifetime:Number = 1;
		public var maxLifetime:Number = 15;
		

		// velocity
		public var minVelocity:Number = 0;
		public var maxVelocity:Number = 0;
		
		// color
		public var colorMode:String  = "black";  // TODO call this value in colorPanel by default
		//public var myColorRandomInit:ColorRandomInit = new ColorRandomInit();
		public var colorRandomInit4Logos:ColorRandomInit = new ColorRandomInit();
		
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
			lifeTime = new Lifetime(minLifetime, maxLifetime);

			
			//particleApple.dictionary["name"] = "Apple";	
			particleMickey.dictionary["name"] = "Mickey";	
			particleMarlboro.dictionary["name"] = "Marlboro";	
			particleNike.dictionary["name"] = "Nike";	
			
		}
		

		
	}
}