package mud.ui;

import openfl.display.Shape;

class Image extends Object
{
    var shape:Shape;
    public function new(name:String)
    {
        super();
    }
    override function remove() 
    {
        super.remove();
        //@:privateAccess shape.__removeAllListeners();
        if (shape.parent != null) shape.parent.removeChild(shape);
    }
    public function roundCorners(int:Int=5):Image
    {
        return this;
    }
    public function resizeable():Image
    {
        return this;
    }
    public function aspectRatio():Image
    {
        return this;
    }
}