package org.logosMVC.logo
{
	import flash.display.Sprite;
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
	import org.flintparticles.twoD.particles.Particle2DUtils;
	import org.logosMVC.mvc.Model;

	public class MacDonalds extends Sprite
	{
		private var model:Model;
		private var renderer:DisplayObjectRenderer;
		
		public var emitter:Emitter2D;
		
		public function MacDonalds(model:Model)
		{
			this.model = model;
			setDisplay();
			
			// create logo from swc
			var myMac_Donalds:Mac_Donalds = new Mac_Donalds();
			myMac_Donalds.x = 0;
			myMac_Donalds.y = 770;
			
			renderer = new DisplayObjectRenderer();
			addChild(renderer);			
			emitter = new Emitter2D();
			renderer.addEmitter(emitter);			

			// initializer
			emitter.addInitializer( model.lifeTime );
			emitter.addInitializer( model.colorRandomInit );
			emitter.addInitializer( model.velocityMac_Donalds );
			
			// action
			emitter.addAction( model.wrapAroundBox );			
			emitter.addAction( model.move );
			emitter.addAction( model.age );
			emitter.addAction( model.fade );			
			emitter.addAction( model.scaleAllMac_Donalds );			

			// create the particle:			
			emitter.addParticles( Particle2DUtils.createParticles2DFromDisplayObjects( [myMac_Donalds] ) , true);
			
			// set particle's name
			emitter.particles[0].dictionary["name"] = "Mac_Donalds";			
			
			emitter.start();
			
		}

		public function setDisplay():void
		{
			this.visible = model.displayMac_Donalds;
		}
	}	
}