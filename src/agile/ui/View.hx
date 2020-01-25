package agile.ui;

import openfl.events.Event;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import hscript.Interp;
import hscript.Parser;
import agile.compiler.Compile;

class View extends Container
{
    var compile:Compile;
    public function new()
    {
        super();
        stage.addEventListener(Event.RESIZE,resize);
        center();
        compile = new Compile(this);
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