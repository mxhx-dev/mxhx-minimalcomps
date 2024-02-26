import minimalcomps.components.PushButton;
import minimalcomps.components.mxhx.Application;
import mxhx.runtime.MXHXRuntimeComponent;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Main extends Sprite {
	public function new() {
		super();

		var idMap:Map<String, Any> = [];
		var content = cast(MXHXRuntimeComponent.withMarkup('
			<m:Application xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:m="https://ns.mxhx.dev/minimalcomps/mxhx">
				<m:PushButton id="button" label="Click Me" x="20.0" y="20.0"/>
			</m:Application>
		', { idMap: idMap }), Application);
		addChild(content);

		// defined in Main.mxhx with id="button"
		var button = cast(idMap.get("button"), PushButton);
		button.addEventListener(MouseEvent.CLICK, button_clickHandler);
	}

	private function button_clickHandler(event:MouseEvent):Void {
		// displayed in debug console
		trace("Hello World");
	}
}
