package agile.ui;

import openfl.display.DisplayObject;
class List extends Container
{
    var array:Array<DisplayObject>;
    public function new(array:Array<DisplayObject>)
    {
        super();
        this.array = array;
    }
}