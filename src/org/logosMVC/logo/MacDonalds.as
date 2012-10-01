package org.logosMVC.logo
{
	import flash.display.Sprite;
	
	import org.flintparticles.common.actions.*;
	import org.flintparticles.common.easing.*;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.ColorRandomInit;	
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.particles.Particle2DUtils;
	import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.LineZone;	
	import org.logosMVC.mvc.Model;
	import flash.geom.Point;
	import org.flintparticles.twoD.actions.WrapAroundBox;
	import org.flintparticles.twoD.actions.ScaleAll;

	public class MacDonalds extends Sprite
	{
		private var model:Model;
		
		public var myLifetime:Lifetime;
		public var myColorInit:ColorRandomInit;		
		public var emitterMac_Donalds:Emitter2D;
		public var myStartPoint:Point;
		public var myEndPoint:Point;		
		public var myLineZone:LineZone;
		public var myVelocity:Velocity;		
		public var myScaleAll:ScaleAll;
		
		public function MacDonalds(model:Model)
		{
			this.model = model;
			setDisplay();
			
			var myMac_Donalds:Mac_Donalds = new Mac_Donalds();
			myMac_Donalds.x = 0;
			myMac_Donalds.y = 770;
			
			var rendererMac_Donalds:DisplayObjectRenderer = new DisplayObjectRenderer();
			addChild(rendererMac_Donalds);			
			emitterMac_Donalds = new Emitter2D();
			rendererMac_Donalds.addEmitter(emitterMac_Donalds);	
			
			myLifetime = new Lifetime(model.minLifetime, model.maxLifetime);
			myColorInit = new ColorRandomInit(0x000000, 0x000000);
			myStartPoint = new Point(model.minVelocity, 0);
			myEndPoint = new Point(model.maxVelocity, 0);			
			myLineZone = new LineZone(myStartPoint, myEndPoint);
			myVelocity = new Velocity(myLineZone);
			myScaleAll = new ScaleAll(model.scaleStartMac_Donalds, model.scaleEndMac_Donalds);
			
			emitterMac_Donalds.addInitializer(myLifetime);			
			emitterMac_Donalds.addInitializer( myColorInit );
			emitterMac_Donalds.addInitializer( myVelocity );
			emitterMac_Donalds.addAction( new WrapAroundBox(0, 0, 1024, 768));			
			emitterMac_Donalds.addAction( myScaleAll );

			emitterMac_Donalds.addAction( new Move() );
			emitterMac_Donalds.addAction( new Age(TwoWay.sine)  );
			emitterMac_Donalds.addAction( new Fade() );			
			
			emitterMac_Donalds.addParticles( Particle2DUtils.createParticles2DFromDisplayObjects( [myMac_Donalds] ) , true);
			
			// Dictionary:
			emitterMac_Donalds.particles[0].dictionary["name"] = "Mac_Donalds";			
			
			emitterMac_Donalds.start();
			
		}
		
		public function setScale():void
		{
			myScaleAll.startScale = model.scaleStartMac_Donalds;
			myScaleAll.endScale = model.scaleEndMac_Donalds;
		}
		
		public function setDisplay():void
		{
			this.visible = model.displayMac_Donalds;
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
			myStartPoint.x = model.minVelocity;
			myEndPoint.x = model.maxVelocity;
			myLineZone.start = myStartPoint;
			myLineZone.end = myEndPoint;
			myVelocity.zone = myLineZone;
		}		
	}
}