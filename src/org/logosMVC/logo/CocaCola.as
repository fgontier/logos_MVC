package org.logosMVC.logo
{
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	
	import org.flintparticles.common.actions.*;
	import org.flintparticles.common.easing.*;
	import org.flintparticles.common.events.*;
	import org.flintparticles.common.initializers.ColorRandomInit;
	import org.flintparticles.common.initializers.Lifetime;
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
		
		public var myLifetime:Lifetime;
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

			myLifetime = new Lifetime(model.minLifetime, model.maxLifetime);			
			myColorInit = new ColorRandomInit(0x000000, 0x000000);
			myStartPoint = new Point(0, model.minVelocity);
			myEndPoint = new Point(0, model.maxVelocity);			
			myLineZone = new LineZone(myStartPoint, myEndPoint);
			myVelocity = new Velocity(myLineZone);
			myScaleAll = new ScaleAll(model.scaleStartCoca_Cola, model.scaleEndCoca_Cola);
			
			emitterCoca_Cola.addInitializer( myLifetime);
			emitterCoca_Cola.addInitializer( myColorInit );
			emitterCoca_Cola.addInitializer( myVelocity );
			
			emitterCoca_Cola.addAction( new WrapAroundBox(0, 0, 1024, 768));			
			emitterCoca_Cola.addAction( myScaleAll );			
			emitterCoca_Cola.addAction( new Move() );
			emitterCoca_Cola.addAction( new Age(TwoWay.sine));
			emitterCoca_Cola.addAction( new Fade());			
			
			emitterCoca_Cola.addParticles( Particle2DUtils.createParticles2DFromDisplayObjects( [coca_cola] ) , true);

			// Dictionary:
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
		
		public function setLifetime():void
		{
			myLifetime.minLifetime = model.minLifetime;
			myLifetime.maxLifetime = model.maxLifetime;
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