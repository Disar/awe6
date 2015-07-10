package awe6.core.drivers.kha;
import awe6.core.drivers.AInputKeyboard;
import kha.input.Keyboard;

/**
 * ...
 * @author Sidar Talei
 */
class InputKeyboard extends AInputKeyboard
	
	override private function _driverInit():Void 
	{
		Keyboard.get(0).notify(OnDown, OnUp);
	}
	
	function OnUp((key:Key, char:String) : Void
	{
		if ( !isActive )
		{
			return;
		}
		_addEvent( char.charCodeAt(0), false );
		return;
	}
	
	function OnDown((key:Key, char:String) : Void
	{
		if ( !isActive )
		{
			return;
		}
		_addEvent(char.charCodeAt(0), true ); 
		return;
	}
	
	override private function _updater( p_deltaTime:Int = 0 ):Void 
	{
		super._updater( p_deltaTime );
	}
	
	override private function _disposer():Void 
	{
		Keyboard.get(0).remove(OnDown, OnUp);
		super._disposer();
	}
	
	
}