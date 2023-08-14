import minimalcomps.components.mxhx.Application;
import openfl.events.MouseEvent;

@:build(mxhx.macros.MXHXComponent.build())
class Main extends Application {
	public function new() {
		super();

		// defined in Main.mxhx with id="button"
		this.button.addEventListener(MouseEvent.CLICK, button_clickHandler);
	}

	private function button_clickHandler(event:MouseEvent):Void {
		// displayed in debug console
		trace("Hello World");
	}
}
