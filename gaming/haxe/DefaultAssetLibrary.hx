package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/art/area02_level_tiles2.png", __ASSET__assets_art_area02_level_tiles2_png);
		type.set ("assets/art/area02_level_tiles2.png", AssetType.IMAGE);
		className.set ("assets/art/bullet.png", __ASSET__assets_art_bullet_png);
		type.set ("assets/art/bullet.png", AssetType.IMAGE);
		className.set ("assets/art/coinspin.png", __ASSET__assets_art_coinspin_png);
		type.set ("assets/art/coinspin.png", AssetType.IMAGE);
		className.set ("assets/art/lizardhead3.png", __ASSET__assets_art_lizardhead3_png);
		type.set ("assets/art/lizardhead3.png", AssetType.IMAGE);
		className.set ("assets/art/lizgibs.png", __ASSET__assets_art_lizgibs_png);
		type.set ("assets/art/lizgibs.png", AssetType.IMAGE);
		className.set ("assets/art/lurkgibs.png", __ASSET__assets_art_lurkgibs_png);
		type.set ("assets/art/lurkgibs.png", AssetType.IMAGE);
		className.set ("assets/art/lurkmonsta.png", __ASSET__assets_art_lurkmonsta_png);
		type.set ("assets/art/lurkmonsta.png", AssetType.IMAGE);
		className.set ("assets/art/pointer.png", __ASSET__assets_art_pointer_png);
		type.set ("assets/art/pointer.png", AssetType.IMAGE);
		className.set ("assets/art/simples_pimples.png", __ASSET__assets_art_simples_pimples_png);
		type.set ("assets/art/simples_pimples.png", AssetType.IMAGE);
		className.set ("assets/art/spikegibs.png", __ASSET__assets_art_spikegibs_png);
		type.set ("assets/art/spikegibs.png", AssetType.IMAGE);
		className.set ("assets/art/spikemonsta.png", __ASSET__assets_art_spikemonsta_png);
		type.set ("assets/art/spikemonsta.png", AssetType.IMAGE);
		className.set ("assets/data/coins.csv", __ASSET__assets_data_coins_csv);
		type.set ("assets/data/coins.csv", AssetType.TEXT);
		className.set ("assets/data/lurkcoords.csv", __ASSET__assets_data_lurkcoords_csv);
		type.set ("assets/data/lurkcoords.csv", AssetType.TEXT);
		className.set ("assets/data/monstacoords.csv", __ASSET__assets_data_monstacoords_csv);
		type.set ("assets/data/monstacoords.csv", AssetType.TEXT);
		className.set ("assets/data/monstacoords.txt", __ASSET__assets_data_monstacoords_txt);
		type.set ("assets/data/monstacoords.txt", AssetType.TEXT);
		className.set ("assets/levels/mapCSV_Group1_Ladders.csv", __ASSET__assets_levels_mapcsv_group1_ladders_csv);
		type.set ("assets/levels/mapCSV_Group1_Ladders.csv", AssetType.TEXT);
		className.set ("assets/levels/mapCSV_Group1_Map1.csv", __ASSET__assets_levels_mapcsv_group1_map1_csv);
		type.set ("assets/levels/mapCSV_Group1_Map1.csv", AssetType.TEXT);
		className.set ("assets/levels/mapCSV_Group1_Map1back.csv", __ASSET__assets_levels_mapcsv_group1_map1back_csv);
		type.set ("assets/levels/mapCSV_Group1_Map1back.csv", AssetType.TEXT);
		className.set ("assets/music/ScrollingSpace.mp3", __ASSET__assets_music_scrollingspace_mp3);
		type.set ("assets/music/ScrollingSpace.mp3", AssetType.MUSIC);
		className.set ("assets/music/ScrollingSpace.ogg", __ASSET__assets_music_scrollingspace_ogg);
		type.set ("assets/music/ScrollingSpace.ogg", AssetType.MUSIC);
		className.set ("assets/sounds/badshoot.wav", __ASSET__assets_sounds_badshoot_wav);
		type.set ("assets/sounds/badshoot.wav", AssetType.SOUND);
		className.set ("assets/sounds/coin.wav", __ASSET__assets_sounds_coin_wav);
		type.set ("assets/sounds/coin.wav", AssetType.SOUND);
		className.set ("assets/sounds/death.wav", __ASSET__assets_sounds_death_wav);
		type.set ("assets/sounds/death.wav", AssetType.SOUND);
		className.set ("assets/sounds/jump.wav", __ASSET__assets_sounds_jump_wav);
		type.set ("assets/sounds/jump.wav", AssetType.SOUND);
		className.set ("assets/sounds/menu.wav", __ASSET__assets_sounds_menu_wav);
		type.set ("assets/sounds/menu.wav", AssetType.SOUND);
		className.set ("assets/sounds/mondead2.wav", __ASSET__assets_sounds_mondead2_wav);
		type.set ("assets/sounds/mondead2.wav", AssetType.SOUND);
		className.set ("assets/sounds/monhurt2.wav", __ASSET__assets_sounds_monhurt2_wav);
		type.set ("assets/sounds/monhurt2.wav", AssetType.SOUND);
		className.set ("assets/sounds/shoot2.wav", __ASSET__assets_sounds_shoot2_wav);
		type.set ("assets/sounds/shoot2.wav", AssetType.SOUND);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "assets/art/area02_level_tiles2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/bullet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/coinspin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/lizardhead3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/lizgibs.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/lurkgibs.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/lurkmonsta.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/pointer.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/simples_pimples.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/spikegibs.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/art/spikemonsta.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/coins.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/lurkcoords.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/monstacoords.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/monstacoords.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/levels/mapCSV_Group1_Ladders.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/levels/mapCSV_Group1_Map1.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/levels/mapCSV_Group1_Map1back.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/ScrollingSpace.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/music/ScrollingSpace.ogg";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/badshoot.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/coin.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/death.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/jump.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/menu.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/mondead2.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monhurt2.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/shoot2.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/art/area02_level_tiles2.png", __ASSET__assets_art_area02_level_tiles2_png);
		type.set ("assets/art/area02_level_tiles2.png", AssetType.IMAGE);
		
		className.set ("assets/art/bullet.png", __ASSET__assets_art_bullet_png);
		type.set ("assets/art/bullet.png", AssetType.IMAGE);
		
		className.set ("assets/art/coinspin.png", __ASSET__assets_art_coinspin_png);
		type.set ("assets/art/coinspin.png", AssetType.IMAGE);
		
		className.set ("assets/art/lizardhead3.png", __ASSET__assets_art_lizardhead3_png);
		type.set ("assets/art/lizardhead3.png", AssetType.IMAGE);
		
		className.set ("assets/art/lizgibs.png", __ASSET__assets_art_lizgibs_png);
		type.set ("assets/art/lizgibs.png", AssetType.IMAGE);
		
		className.set ("assets/art/lurkgibs.png", __ASSET__assets_art_lurkgibs_png);
		type.set ("assets/art/lurkgibs.png", AssetType.IMAGE);
		
		className.set ("assets/art/lurkmonsta.png", __ASSET__assets_art_lurkmonsta_png);
		type.set ("assets/art/lurkmonsta.png", AssetType.IMAGE);
		
		className.set ("assets/art/pointer.png", __ASSET__assets_art_pointer_png);
		type.set ("assets/art/pointer.png", AssetType.IMAGE);
		
		className.set ("assets/art/simples_pimples.png", __ASSET__assets_art_simples_pimples_png);
		type.set ("assets/art/simples_pimples.png", AssetType.IMAGE);
		
		className.set ("assets/art/spikegibs.png", __ASSET__assets_art_spikegibs_png);
		type.set ("assets/art/spikegibs.png", AssetType.IMAGE);
		
		className.set ("assets/art/spikemonsta.png", __ASSET__assets_art_spikemonsta_png);
		type.set ("assets/art/spikemonsta.png", AssetType.IMAGE);
		
		className.set ("assets/data/coins.csv", __ASSET__assets_data_coins_csv);
		type.set ("assets/data/coins.csv", AssetType.TEXT);
		
		className.set ("assets/data/lurkcoords.csv", __ASSET__assets_data_lurkcoords_csv);
		type.set ("assets/data/lurkcoords.csv", AssetType.TEXT);
		
		className.set ("assets/data/monstacoords.csv", __ASSET__assets_data_monstacoords_csv);
		type.set ("assets/data/monstacoords.csv", AssetType.TEXT);
		
		className.set ("assets/data/monstacoords.txt", __ASSET__assets_data_monstacoords_txt);
		type.set ("assets/data/monstacoords.txt", AssetType.TEXT);
		
		className.set ("assets/levels/mapCSV_Group1_Ladders.csv", __ASSET__assets_levels_mapcsv_group1_ladders_csv);
		type.set ("assets/levels/mapCSV_Group1_Ladders.csv", AssetType.TEXT);
		
		className.set ("assets/levels/mapCSV_Group1_Map1.csv", __ASSET__assets_levels_mapcsv_group1_map1_csv);
		type.set ("assets/levels/mapCSV_Group1_Map1.csv", AssetType.TEXT);
		
		className.set ("assets/levels/mapCSV_Group1_Map1back.csv", __ASSET__assets_levels_mapcsv_group1_map1back_csv);
		type.set ("assets/levels/mapCSV_Group1_Map1back.csv", AssetType.TEXT);
		
		className.set ("assets/music/ScrollingSpace.mp3", __ASSET__assets_music_scrollingspace_mp3);
		type.set ("assets/music/ScrollingSpace.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/ScrollingSpace.ogg", __ASSET__assets_music_scrollingspace_ogg);
		type.set ("assets/music/ScrollingSpace.ogg", AssetType.MUSIC);
		
		className.set ("assets/sounds/badshoot.wav", __ASSET__assets_sounds_badshoot_wav);
		type.set ("assets/sounds/badshoot.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/coin.wav", __ASSET__assets_sounds_coin_wav);
		type.set ("assets/sounds/coin.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/death.wav", __ASSET__assets_sounds_death_wav);
		type.set ("assets/sounds/death.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/jump.wav", __ASSET__assets_sounds_jump_wav);
		type.set ("assets/sounds/jump.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/menu.wav", __ASSET__assets_sounds_menu_wav);
		type.set ("assets/sounds/menu.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/mondead2.wav", __ASSET__assets_sounds_mondead2_wav);
		type.set ("assets/sounds/mondead2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monhurt2.wav", __ASSET__assets_sounds_monhurt2_wav);
		type.set ("assets/sounds/monhurt2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/shoot2.wav", __ASSET__assets_sounds_shoot2_wav);
		type.set ("assets/sounds/shoot2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__assets_art_area02_level_tiles2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_coinspin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_lizardhead3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_lizgibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_lurkgibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_lurkmonsta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_pointer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_simples_pimples_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_spikegibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_art_spikemonsta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_data_coins_csv extends null { }
@:keep class __ASSET__assets_data_lurkcoords_csv extends null { }
@:keep class __ASSET__assets_data_monstacoords_csv extends null { }
@:keep class __ASSET__assets_data_monstacoords_txt extends null { }
@:keep class __ASSET__assets_levels_mapcsv_group1_ladders_csv extends null { }
@:keep class __ASSET__assets_levels_mapcsv_group1_map1_csv extends null { }
@:keep class __ASSET__assets_levels_mapcsv_group1_map1back_csv extends null { }
@:keep class __ASSET__assets_music_scrollingspace_mp3 extends null { }
@:keep class __ASSET__assets_music_scrollingspace_ogg extends null { }
@:keep class __ASSET__assets_sounds_badshoot_wav extends null { }
@:keep class __ASSET__assets_sounds_coin_wav extends null { }
@:keep class __ASSET__assets_sounds_death_wav extends null { }
@:keep class __ASSET__assets_sounds_jump_wav extends null { }
@:keep class __ASSET__assets_sounds_menu_wav extends null { }
@:keep class __ASSET__assets_sounds_mondead2_wav extends null { }
@:keep class __ASSET__assets_sounds_monhurt2_wav extends null { }
@:keep class __ASSET__assets_sounds_shoot2_wav extends null { }
@:keep class __ASSET__assets_sounds_beep_mp3 extends null { }
@:keep class __ASSET__assets_sounds_flixel_mp3 extends null { }
@:keep class __ASSET__assets_sounds_beep_ogg extends null { }
@:keep class __ASSET__assets_sounds_flixel_ogg extends null { }


#elseif html5



































#elseif (windows || mac || linux)


@:bitmap("assets/art/area02_level_tiles2.png") class __ASSET__assets_art_area02_level_tiles2_png extends flash.display.BitmapData {}
@:bitmap("assets/art/bullet.png") class __ASSET__assets_art_bullet_png extends flash.display.BitmapData {}
@:bitmap("assets/art/coinspin.png") class __ASSET__assets_art_coinspin_png extends flash.display.BitmapData {}
@:bitmap("assets/art/lizardhead3.png") class __ASSET__assets_art_lizardhead3_png extends flash.display.BitmapData {}
@:bitmap("assets/art/lizgibs.png") class __ASSET__assets_art_lizgibs_png extends flash.display.BitmapData {}
@:bitmap("assets/art/lurkgibs.png") class __ASSET__assets_art_lurkgibs_png extends flash.display.BitmapData {}
@:bitmap("assets/art/lurkmonsta.png") class __ASSET__assets_art_lurkmonsta_png extends flash.display.BitmapData {}
@:bitmap("assets/art/pointer.png") class __ASSET__assets_art_pointer_png extends flash.display.BitmapData {}
@:bitmap("assets/art/simples_pimples.png") class __ASSET__assets_art_simples_pimples_png extends flash.display.BitmapData {}
@:bitmap("assets/art/spikegibs.png") class __ASSET__assets_art_spikegibs_png extends flash.display.BitmapData {}
@:bitmap("assets/art/spikemonsta.png") class __ASSET__assets_art_spikemonsta_png extends flash.display.BitmapData {}
@:file("assets/data/coins.csv") class __ASSET__assets_data_coins_csv extends flash.utils.ByteArray {}
@:file("assets/data/lurkcoords.csv") class __ASSET__assets_data_lurkcoords_csv extends flash.utils.ByteArray {}
@:file("assets/data/monstacoords.csv") class __ASSET__assets_data_monstacoords_csv extends flash.utils.ByteArray {}
@:file("assets/data/monstacoords.txt") class __ASSET__assets_data_monstacoords_txt extends flash.utils.ByteArray {}
@:file("assets/levels/mapCSV_Group1_Ladders.csv") class __ASSET__assets_levels_mapcsv_group1_ladders_csv extends flash.utils.ByteArray {}
@:file("assets/levels/mapCSV_Group1_Map1.csv") class __ASSET__assets_levels_mapcsv_group1_map1_csv extends flash.utils.ByteArray {}
@:file("assets/levels/mapCSV_Group1_Map1back.csv") class __ASSET__assets_levels_mapcsv_group1_map1back_csv extends flash.utils.ByteArray {}
@:sound("assets/music/ScrollingSpace.mp3") class __ASSET__assets_music_scrollingspace_mp3 extends flash.media.Sound {}
@:sound("assets/music/ScrollingSpace.ogg") class __ASSET__assets_music_scrollingspace_ogg extends flash.media.Sound {}
@:sound("assets/sounds/badshoot.wav") class __ASSET__assets_sounds_badshoot_wav extends flash.media.Sound {}
@:sound("assets/sounds/coin.wav") class __ASSET__assets_sounds_coin_wav extends flash.media.Sound {}
@:sound("assets/sounds/death.wav") class __ASSET__assets_sounds_death_wav extends flash.media.Sound {}
@:sound("assets/sounds/jump.wav") class __ASSET__assets_sounds_jump_wav extends flash.media.Sound {}
@:sound("assets/sounds/menu.wav") class __ASSET__assets_sounds_menu_wav extends flash.media.Sound {}
@:sound("assets/sounds/mondead2.wav") class __ASSET__assets_sounds_mondead2_wav extends flash.media.Sound {}
@:sound("assets/sounds/monhurt2.wav") class __ASSET__assets_sounds_monhurt2_wav extends flash.media.Sound {}
@:sound("assets/sounds/shoot2.wav") class __ASSET__assets_sounds_shoot2_wav extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,5/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,5/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,5/assets/sounds/beep.ogg") class __ASSET__assets_sounds_beep_ogg extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,5/assets/sounds/flixel.ogg") class __ASSET__assets_sounds_flixel_ogg extends flash.media.Sound {}


#end
