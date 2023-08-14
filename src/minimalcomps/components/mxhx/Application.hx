package minimalcomps.components.mxhx;

import openfl.display.DisplayObject;
import openfl.events.Event;

@:defaultXmlProperty("xmlContent")
class Application extends Component {
	public function new(style:String = Style.LIGHT) {
		super();

		Style.setStyle(style);

		if (stage != null) {
			addStageListeners();
			layoutApp();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, application_addedToStageHandler);
		}
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
				removeChild(child);
			}
		}
		_xmlContent = value;
		if (_xmlContent != null) {
			for (child in _xmlContent) {
				addChild(child);
			}
		}
		return this._xmlContent;
	}

	private function layoutApp():Void {
		move(0.0, 0.0);
		setSize(stage.stageWidth, stage.stageHeight);
	}

	private function addStageListeners():Void {
		if (stage == null) {
			return;
		}
		stage.addEventListener(Event.RESIZE, application_stage_resizeHandler);
	}

	private function application_addedToStageHandler(event:Event):Void {
		addStageListeners();
		layoutApp();
	}

	private function application_stage_resizeHandler(event:Event):Void {
		if (stage == null) {
			return;
		}
		layoutApp();
	}
}
