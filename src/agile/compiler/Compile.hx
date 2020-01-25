package agile.compiler;
import agile.ui.View;
import lime.system.FileWatcher;
import sys.FileSystem;
import sys.io.File;
import haxe.io.Path;
import hscript.Async;
import hscript.Parser;
import hscript.Interp;
class Compile
{
    var parser:Parser;
    var interp:Interp;
    var view:View;
    var newFunction:String = "public function new()";
    public var main:String;
    public var reload:Bool = false;
    public static var dir:String = "";
    public static var watcher:FileWatcher = null;
    public static var list:Array<Compile> = [];
    public function new(view:View)
    {
        this.view = view;
        if (list.indexOf(this) == -1) list.push(this);

        if (watcher == null)
        {
            dir = directory();
            for (i in 0...3) dir = previous(dir);
            dir += "src/";
            watcher = new FileWatcher();
            watcher.addDirectory(dir);
            watcher.onModify.add(function(path:String)
            {
                path = Path.normalize(path);
                trace("path " + path);
                for (watch in list)
                {
                    trace("watch main " + watch.main);
                    if (path == watch.main)
                    {
                        execute(path);
                        return;
                    }
                }
            });
        }
        this.main = dir + Type.getClassName(Type.getSuperClass(Type.getClass(view))) + ".hx";
        trace("compile main " + this.main);
        parser = new Parser();
        parser.allowTypes = true;
        interp = new Interp();
        interp.variables.set("trace",Sys.print);

        interp.variables.set("Color",agile.ui.Color);

        interp.variables.set("Text",view.Text);
        interp.variables.set("Button",view.Button);
    }
    private function execute(path:String)
    {
        //unminimize
        view.stage.window.minimized = false;
        trace("minimized " + view.stage.window.minimized);
        //remove past
        view.clear();
        //retrieve data
        var data = File.getContent(path);
        var index = data.indexOf(newFunction);
        if (index == -1) return;
        //index retrieve
        index = data.indexOf("{",index + newFunction.length) + 1;
        //line start
        var ls:Int = data.substring(0,index).split("\n").length;
        var brackets:Int = 1;
        for (i in index...data.length)
        {
            switch (data.charAt(i))
            {
                case "}":
                brackets--;
                case "{":
                brackets++;
            }
            if (brackets == 0)
            {
                data = data.substring(index,i);
                break;
            }
        }
        if (brackets > 0) return;
        data = StringTools.replace(data,"super();","");
        var lines:Array<String> = data.split("\n");
        //executre parser
        //for (i in 0...lines.length)
        //{
            try {
                //trace("execute line: " + Std.string(ls + i));
                interp.execute(parser.parseString(data));
            }catch(e:Dynamic)
            {
                trace("failure: " + e);
            }
        //}
    }
    private function codeBlock(string:String):Array<String>
    {
        return new EReg("[^\\{}]*(?:\\.[\\{}]*)*(?<!\\)({(?>\\.|[^{}]|(?1))*})","").split(string);
    }
    private function previous(dir:String):String
    {
        return dir.substring(0,dir.substring(0,dir.length - 1).lastIndexOf("/") + 1);
    }
    private function directory():String
    {
        var dir:String = "";
        dir = Path.normalize(lime.system.System.applicationDirectory);
        dir = Path.removeTrailingSlashes(dir) + "/";
        #if mac
        dir = dir.substring(0,dir.indexOf("/Contents/Resources/"));
        dir = dir.substring(0,dir.lastIndexOf("/") + 1);
        #end
        return dir;
    }
}