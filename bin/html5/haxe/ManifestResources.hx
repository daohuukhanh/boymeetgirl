package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:pathy26:data%2Fgraphics%2Fbeam.pngy4:sizei288y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y25:data%2Fgraphics%2Fboy.pngR2i1672R3R4R5R7R6tgoR0y26:data%2Fgraphics%2Fboy2.pngR2i1459R3R4R5R8R6tgoR0y28:data%2Fgraphics%2Fflower.pngR2i1463R3R4R5R9R6tgoR0y30:data%2Fgraphics%2Fgameover.pngR2i7082R3R4R5R10R6tgoR0y26:data%2Fgraphics%2Fgirl.pngR2i2450R3R4R5R11R6tgoR0y27:data%2Fgraphics%2Fgirl2.pngR2i2316R3R4R5R12R6tgoR0y28:data%2Fgraphics%2Fhearts.pngR2i720R3R4R5R13R6tgoR0y29:data%2Fgraphics%2Fhearts1.pngR2i465R3R4R5R14R6tgoR0y29:data%2Fgraphics%2Fhearts2.pngR2i608R3R4R5R15R6tgoR0y25:data%2Fgraphics%2Fsun.pngR2i2122R3R4R5R16R6tgoR0y26:data%2Fgraphics%2Fsun1.pngR2i1893R3R4R5R17R6tgoR0y26:data%2Fgraphics%2Fsun2.pngR2i1863R3R4R5R18R6tgoR0y25:data%2Fgraphics%2Fwin.pngR2i9712R3R4R5R19R6tgoR0y34:data%2Fhow%20to%20add%20assets.txtR2i7117R3y4:TEXTR5R20R6tgoR0y15:data%2Ficon.pngR2i143966R3R4R5R22R6tgoR2i768046R3y5:SOUNDR5y23:data%2Fsounds%2Fboo.wavy9:pathGroupaR24hR6tgoR2i53544R3R23R5y24:data%2Fsounds%2Fouch.wavR25aR26hR6tgoR2i670922R3R23R5y23:data%2Fsounds%2Fwin.wavR25aR27hR6tgoR2i41004R3R23R5y23:data%2Fsounds%2Fyay.wavR25aR28hR6tgh","version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__data_graphics_beam_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_boy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_boy2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_flower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_girl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_girl2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_hearts_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_hearts1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_hearts2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sun1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sun2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_win_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_how_to_add_assets_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__data_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_sounds_boo_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__data_sounds_ouch_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__data_sounds_win_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__data_sounds_yay_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("data/graphics/beam.png") #if display private #end class __ASSET__data_graphics_beam_png extends lime.graphics.Image {}
@:image("data/graphics/boy.png") #if display private #end class __ASSET__data_graphics_boy_png extends lime.graphics.Image {}
@:image("data/graphics/boy2.png") #if display private #end class __ASSET__data_graphics_boy2_png extends lime.graphics.Image {}
@:image("data/graphics/flower.png") #if display private #end class __ASSET__data_graphics_flower_png extends lime.graphics.Image {}
@:image("data/graphics/gameover.png") #if display private #end class __ASSET__data_graphics_gameover_png extends lime.graphics.Image {}
@:image("data/graphics/girl.png") #if display private #end class __ASSET__data_graphics_girl_png extends lime.graphics.Image {}
@:image("data/graphics/girl2.png") #if display private #end class __ASSET__data_graphics_girl2_png extends lime.graphics.Image {}
@:image("data/graphics/hearts.png") #if display private #end class __ASSET__data_graphics_hearts_png extends lime.graphics.Image {}
@:image("data/graphics/hearts1.png") #if display private #end class __ASSET__data_graphics_hearts1_png extends lime.graphics.Image {}
@:image("data/graphics/hearts2.png") #if display private #end class __ASSET__data_graphics_hearts2_png extends lime.graphics.Image {}
@:image("data/graphics/sun.png") #if display private #end class __ASSET__data_graphics_sun_png extends lime.graphics.Image {}
@:image("data/graphics/sun1.png") #if display private #end class __ASSET__data_graphics_sun1_png extends lime.graphics.Image {}
@:image("data/graphics/sun2.png") #if display private #end class __ASSET__data_graphics_sun2_png extends lime.graphics.Image {}
@:image("data/graphics/win.png") #if display private #end class __ASSET__data_graphics_win_png extends lime.graphics.Image {}
@:file("data/how to add assets.txt") #if display private #end class __ASSET__data_how_to_add_assets_txt extends haxe.io.Bytes {}
@:image("data/icon.png") #if display private #end class __ASSET__data_icon_png extends lime.graphics.Image {}
@:file("data/sounds/boo.wav") #if display private #end class __ASSET__data_sounds_boo_wav extends haxe.io.Bytes {}
@:file("data/sounds/ouch.wav") #if display private #end class __ASSET__data_sounds_ouch_wav extends haxe.io.Bytes {}
@:file("data/sounds/win.wav") #if display private #end class __ASSET__data_sounds_win_wav extends haxe.io.Bytes {}
@:file("data/sounds/yay.wav") #if display private #end class __ASSET__data_sounds_yay_wav extends haxe.io.Bytes {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)



#end
#end