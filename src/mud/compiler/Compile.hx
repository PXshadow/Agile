package mud.compiler;
import mud.ui.View;
import lime.system.FileWatcher;
import sys.FileSystem;
import sys.io.File;
import haxe.io.Path;
import hscript.Async;
import hscript.Parser;
import hscript.Interp;
class Compile
{
    var dir:String;
    var src:String;
    var main:String;
    var data:String;
    var parser:Parser;
    var interp:Interp;
    var view:View;
    public function new(src:String,main:String,view:View)
    {
        this.src = src + "/";
        this.main = main;
        this.view = view;
        directory();
        for (i in 0...3) dir = previous();

        parser = new Parser();
        parser.allowTypes = true;
        interp = new Interp();
        interp.variables.set("Text",view.Text);
        interp.variables.set("Button",view.Button);

        var watcher = new FileWatcher();
        watcher.addDirectory(dir + src);
        watcher.onModify.add(function(path:String)
        {
            trace("path " + path);
            if (Path.withoutDirectory(path) == main) execute();
        });
        execute();
    }
    private function execute()
    {
        //remove past
        view.removeChildren();
        //retrieve data
        data = File.getContent(dir + src + "/" + main);
        var re = data.indexOf("return;") + 7;

        data = data.substring(re,data.indexOf("}",re));
        //executre parser
        try {
            trace("executre data: " + data);
            interp.execute(parser.parseString(data));
        }catch(e:Dynamic)
        {

        }
    }
    private function previous():String
    {
        return dir.substring(0,dir.substring(0,dir.length - 1).lastIndexOf("/") + 1);
    }
    private function directory()
    {
        #if (windows || !openfl)
        dir = "";
        #else
        dir = Path.normalize(lime.system.System.applicationDirectory);
        dir = Path.removeTrailingSlashes(dir) + "/";
        #end
        #if mac
        dir = dir.substring(0,dir.indexOf("/Contents/Resources/"));
        dir = dir.substring(0,dir.lastIndexOf("/") + 1);
        #end
    }
}