import agile.ui.Color;
class Main extends agile.ui.View
{
    public function new()
    {
        super();
        new agile.compiler.Compile("src","Main.hx",this);
        return;
        //hello world
        for (i in 0...10) Text("I am down").color(Color.GREEN);
    }
}
