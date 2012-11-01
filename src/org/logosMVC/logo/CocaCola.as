package org.logosMVC.logo
{
	import flash.display.Sprite;
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
	import org.flintparticles.twoD.particles.Particle2DUtils;
	import org.logosMVC.mvc.Model;
	
	public class CocaCola extends Sprite
	{
		private var model:Model;
		private var renderer:DisplayObjectRenderer;

		public var emitter:Emitter2D;
		
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
		
		public function setDisplay():void
		{
			this.visible = model.displayCoca_Cola;
		}
	}
}
