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
		
//		public var myParticleApple:Particle2D;
//		public var myParticleMickey:Particle2D;
//		public var myParticleMarlboro:Particle2D;
//		public var myParticleNike:Particle2D;
		
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
			
//			myApproch = new ApproachNeighbours(model.approchMaxDistance, model.approchAcceleration);
			


			//emitter.addAction( new RandomDrift( 500, 5 ) );	// for testing but can be usefull
//			emitter.addAction( myApproch );	// 1200, 10	

			// create the particle:			
			myParticles = Particle2DUtils.createParticles2DFromDisplayObjects( myArray );		
			emitter.addParticles( myParticles , true);
			
			
			// set particle's name  NOT SURE I AM USING THIS
			emitter.particles[0].dictionary["name"] = "Apple";
			emitter.particles[1].dictionary["name"] = "Mickey";
			emitter.particles[2].dictionary["name"] = "Marlboro";
			emitter.particles[3].dictionary["name"] = "Nike";
					
//			myParticleApple = Particle2D(emitter.particles[0]);		// TODO try model.particleApple = Particle2D(emitter.particles[0])
//			myParticleMickey = Particle2D(emitter.particles[1]);
//			myParticleMarlboro = Particle2D(emitter.particles[2]);
//			myParticleNike = Particle2D(emitter.particles[3]);
			
//			model.particleApple = Particle2D(myParticles[0])	// JUST CHANGED THIS TO TEST AND IT SEAMS TO WORK
			// STILL NEED "myParticleApple" TO CHANGE THE PARTICLE COLOR ON PANEL CHANGE
			
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
		
		
		/*		
		public function setApproch():void
		{
			myApproch.maxDistance = model.approchMaxDistance;  //trace ("myApproch.maxDistance " +myApproch.maxDistance + " myApproch.acceleration " +myApproch.acceleration)
			myApproch.acceleration = model.approchAcceleration;
		}
		
		public function setScale():void
		{
			myScaleAll.startScale = model.scaleStartOther_Logos;
			myScaleAll.endScale = model.scaleEndOther_Logos ;
		}
				
		public function setColor():void
		{
			switch(model.colorMode){
				case "Black":
					myColorRandomInit.minColor = 0x000000;
					myColorRandomInit.maxColor = 0x000000;
					for each (var particle:Particle2D in myParticles) {
						particle.color = 0x000000;
						model.updatedParticle = particle;
					}					
					break;
				case "Color":
					myColorRandomInit.minColor  = 0xFF0000;
					myColorRandomInit.minColor  = 0x0000FF; // see ColorInit class for code change minColor/minColor					
					for each (var particle:Particle2D in myParticles) {
						particle.color = Math.random() * 0xFFFFFF;
						model.updatedParticle = particle;

					}					
					break;	
				case "Cut Out":	
					myColorRandomInit.minColor = 0xFFFFFF;
					myColorRandomInit.maxColor = 0xFFFFFF;
					for each (var particle:Particle2D in myParticles) {
						particle.color = 0xFFFFFF;
						model.updatedParticle = particle;

					}					
					break;				
			}
			//model.particleApple.color = myColorInit.color;  
			///myParticles[0].color = myColorRandomInit.color;  
			//myParticles[1].color = myColorRandomInit.color; trace (myColorRandomInit.color)
			
			//myParticles[0].color = model.particleApple.color;
		}
		
		public function setLifetime():void
		{
			myLifetime.minLifetime = model.minLifetime;
			myLifetime.maxLifetime = model.maxLifetime;

		}
		
		public function setRotation():void
		{
			myRotateVelocity.minAngVelocity = model.minRotation / 100;
			myRotateVelocity.maxAngVelocity = model.maxRotation / 100;
		}	

		public function resetRotation():void
		{	
			for (var j:String in emitter.particles) { 
				//Particle2D(emitter.particles[j]).angVelocity = 0;
				Particle2D(emitter.particles[j]).rotation = radFromRad(Particle2D(emitter.particles[j]).rotation );
				TweenLite.to(Particle2D(emitter.particles[j]), 1, {shortRotation:{rotation:0}});
			}
			myRotateVelocity.minAngVelocity = 0;
			myRotateVelocity.maxAngVelocity = 0;
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
		*/
	}
}




/*
	package org.logosMVC.logo
	{
	import com.greensock.*;
	import com.greensock.plugins.*;
	
	import flash.display.Sprite;
	
	import org.flintparticles.common.actions.*;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.easing.*;
	import org.flintparticles.common.initializers.ColorRandomInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.particles.Particle;
	import org.flintparticles.twoD.actions.*;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.RotateVelocity;
	import org.flintparticles.twoD.particles.Particle2D;
	import org.flintparticles.twoD.particles.Particle2DUtils;
	import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
	import org.logosMVC.mvc.Model;
	
	public class AppleMickeyMarlboroNike extends Sprite
	{
	private var model:Model;
	public var myParticles:Vector.<Particle>;
	
	TweenPlugin.activate([ShortRotationPlugin]);
	
	public var myParticleApple:Particle2D;
	public var myParticleMickey:Particle2D;
	public var myParticleMarlboro:Particle2D;
	public var myParticleNike:Particle2D;
	
	public var myLifetime:Lifetime;
	public var myColorRandomInit:ColorRandomInit;
	public var myRotateVelocity:RotateVelocity;		
	public var myScaleAll:ScaleAll;
	public var myApproch:ApproachNeighbours;
	
	public var emitter:Emitter2D;
	
	public function AppleMickeyMarlboroNike(model:Model)
	{
	this.model = model;
	setDisplay();
	
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
	
	var renderer:DisplayObjectRenderer = new DisplayObjectRenderer();
	addChild(renderer);				
	emitter = new Emitter2D();
	renderer.addEmitter(emitter);
	
	myLifetime = new Lifetime(model.minLifetime, model.maxLifetime);
	//myColorRandomInit = new ColorRandomInit(0x000000, 0x000000);
	//myColorRandomInit = new ColorRandomInit (model.myColorRandomInit.minColor, model.myColorRandomInit.maxColor);
	myRotateVelocity = new RotateVelocity(model.minRotation, model.maxRotation);
	myScaleAll = new ScaleAll(model.scaleStartOther_Logos, model.scaleEndOther_Logos);
	myApproch = new ApproachNeighbours(model.approchMaxDistance, model.approchAcceleration);
	
	emitter.addInitializer( myLifetime);
	//emitter.addInitializer( myColorRandomInit );
	emitter.addInitializer( model.colorRandomInit4Logos );
	
	emitter.addInitializer( myRotateVelocity );
	
	emitter.addAction( new Move() );
	emitter.addAction( new Age(TwoWay.sine) );
	emitter.addAction( new Fade() );			
	emitter.addAction( new Rotate() );
	
	//emitter.addAction( new RandomDrift( 500, 5 ) );	// for testing but can be usefull
	emitter.addAction( myApproch );	// 1200, 10	
	emitter.addAction( myScaleAll );
	emitter.addAction( new WrapAroundBox(0, 0, 1024, 768));			
	
	myParticles = Particle2DUtils.createParticles2DFromDisplayObjects( myArray );		
	emitter.addParticles( myParticles , true);
	
	// Dictionary:
	emitter.particles[0].dictionary["name"] = "Apple";
	emitter.particles[1].dictionary["name"] = "Mickey";
	emitter.particles[2].dictionary["name"] = "Marlboro";
	emitter.particles[3].dictionary["name"] = "Nike";
	
	myParticleApple = Particle2D(emitter.particles[0]);		// TODO try model.particleApple = Particle2D(emitter.particles[0])
	myParticleMickey = Particle2D(emitter.particles[1]);
	myParticleMarlboro = Particle2D(emitter.particles[2]);
	myParticleNike = Particle2D(emitter.particles[3]);
	
	model.particleApple = Particle2D(myParticles[0])	// JUST CHANGED THIS TO TEST AND IT SEAMS TO WORK
	// STILL NEED "myParticleApple" TO CHANGE THE PARTICLE COLOR ON PANEL CHANGE
	
	emitter.start();
	
	}
	
	public function setApproch():void
	{
	myApproch.maxDistance = model.approchMaxDistance;  //trace ("myApproch.maxDistance " +myApproch.maxDistance + " myApproch.acceleration " +myApproch.acceleration)
	myApproch.acceleration = model.approchAcceleration;
	}
	
	public function setScale():void
	{
	myScaleAll.startScale = model.scaleStartOther_Logos;
	myScaleAll.endScale = model.scaleEndOther_Logos ;
	}
	
	public function setDisplay():void
	{
	this.visible = model.displayOther_Logos;
	}
	
	public function setColor():void
	{
	/*			switch(model.colorMode){
	case "Black":
	myColorRandomInit.minColor = 0x000000;
	myColorRandomInit.maxColor = 0x000000;
	for each (var particle:Particle2D in myParticles) {
	particle.color = 0x000000;
	model.updatedParticle = particle;
	}					
	break;
	case "Color":
	myColorRandomInit.minColor  = 0xFF0000;
	myColorRandomInit.minColor  = 0x0000FF; // see ColorInit class for code change minColor/minColor					
	for each (var particle:Particle2D in myParticles) {
	particle.color = Math.random() * 0xFFFFFF;
	model.updatedParticle = particle;
	
	}					
	break;	
	case "Cut Out":	
	myColorRandomInit.minColor = 0xFFFFFF;
	myColorRandomInit.maxColor = 0xFFFFFF;
	for each (var particle:Particle2D in myParticles) {
	particle.color = 0xFFFFFF;
	model.updatedParticle = particle;
	
	}					
	break;				
	}
	//model.particleApple.color = myColorInit.color;  
	///myParticles[0].color = myColorRandomInit.color;  
	//myParticles[1].color = myColorRandomInit.color; trace (myColorRandomInit.color)
	
	//myParticles[0].color = model.particleApple.color;
}

public function setLifetime():void
{
	myLifetime.minLifetime = model.minLifetime;
	myLifetime.maxLifetime = model.maxLifetime;
	
}

public function setRotation():void
{
	myRotateVelocity.minAngVelocity = model.minRotation / 100;
	myRotateVelocity.maxAngVelocity = model.maxRotation / 100;
}	

public function resetRotation():void
{	
	for (var j:String in emitter.particles) { 
		//Particle2D(emitter.particles[j]).angVelocity = 0;
		Particle2D(emitter.particles[j]).rotation = radFromRad(Particle2D(emitter.particles[j]).rotation );
		TweenLite.to(Particle2D(emitter.particles[j]), 1, {shortRotation:{rotation:0}});
	}
	myRotateVelocity.minAngVelocity = 0;
	myRotateVelocity.maxAngVelocity = 0;
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
*/