/*
	MXHX MinimalComps
	Copyright 2022 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package minimalcomps.macros;

#if macro
class MXHXMacro {
	public static function initialize():Void {
		#if mxhx_component
		mxhx.macros.MXHXComponent.setDataBindingCallback(createDataBindingExpression);
		mxhx.macros.MXHXComponent.setDispatchEventCallback(createDispatchEventExpression);
		mxhx.macros.MXHXComponent.setAddEventListenerCallback(createAddEventListenerExpression);
		#end
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Component", "width", "resize");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Component", "height", "resize");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Calendar", "day", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Calendar", "month", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Calendar", "year", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.ColorChooser", "value", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.ComboBox", "selectedIndex", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.ComboBox", "selectedItem", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.InputText", "text", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Knob", "value", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.List", "selectedIndex", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.List", "selectedItem", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.NumericStepper", "value", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.RangeSlider", "lowValue", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.RangeSlider", "highValue", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.RotarySelector", "choice", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.ScrollBar", "value", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.ScrollSlider", "value", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Slider", "value", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.Text", "text", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.UISlider", "value", "change");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.WheelMenu", "selectedIndex", "select");
		mxhx.bindable.DataBinding.addBindableProperty("minimalcomps.components.WheelMenu", "selectedItem", "select");
	}

	private static function createDataBindingExpression(sourceExpr:String, destExpr:String, documentExpr:String):String {
		return 'mxhx.bindable.DataBinding.bind(${sourceExpr}, ${destExpr}, ${documentExpr})';
	}

	private static function createDispatchEventExpression(dispatcherExpr:String, eventName:String):String {
		return '${dispatcherExpr}.dispatchEvent(new openfl.events.Event("${eventName}"))';
	}

	private static function createAddEventListenerExpression(dispatcherExpr:String, eventName:String, listenerExpr:String):String {
		listenerExpr = StringTools.trim(listenerExpr);
		if (~/\w+(?:\.\w+)*\(event\)/.match(listenerExpr)) {
			var modifiedListenerExpr = listenerExpr.substr(0, listenerExpr.length - 7);
			return '${dispatcherExpr}.addEventListener("${eventName}", ${modifiedListenerExpr})';
		}
		return '${dispatcherExpr}.addEventListener("${eventName}", event -> ${listenerExpr})';
	}
}
#end
