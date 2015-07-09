package awe6.core.drivers.kha;
import awe6.core.drivers.AView;
import flash.display;

/**
 * ...
 * @author Sidar Talei
 */
class View extends AView
{
	private var container:Context;
	
	override private function _init():Void {
		if (!context) {
			context = new Context();
		}
		super._init();
	}
	
	
	override private function _driverDisposer():Void 
	{
		
	}
	
	override private function _driverDraw():Void
	{
		
	}

	override private function set_x( p_value:Float ):Float
	{
		//context.x = p_value;
		return super.set_x( p_value );
	}
	
	override private function set_y( p_value:Float ):Float
	{
		//context.y = p_value;
		return super.set_y( p_value );
	}
}