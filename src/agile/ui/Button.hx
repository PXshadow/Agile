package agile.ui;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

class Button extends Sprite
{
    public var click:Void->Void;
    public var down:Void->Void;
    public var up:Void->Void;
    public var main:Void->Void;
    public var sprite:Sprite;
    public var label:Text;
    public var image:Image;
    public function new()
    {
        super();
    }
    public function background(color:UInt):Button
    {
        return this;
    }
    public function cornerRadius(int:Int=5):Button
    {
        return this;
    }
}
enum ButtonMouse
{
    CLICK;
    DOWN;
}