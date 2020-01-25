package agile.ui;

import openfl.events.Event;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import hscript.Interp;
import hscript.Parser;

class View extends Container
{
    public function new(hotReload:Bool=false)
    {
        super();
        if (hotReload)
        {
            
        }
        stage.addEventListener(Event.RESIZE,resize);
        center();
    }
    private function resize(_)
    {

    }
    public function clear()
    {
        removeChildren();
    }
    public function Button(main:Void->Void=null):Button
    {
        var button = new Button();
        button.main = main;
        add(button);
        return button;
    }
    public function Text(string:String=""):Text
    {
        var text = new Text(string);
        add(text);
        return text;
    }
    public function List(array:Array<DisplayObject>):List
    {
        var list = new List(array);
        return list;
    }
}