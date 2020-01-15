import mud.ui.Color;
class Main extends mud.ui.View
{
    public function new()
    {
        super();
        new mud.compiler.Compile("src","Main.hx",this);
        return;
        //hello world
        for (i in 0...1) Text("I am down").color(Color.GREEN);
    }
}
