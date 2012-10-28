package org.logosMVC.mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.easing.*;
	import org.flintparticles.common.initializers.ColorRandomInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.actions.ApproachNeighbours;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.Rotate;
	import org.flintparticles.twoD.actions.ScaleAll;
	import org.flintparticles.twoD.actions.WrapAroundBox;
	import org.flintparticles.twoD.initializers.RotateVelocity;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.particles.Particle2D;
	import org.flintparticles.twoD.zones.LineZone;
	
	public class Model extends EventDispatcher
	{
		// stage size:
		public var wrapAroundBox:WrapAroundBox;
		
		// display
		public var displayCoca_Cola:Boolean = true;
		public var displayMac_Donalds:Boolean = true;
		public var displayOther_Logos:Boolean = true;
		
		// panel
		public var currentUpdatedPanel:String;
		
		// move
		public var move:Move;
		
		// age
		public var age:Age;
		
		// fade
		public var fade:Fade;
		
		// lifetime
		public var lifeTime:Lifetime;
		public var minLifetime:Number = 1;
		public var maxLifetime:Number = 15;		
		
		// color
		public var colorRandomInit:ColorRandomInit;
		public var colorRandomInit4Logos:ColorRandomInit;		
		public var colorCoca_Cola:uint;
		public var colorMac_Donalds:uint;
		public var colorApple:uint;
		public var colorMickey:uint;
		public var colorMarlboro:uint;
		public var colorNike:uint;
		
		// rotation
		public var rotate:Rotate;
		public var rotateVelocity:RotateVelocity;
		public var minRotation:Number = 0;
		public var maxRotation:Number = 0;		

		// velocity Coca Cola
		public var velocityCoca_Cola:Velocity;
		public var startPointCoca_Cola:Point;
		public var endPointCoca_Cola:Point;	
		public var lineZoneCoca_Cola:LineZone;
		
		// velocity Mac Donalds
		public var velocityMac_Donalds:Velocity;		
		public var startPointMac_Donalds:Point;
		public var endPointMac_Donalds:Point;	
		public var lineZoneMac_Donalds:LineZone;	
		
		public var minVelocity:Number = 0;
		public var maxVelocity:Number = 0;	

		// scale
		public var scaleAllCoca_Cola:ScaleAll;
		public var scaleAllMac_Donalds:ScaleAll;
		public var scaleOtherLogos:ScaleAll;
		
		// approach neighbours
		public var approachNeighbours:ApproachNeighbours;
		
		
		
		
		// particles
//		public var particleCoca_Cola:Particle2D;
		public var particleApple:Particle2D
		public var particleMickey:Particle2D = new Particle2D();
		public var particleMarlboro:Particle2D = new Particle2D();
		public var particleNike:Particle2D = new Particle2D();

		
	
		
		// approch
		public var approchMaxDistance:Number = 0;
		public var approchAcceleration:Number = 0;

		
		
		public function Model()
		{
			wrapAroundBox = new WrapAroundBox (0, 0, 1024, 768);
			lifeTime = new Lifetime(minLifetime, maxLifetime);

			move = new Move();
			age = new Age(TwoWay.sine);
			fade = new Fade();
			colorRandomInit = new ColorRandomInit(0x000000,0x000000);
			colorRandomInit4Logos = new ColorRandomInit(0x000000,0x000000);
			rotate = new Rotate();	
			rotateVelocity = new RotateVelocity();
			
			// velocity Coca Cola
			startPointCoca_Cola = new Point(0, minVelocity);
			endPointCoca_Cola = new Point (0, maxVelocity);
			lineZoneCoca_Cola = new LineZone(startPointCoca_Cola, endPointCoca_Cola)	
			velocityCoca_Cola = new Velocity( lineZoneCoca_Cola ) ;				
			// velocity Mac Donalds
			startPointMac_Donalds = new Point(minVelocity, 0);
			endPointMac_Donalds = new Point (maxVelocity, 0);
			lineZoneMac_Donalds = new LineZone(startPointMac_Donalds, endPointMac_Donalds)	
			velocityMac_Donalds = new Velocity( lineZoneMac_Donalds ) ;			
							
			// scale
			scaleAllCoca_Cola = new ScaleAll();
			scaleAllMac_Donalds = new ScaleAll();
			scaleOtherLogos = new ScaleAll();
			
			// approach neighbours
			approachNeighbours = new ApproachNeighbours();
			
			
			
			
			//particleApple.dictionary["name"] = "Apple";	
			particleMickey.dictionary["name"] = "Mickey";	
			particleMarlboro.dictionary["name"] = "Marlboro";	
			particleNike.dictionary["name"] = "Nike";	
			
		}		
	}
}



/*
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
*/