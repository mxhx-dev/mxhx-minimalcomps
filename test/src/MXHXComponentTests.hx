import minimalcomps.components.PushButton;
import minimalcomps.components.mxhx.Application;
import minimalcomps.components.mxhx.Panel;
import minimalcomps.components.mxhx.Window;
import mxhx.macros.MXHXComponent;
import utest.Assert;
import utest.Test;

class MXHXComponentTests extends Test {
	public function testMXHXComponent_Application():Void {
		var result = MXHXComponent.withMarkup('
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
		');
		Assert.notNull(result);
		Assert.isOfType(result, Application);

		Assert.equals(123.4, result.float);
		Assert.equals(5678, result.integer);
		Assert.isTrue(result.boolean);
		Assert.equals("hello", result.string);

		Assert.notNull(result.button);
		Assert.isOfType(result.button, PushButton);
		Assert.equals("hi", result.button.label);
		Assert.equals(result, result.button.parent);

		Assert.equals(1, result.numChildren);
		var child = result.getChildAt(0);
		Assert.equals(result.button, child);
	}

	public function testMXHXComponent_PanelChildren():Void {
		var result = MXHXComponent.withMarkup('
			<m:Panel xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:m="https://ns.mxhx.dev/minimalcomps/mxhx">
				<mx:Declarations>
					<mx:Float id="float">123.4</mx:Float>
					<mx:Int id="integer">5678</mx:Int>
					<mx:Bool id="boolean">true</mx:Bool>
					<mx:String id="string">hello</mx:String>
				</mx:Declarations>
				<m:PushButton id="button" label="hi"/>
			</m:Panel>
		');
		Assert.notNull(result);
		Assert.isOfType(result, Panel);

		Assert.equals(123.4, result.float);
		Assert.equals(5678, result.integer);
		Assert.isTrue(result.boolean);
		Assert.equals("hello", result.string);

		Assert.notNull(result.button);
		Assert.isOfType(result.button, PushButton);
		Assert.equals("hi", result.button.label);
		Assert.equals(result.content, result.button.parent);

		Assert.equals(1, result.content.numChildren);
		var child = result.content.getChildAt(0);
		Assert.equals(result.button, child);
	}

	public function testMXHXComponent_WindowChildren():Void {
		var result = MXHXComponent.withMarkup('
			<m:Window xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:m="https://ns.mxhx.dev/minimalcomps/mxhx">
				<mx:Declarations>
					<mx:Float id="float">123.4</mx:Float>
					<mx:Int id="integer">5678</mx:Int>
					<mx:Bool id="boolean">true</mx:Bool>
					<mx:String id="string">hello</mx:String>
				</mx:Declarations>
				<m:PushButton id="button" label="hi"/>
			</m:Window>
		');
		Assert.notNull(result);
		Assert.isOfType(result, Window);

		Assert.equals(123.4, result.float);
		Assert.equals(5678, result.integer);
		Assert.isTrue(result.boolean);
		Assert.equals("hello", result.string);

		Assert.notNull(result.button);
		Assert.isOfType(result.button, PushButton);
		Assert.equals("hi", result.button.label);
		Assert.equals(result.content, result.button.parent);

		Assert.equals(1, result.content.numChildren);
		var child = result.content.getChildAt(0);
		Assert.equals(result.button, child);
	}
}
