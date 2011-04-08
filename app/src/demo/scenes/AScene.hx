/*
 * Copyright (c) 2010, Robert Fell, awe6.org
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package demo.scenes;
import assets.Background;
import awe6.core.Scene;
import awe6.extras.gui.Image;
import awe6.extras.gui.Text;
import awe6.interfaces.EAudioChannel;
import awe6.interfaces.EScene;
import awe6.interfaces.IKernel;
import demo.Session;
import flash.display.Bitmap;

class AScene extends Scene
{
	private var _session:Session;
	private var _title:String;
	private var _isMusic:Bool;
	
	private function new( kernel:IKernel, type:EScene, ?isPauseable:Bool = false, ?isMutable:Bool = true, ?isSessionSavedOnNext:Bool = false ) 
	{
		_session = cast kernel.session;
		_title = "?";
		super( kernel, type, isPauseable, isMutable, isSessionSavedOnNext );
	}
	
	override private function _init():Void 
	{
		super._init();
		
		addEntity( new Image( _kernel, new Background() ), true, 0 );
		var l_sceneID:String = _tools.toCamelCase( Std.string( type ), true );
		_title = Std.string( _kernel.getConfig( "gui.scenes." + l_sceneID + ".title" ) );
		var l_title:Text = new Text( _kernel, _kernel.factory.width, 50, _title, _kernel.factory.createTextStyle() );
		l_title.y = 10;
		addEntity( l_title, true, 100 );
		
		_kernel.audio.start( "MusicMenu", EAudioChannel.MUSIC, -1, 0, .125, 0, true );
	}
	
}