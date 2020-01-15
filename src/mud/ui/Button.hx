package mud.ui;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

class Button extends Object
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
    override public function remove()
    {
        super.remove();
        @:privateAccess sprite.__removeAllListeners();
        if (sprite.parent != null) sprite.parent.removeChild(sprite);
    }
    override function add():DisplayObject
    {
        return sprite;
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