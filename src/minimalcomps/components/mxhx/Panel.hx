package minimalcomps.components.mxhx;

import openfl.display.DisplayObject;

@:defaultXmlProperty("xmlContent")
class Panel extends minimalcomps.components.Panel {
	public function new() {
		super();
	}

	private var _xmlContent:Array<DisplayObject> = null;

	@:dox(hide)
	@:noCompletion
	public var xmlContent(get, set):Array<DisplayObject>;

	private function get_xmlContent():Array<DisplayObject> {
		return this._xmlContent;
	}

	private function set_xmlContent(value:Array<DisplayObject>):Array<DisplayObject> {
		if (_xmlContent == value) {
			return _xmlContent;
		}
		if (_xmlContent != null) {
			for (child in _xmlContent) {
				content.removeChild(child);
			}
		}
		_xmlContent = value;
		if (_xmlContent != null) {
			for (child in _xmlContent) {
				content.addChild(child);
			}
		}
		return this._xmlContent;
	}
}
