package mud.ui;

import openfl.display.Shape;

class Image
{
    var shape:Shape;
    public function new(name:String)
    {

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