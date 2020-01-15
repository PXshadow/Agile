package mud.ui;

import openfl.events.Event;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import hscript.Interp;
import hscript.Parser;

class View extends Container
{
    
    public function new()
    {
        super();
        stage.addEventListener(Event.RESIZE,resize);
        center();
    }
    private function resize(_)
    {

    }
    public function clear()
    {
        var object:Object;
        for (i in 0...numChildren)
        {
            object = cast getChildAt(i);
            object.remove();
        }
    }
    public function Button(main:Void->Void=null):Button
    {
        var button = new Button();
        button.main = main;
        add(button.add());
        return button;
    }
    public function Text(string:String=""):Text
    {
        var text = new Text(string);
        @:privateAccess add(text.textfield);
        return text;
    }
    public function List(array:Array<DisplayObject>):List
    {
        var list = new List(array);
        return list;
    }
}