package awe6.core.drivers.kha;
import awe6.Types.EMouseCursor;
import kha.input.Mouse;
import kha.input.Sensor;
import kha.input.Surface;

/**
 * ...
 * @author Sidar Talei
 */
class InputMouse extends AInputMouse
{
	private var _isTouch:Bool;
	
	
	override private function _driverInit():Void 
	{
		_isTouch =  Surface.get(0) != null;
		if (_isTouch)
		{
			Surface.get(0).notify(OnTouch, OnTouchEnd, OnTouchMove);
		}
		else
		{
			Mouse.get(0).notify(OnDown, OnUp, OnMove, OnWheel);
		}
		

	}
	
	function OnTouchMove(id:Int, x:Int, y:Int)  : Void
	{
		this.x = x;
		this.y = y;
	}
	
	function OnTouch(id:Int, x:Int, y:Int) : Void
	{
		OnDown(0, x, y);
		
		x = _touchX;
		y = _touchY;
	}
	
	function OnTouchEnd(id:Int, x:Int, y:Int) : Void
	{
		OnUp(0, x, y);
		
		this.x = x;
		this.y = y;
		
	}
	
	function OnMove(x: Int, y: Int) : Void
	{
		this.x = x;
		this.y = y;
	}
	
	function OnWheel(delta: Int) : Void
	{
		this.scroll = delta;
	}
	
	function OnUp(button: Int, x: Int, y: Int) : Void
	{
		if ( !isActive )
		{
			return;
		}
		if ( !_isTouch && button == 2 ) // disable right click
		{
			return;
		}
		_buffer.push( false );
	}
	
	function OnDown(button: Int, x: Int, y: Int) : Void
	{
		if ( !isActive )
		{
			return;
		}
		if ( !_isTouch && button == 2 ) // disable right click
		{
			return;
		}
		_buffer.push( true );
	}
	
	override private function _disposer():Void 
	{
		if ( _isTouch) Surface.get(0).remove(OnTouch, OnTouchEnd, OnTouchMove);
		Mouse.get(0).remove(OnDown, OnUp, OnMove, OnWheel);
	}	
	
	override private function _isWithinBounds():Bool
	{
		return _stage.mouseInBounds;
	}
	
	override private function _getPosition():Void
	{
		/*if ( !_isTouch )
		{
			x = Std.int( _tools.limit( _stage.mouseX / _stage.scaleX, 0, _kernel.factory.width ) );
			y = Std.int( _tools.limit( _stage.mouseY / _stage.scaleY, 0, _kernel.factory.height ) );
		}
		else
		{
			x = _touchX;
			y = _touchY;
		*/

		x = ( x == _kernel.factory.width ) ? _xPrev : x;
		y = ( y == _kernel.factory.height ) ? _yPrev : y;
	}
	
	
	
	override private function set_isVisible( p_value:Bool ):Bool
	{
		//_stage.cursor = p_value ? "none" : "auto";
		return super.set_isVisible( p_value );
	}
	
	override private function set_cursorType( p_value:EMouseCursor ):EMouseCursor
	{
		/*switch( p_value )
		{
			case ARROW :
				_stage.cursor = "crosshair";
			case AUTO :
				_stage.cursor = "auto";
			case BUTTON :
				_stage.cursor = "pointer";
			case HAND :
				_stage.cursor = "pointer";
			case IBEAM :
				_stage.cursor = "text";
			case SUB_TYPE( p_value ) :
				_stage.cursor = p_value; // http://www.w3schools.com/cssref/playit.asp?filename=playcss_cursor&preval=alias
		}*/
		return super.set_cursorType( p_value );
	}
	
	// enable this if you want cursors, otherwise it's a performance hit for no other benefit so is disabled by default (as per CreateJS)
	public function enableMouseOver( p_updatesPerSecond:Float = 20 ):Void
	{
		//_stage.enableMouseOver( p_updatesPerSecond );
	}

	
}