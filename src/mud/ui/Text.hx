package mud.ui;

import openfl.text.TextField;

class Text
{
    var textfield:TextField;
    public function new(text:String)
    {
        textfield = new TextField();
        textfield.selectable = false;
        textfield.mouseEnabled = false;
        textfield.text = text;
        setHeight();
    }
    public function remove()
    {
        @:privateAccess textfield.__removeAllListeners();
        if (textfield.parent != null) textfield.parent.removeChild(textfield);
    }
    private function setHeight()
    {
        textfield.height = textfield.textHeight + 4;
    }
    public function bold():Text
    {
        return this;
    }
    public function italic():Text
    {
        return this;
    }
    public function underline():Text
    {
        return this;
    }
    public function lineLimit(int:Int=1)
    {
        return this;
    }
    public function secure(bool:Bool=true):Text
    {
        textfield.displayAsPassword = bool;
        return this;
    }
}