package org.logosMVC.logo
{
	import com.greensock.*;
	import com.greensock.plugins.*;
	
	import flash.display.Sprite;
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
	import org.flintparticles.twoD.particles.Particle2DUtils;
	import org.flintparticles.common.particles.Particle;
	import org.flintparticles.twoD.particles.Particle2D;
	
	import org.logosMVC.mvc.Model;
	
	public class AppleMickeyMarlboroNike extends Sprite
	{
		private var model:Model;
		private var renderer:DisplayObjectRenderer;
		
		public var emitter:Emitter2D;
		public var myParticles:Vector.<Particle>;
		
		TweenPlugin.activate([ShortRotationPlugin]);
		
		public function AppleMickeyMarlboroNike(model:Model)
		{
			this.model = model;
			setDisplay();
			
			// create logos from swc
			var myApple:Apple = new Apple();
			var myMickey:Mickey = new Mickey();
			var myMarlboro:Marlboro = new Marlboro();
			var myNike:Nike = new Nike();
			
//			myApple.x = myMickey.x = myMarlboro.x = myNike.x = 1024/2;
//			myApple.y = myMickey.y = myMarlboro.y = myNike.y = 768/2;
			myApple.x = 0 
			myMickey.x = 1024
			myMarlboro.x = 0 
			myNike.x = 1024;
			myApple.y = 0
			myMickey.y = 0
			myMarlboro.y = 768 
			myNike.y = 768;
			
			var myArray:Array = [myApple, myMickey, myMarlboro, myNike];	

			renderer = new DisplayObjectRenderer();
			addChild(renderer);			
			emitter = new Emitter2D();
			renderer.addEmitter(emitter);

			// initializer
			emitter.addInitializer( model.lifeTime );
			emitter.addInitializer( model.colorRandomInit4Logos );
			emitter.addInitializer( model.rotateVelocity );			
			
			// action
			emitter.addAction( model.wrapAroundBox );			
			emitter.addAction( model.move );
			emitter.addAction( model.age );
			emitter.addAction( model.fade );
			emitter.addAction( model.rotate );
			emitter.addAction( model.scaleOtherLogos );			
			emitter.addAction( model.approachNeighbours );
			
			//emitter.addAction( new RandomDrift( 500, 5 ) );	// for testing but can be usefull

			// create the particle:			
			myParticles = Particle2DUtils.createParticles2DFromDisplayObjects( myArray );		
			emitter.addParticles( myParticles , true);
					
			// set particle's name  
			emitter.particles[0].dictionary["name"] = "Apple";
			emitter.particles[1].dictionary["name"] = "Mickey";
			emitter.particles[2].dictionary["name"] = "Marlboro";
			emitter.particles[3].dictionary["name"] = "Nike";
					
			emitter.start();

		}

		public function setDisplay():void
		{
			this.visible = model.displayOther_Logos;
		}
		
		public function resetRotation():void
		{	
			for (var j:String in emitter.particles) { 
				Particle2D(emitter.particles[j]).rotation = radFromRad(Particle2D(emitter.particles[j]).rotation );
				TweenLite.to(Particle2D(emitter.particles[j]), 1, {shortRotation:{rotation:0}});
			}
		}
		
		public static function radFromRad( p_radInput:Number ):Number
		{
			var radOutput:Number = p_radInput;
			while ( radOutput >= 2 * Math.PI )
			{
				radOutput -= 2 * Math.PI;
			}
			while ( radOutput < -( 2 * Math.PI ) ) 
			{
				radOutput += 2 * Math.PI;
			}
			return radOutput;
		}
	}
}