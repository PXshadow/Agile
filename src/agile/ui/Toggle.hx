package agile.ui;

class Toggle extends Button
{
    @:isVar var on(get,set):Bool;
    function get_on():Bool
    {
        return on;
    }
    function set_on(value:Bool):Bool
    {
        on = value;
        //render

        return on;
    }
    public function new(on:Bool)
    {
        super();
        this.on = on;
    }
}