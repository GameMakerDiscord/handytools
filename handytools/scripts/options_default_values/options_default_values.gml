/// @description Default option values

if ( !DEVELOPMENT ) {
	global.options_defaults[? "version"         ] = VERSION;
	if ( !FORCE_LOCK_MOUSE ) global.options_defaults[? "lock mouse" ] = false;
	global.options_defaults[? "fxaa"            ] = false;
	global.options_defaults[? "animations"      ] = true;
	global.options_defaults[? "transitions"     ] = true;
	global.options_defaults[? "music"           ] = 0.4;
	global.options_defaults[? "sounds"          ] = 0.75;
	global.options_defaults[? "master volume"   ] = 1.0;
	global.options_defaults[? "intro"           ] = false;
	global.options_defaults[? "player name"     ] = "Juju :D"
	global.options_defaults[? "fullscreen"      ] = false;
	global.options_defaults[? "window width"    ] = DEFAULT_WINDOW_WIDTH;
	global.options_defaults[? "window height"   ] = DEFAULT_WINDOW_HEIGHT;
	global.options_defaults[? "window x"        ] = DEFAULT_WINDOW_X;
	global.options_defaults[? "window y"        ] = DEFAULT_WINDOW_Y;
} else {
	#region DEVELOPMENT DEFAULTS
	global.options_defaults[? "version"         ] = VERSION;
	if ( !FORCE_LOCK_MOUSE ) global.options_defaults[? "lock mouse" ] = false;
	global.options_defaults[? "fxaa"            ] = false;
	global.options_defaults[? "animations"      ] = true;
	global.options_defaults[? "transitions"     ] = true;
	global.options_defaults[? "music"           ] = 0.4;
	global.options_defaults[? "sounds"          ] = 0.75;
	global.options_defaults[? "master volume"   ] = 1.0;
	global.options_defaults[? "intro"           ] = false;
	global.options_defaults[? "player name"     ] = "Juju :D"
	global.options_defaults[? "fullscreen"      ] = false;
	global.options_defaults[? "window width"    ] = DEFAULT_WINDOW_WIDTH;
	global.options_defaults[? "window height"   ] = DEFAULT_WINDOW_HEIGHT;
	global.options_defaults[? "window x"        ] = DEFAULT_WINDOW_X;
	global.options_defaults[? "window y"        ] = DEFAULT_WINDOW_Y;
	#endregion
}