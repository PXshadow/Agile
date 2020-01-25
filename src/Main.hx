import agile.ui.Color;
class Main extends agile.ui.View
{
    public function new()
    {
        super(true);
        //hello world
        for (i in 0...6) Text("I am down").color(Color.GREEN);
    }
}
