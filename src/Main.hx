class Main extends mud.ui.View
{
    public function new()
    {
        super();
        new mud.compiler.Compile("src","Main.hx",this);
        return;
        Text("Hehehehehe");
    }
}
