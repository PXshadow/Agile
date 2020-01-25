package agile.ui;

import openfl.display.DisplayObjectContainer;
import openfl.display.DisplayObject;
import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import openfl.text.TextField;

class Text extends DisplayObjectContainer
{
    var textfield:TextField;
    var _font:String = "assets/font/Roboto-";
    //0 regular, 1 bold, 2 medium, 3 light, 4 thin
    var _type:Int = 0;
    var _italic:Bool = false;
    var _ext:String = ".ttf";
    var _fontName:String;
    var _align:TextFormatAlign;
    var _size:Int = 24;
    var _color:UInt = 0;

    public function new(text:String)
    {
        super();
        textfield = new TextField();
        textfield.selectable = false;
        textfield.mouseEnabled = false;
        textfield.wordWrap = true;
        textfield.embedFonts = true;
        textfield.text = text;
        buildFont();
        //textfield.htmlText = text;
        setHeight();
        addChild(textfield);
    }
    private function buildFormat()
    {
        textfield.defaultTextFormat = new TextFormat(_fontName,_size,_color,null,null,null,null,null,_align);
    }
    private function buildFont()
    {
        var string = _font;
        switch (_type)
        {
            case 0: if (!_italic) string += "Regular";
            case 1: string += "Bold";
            case 2: string += "Medium";
            case 3: string += "Light";
            case 4: string += "Thin";
        }
        if (_italic) string += "Italic";
        string += _ext;
        _fontName = openfl.Assets.getFont(string).fontName;
        buildFormat();
    }
    private function setHeight()
    {
        textfield.height = textfield.textHeight + 4;
    }
    public function text(text:String=""):Text
    {
        textfield.text = text;
        return this;
    }
    public function color(int:UInt):Text
    {
        _color = int;
        buildFormat();
        return this;
    }
    public function bold(bool:Bool=true):Text
    {
        _type = 0;
        buildFont();
        return this;
    }
    public function medium(bool:Bool=true):Text
    {
        _type = 2;
        buildFont();
        return this;
    }
    public function light(bool:Bool=true):Text
    {
        _type = 3;
        buildFont();
        return this;
    }
    public function italic(bool:Bool=true):Text
    {
        _italic = bool;
        buildFont();
        return this;
    }
    public function thin(bool:Bool=true):Text
    {
        _type = 4;
        buildFont();
        return this;
    }
    public function underline(bool:Bool=true):Text
    {
        textfield.defaultTextFormat.underline = bool;
        return this;
    }
    public function lineLimit(int:Int=1)
    {
        textfield.height = textfield.defaultTextFormat.size + 4 * int;
        return this;
    }
    public function secure(bool:Bool=true):Text
    {
        textfield.displayAsPassword = bool;
        return this;
    }
}