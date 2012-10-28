package org.logosMVC.logo
{
	import flash.display.Sprite;
//	import flash.geom.Point;
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
	import org.flintparticles.twoD.particles.Particle2DUtils;
	import org.logosMVC.mvc.Model;
	
	public class CocaCola extends Sprite
	{
		private var model:Model;
		private var renderer:DisplayObjectRenderer;

		public var emitter:Emitter2D;

		
//		public var myColorInit:ColorRandomInit;
//		public var emitterCoca_Cola:Emitter2D;
//		public var myStartPoint:Point;
//		public var myEndPoint:Point;		
//		public var myLineZone:LineZone;
//		public var myVelocity:Velocity;
//		public var myScaleAll:ScaleAll;
		
		public function CocaCola(model:Model)
		{
			this.model = model;
			setDisplay();

			// create logo from swc
			var coca_cola:Coca_cola = new Coca_cola();
			coca_cola.x = 512;
			coca_cola.y = 384;			
			
			renderer = new DisplayObjectRenderer();
			addChild(renderer);			
			emitter = new Emitter2D();
			renderer.addEmitter(emitter);

//			myScaleAll = new ScaleAll(model.scaleStartCoca_Cola, model.scaleEndCoca_Cola);
			
			// initializer
			emitter.addInitializer( model.lifeTime );
			emitter.addInitializer( model.colorRandomInit );
			emitter.addInitializer( model.velocityCoca_Cola );
			
			// action
			emitter.addAction( model.move );
			emitter.addAction( model.age );
			emitter.addAction( model.fade );			
			emitter.addAction( model.wrapAroundBox );
			emitter.addAction( model.scaleAllCoca_Cola );			
			
			// create the particle:
			emitter.addParticles( Particle2DUtils.createParticles2DFromDisplayObjects( [coca_cola] ) , true);

			// set particle's name
			emitter.particles[0].dictionary["name"] = "Coca_Cola";			
			
			emitter.start();	

		}
/*
		public function setScale():void
		{
			myScaleAll.startScale = model.scaleStartCoca_Cola;
			myScaleAll.endScale = model.scaleEndCoca_Cola ;
		}
		
		public function setColor():void
		{
			switch(model.colorMode){
				case "Black":
				case "Cut Out":	
					myColorInit.minColor = 0x000000;
					myColorInit.maxColor = 0x000000;
					break;
				case "Color":
					myColorInit.minColor  = 0xFF0000;
					myColorInit.minColor  = 0x0000FF;
					break;				
			}
		}
*/		
		public function setLifetime():void  // NOT USED 
		{
			//myLifetime.minLifetime = model.minLifetime;
			//myLifetime.maxLifetime = model.maxLifetime;
//			emitterCoca_Cola.particles[0].lifetime = myLifetime.lifetime  // < this works without revive
			//emitterCoca_Cola.particles[0].lifetime = model.lifeTime.lifetime  

		}

		public function setVelocity():void
		{
//			myStartPoint.y = model.minVelocity;
//			myEndPoint.y = model.maxVelocity;
//			myLineZone.start = myStartPoint;
//			myLineZone.end = myEndPoint;
//			myVelocity.zone = myLineZone;
		}	
		
		public function setDisplay():void
		{
			this.visible = model.displayCoca_Cola;
		}
	}
}



/*
package org.logosMVC.logo
{
import flash.display.Sprite;
import flash.geom.Point;

import org.flintparticles.common.actions.*;
import org.flintparticles.common.easing.*;
import org.flintparticles.common.events.*;
import org.flintparticles.common.initializers.ColorRandomInit;
import org.flintparticles.twoD.actions.*;
import org.flintparticles.twoD.emitters.Emitter2D;
import org.flintparticles.twoD.initializers.Position;
import org.flintparticles.twoD.initializers.Velocity;
import org.flintparticles.twoD.particles.Particle2D;
import org.flintparticles.twoD.particles.Particle2DUtils;
import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
import org.flintparticles.twoD.zones.*;

import org.logosMVC.mvc.Model;

public class CocaCola extends Sprite
{
private var model:Model;

public var myColorInit:ColorRandomInit;
public var emitterCoca_Cola:Emitter2D;
public var myStartPoint:Point;
public var myEndPoint:Point;		
public var myLineZone:LineZone;
public var myVelocity:Velocity;
public var myScaleAll:ScaleAll;

public function CocaCola(model:Model)
{
this.model = model;
setDisplay();

var coca_cola:Coca_cola = new Coca_cola();
coca_cola.x = 512;
coca_cola.y = 384;			

var rendererCoca_cola:DisplayObjectRenderer = new DisplayObjectRenderer();
addChild(rendererCoca_cola);			
emitterCoca_Cola = new Emitter2D();
rendererCoca_cola.addEmitter(emitterCoca_Cola);

myColorInit = new ColorRandomInit(0x000000, 0x000000);
myStartPoint = new Point(0, model.minVelocity);
myEndPoint = new Point(0, model.maxVelocity);			
myLineZone = new LineZone(myStartPoint, myEndPoint);
myVelocity = new Velocity(myLineZone);
myScaleAll = new ScaleAll(model.scaleStartCoca_Cola, model.scaleEndCoca_Cola);

emitterCoca_Cola.addInitializer( model.lifeTime);
emitterCoca_Cola.addInitializer( myColorInit );
emitterCoca_Cola.addInitializer( myVelocity );

emitterCoca_Cola.addAction( new WrapAroundBox(0, 0, 1024, 768));			
emitterCoca_Cola.addAction( myScaleAll );			
emitterCoca_Cola.addAction( new Move() );
emitterCoca_Cola.addAction( new Age(TwoWay.sine));
emitterCoca_Cola.addAction( new Fade());			

// create the particle:
emitterCoca_Cola.addParticles( Particle2DUtils.createParticles2DFromDisplayObjects( [coca_cola] ) , true);

emitterCoca_Cola.particles[0].dictionary["name"] = "Coca_Cola";			

emitterCoca_Cola.start();	

}

public function setScale():void
{
myScaleAll.startScale = model.scaleStartCoca_Cola;
myScaleAll.endScale = model.scaleEndCoca_Cola ;
}

public function setColor():void
{
switch(model.colorMode){
case "Black":
case "Cut Out":	
myColorInit.minColor = 0x000000;
myColorInit.maxColor = 0x000000;
break;
case "Color":
myColorInit.minColor  = 0xFF0000;
myColorInit.minColor  = 0x0000FF;
break;				
}
}

public function setLifetime():void  // NOT USED 
{
//myLifetime.minLifetime = model.minLifetime;
//myLifetime.maxLifetime = model.maxLifetime;
//			emitterCoca_Cola.particles[0].lifetime = myLifetime.lifetime  // < this works without revive
//emitterCoca_Cola.particles[0].lifetime = model.lifeTime.lifetime  

}

public function setVelocity():void
{
myStartPoint.y = model.minVelocity;
myEndPoint.y = model.maxVelocity;
myLineZone.start = myStartPoint;
myLineZone.end = myEndPoint;
myVelocity.zone = myLineZone;
}	

public function setDisplay():void
{
this.visible = model.displayCoca_Cola;
}
}
}
*/