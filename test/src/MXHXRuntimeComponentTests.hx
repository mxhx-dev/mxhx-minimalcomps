import mxhx.runtime.MXHXRuntimeComponent;
import minimalcomps.components.PushButton;
import minimalcomps.components.mxhx.Application;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentTests extends Test {
	public function testMXHXComponent():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<m:Application xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:m="https://ns.mxhx.dev/minimalcomps/mxhx">
				<mx:Declarations>
					<mx:Float id="float">123.4</mx:Float>
					<mx:Int id="integer">5678</mx:Int>
					<mx:Bool id="boolean">true</mx:Bool>
					<mx:String id="string">hello</mx:String>
				</mx:Declarations>
				<m:PushButton id="button" label="hi"/>
			</m:Application>
		', {
				idMap: idMap
			});
		Assert.isOfType(result, Application);
		var app = cast(result, Application);
		Assert.notNull(app);

		Assert.equals(123.4, idMap.get("float"));
		Assert.equals(5678, idMap.get("integer"));
		Assert.isTrue(idMap.get("boolean"));
		Assert.equals("hello", idMap.get("string"));

		Assert.isOfType(idMap.get("button"), PushButton);
		var button = cast(idMap.get("button"), PushButton);
		Assert.notNull(button);
		Assert.equals("hi", button.label);
		Assert.equals(result, button.parent);

		Assert.equals(1, app.numChildren);
		var child = app.getChildAt(0);
		Assert.equals(button, child);
	}
}
