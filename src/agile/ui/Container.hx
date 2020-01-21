package agile.ui;

import openfl.display.Sprite;
import openfl.display.DisplayObject;

class Container extends Sprite
{
    var list:Array<DisplayObject> = [];
    public function new()
    {
        super();

    }
    private function add(object:DisplayObject)
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