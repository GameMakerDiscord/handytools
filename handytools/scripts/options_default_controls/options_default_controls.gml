/// @description Default controls
/*
	Note: This script is currently limited to defining only one player.
	//TODO Expand default control scheme to include more players (4?)
*/

var _root_list = ds_list_create();
tr_map_add_list( global.options_json, "controls", _root_list );

var _player_map = tr_map_create( "player control mapping" );
tr_list_add_map( _root_list, _player_map );

var _key_map = tr_map_add_map( _player_map, "keyboard mapping", tr_map_create( "keyboard mapping" ) );
var _button_map = tr_map_add_map( _player_map, "gamepad mapping", tr_map_create( "button mapping" ) );

if ( !DEVELOPMENT ) {
	_player_map[? "mode" ] = "KEYBOARD";

	_key_map[? "left"        ] = "LEFT";
	_key_map[? "right"       ] = "RIGHT";
	_key_map[? "fire"        ] = "SPACE";
	_key_map[? "talk"        ] = "T";
	_key_map[? "alt left"    ] = "A";
	_key_map[? "alt right"   ] = "D";
	_key_map[? "alt fire"    ] = "ENTER";
	_key_map[? "back"        ] = "ESCAPE";
	_key_map[? "mouse"       ] = "ANY";
	_key_map[? "sensitivity" ] = 0.5;

	_button_map[? "left"        ] = "DPAD LEFT";
	_button_map[? "right"       ] = "DPAD RIGHT";
	_button_map[? "fire"        ] = "A";
	_button_map[? "talk"        ] = "START";
	_button_map[? "alt left"    ] = "LEFT SHOULDER";
	_button_map[? "alt right"   ] = "RIGHT SHOULDER";
	_button_map[? "alt fire"    ] = "X";
	_button_map[? "back"        ] = "SELECT";
	_button_map[? "mouse"       ] = "A";
	_button_map[? "device"      ] = 0;
	_button_map[? "sensitivity" ] = 5;
} else {
	#region DEVELOPMENT DEFAULTS
	_player_map[? "mode" ] = "KEYBOARD";

	_key_map[? "left"        ] = "LEFT";
	_key_map[? "right"       ] = "RIGHT";
	_key_map[? "fire"        ] = "SPACE";
	_key_map[? "talk"        ] = "T";
	_key_map[? "alt left"    ] = "A";
	_key_map[? "alt right"   ] = "D";
	_key_map[? "alt fire"    ] = "ENTER";
	_key_map[? "back"        ] = "ESCAPE";
	_key_map[? "mouse"       ] = "ANY";
	_key_map[? "sensitivity" ] = 0.5;

	_button_map[? "left"        ] = "DPAD LEFT";
	_button_map[? "right"       ] = "DPAD RIGHT";
	_button_map[? "fire"        ] = "A";
	_button_map[? "talk"        ] = "START";
	_button_map[? "alt left"    ] = "LEFT SHOULDER";
	_button_map[? "alt right"   ] = "RIGHT SHOULDER";
	_button_map[? "alt fire"    ] = "X";
	_button_map[? "back"        ] = "SELECT";
	_button_map[? "mouse"       ] = "A";
	_button_map[? "device"      ] = 0;
	_button_map[? "sensitivity" ] = 5;
	#endregion
}

control_verify_map( _key_map );
control_verify_map( _button_map );