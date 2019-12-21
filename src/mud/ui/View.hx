package mud.ui;

import openfl.display.DisplayObject;
import openfl.display.Sprite;
import hscript.Interp;
import hscript.Parser;

class View extends Container
{
    
    public function new()
    {
        super();

        center();
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
        @:privateAccess add(text.textfield);
        return text;
    }
    public function List(array:Array<DisplayObject>):List
    {
        var list = new List(array);
        return list;
    }
}