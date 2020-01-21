package agile.ui;

import openfl.display.Shape;

class Image extends Shape
{
    public function new(name:String)
    {
        super();
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