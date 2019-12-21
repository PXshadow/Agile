package mud.ui;

import openfl.display.Sprite;

class Button extends Sprite
{
    public var click:Void->Void;
    public var down:Void->Void;
    public var up:Void->Void;
    public var main:Void->Void;
    public var label:Text;
    public var image:Image;
    public function new()
    {
        super();

    }
    public function remove()
    {
        @:privateAccess __removeAllListeners();
        if (parent != null) parent.removeChild(this);
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