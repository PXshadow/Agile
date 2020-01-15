package mud.ui;

import openfl.display.Sprite;
import openfl.display.DisplayObject;

class Container extends Sprite
{
    var list:Array<Object> = [];
    public function new()
    {
        super();

    }
    private function add(object:Object)
    {
        object.y = height;
        addChild(object);
        list.push(object);
        center();
    }
    private function center()
    {
        x = (stage.stageWidth - width)/2;
        y = (stage.stageHeight - height)/2;
        //trace("x " + x + " y " + y);
    }
}