if ( gamepad_number_connected() <= 0 ) control_set( 0, "mode", KEYBOARD );

for( var _p = 0; _p < MAX_PLAYERS; _p++ ) {
    
    var _player_map = controls_list[| _p ];
    if ( _player_map[?"remote"] ) continue;
    
    var _mouse_map = _player_map[?"mouse"];
    _mouse_map[?"dx"] = 0;
    _mouse_map[?"dy"] = 0;
    var _state_map = _player_map[?"state"];
    
    switch ( _player_map[?"mode"] ) {
        
        case KEYBOARD:
            #region KEYBOARD
            
            var _mapping_map = _player_map[? "keyboard mapping" ];
            var _sensitivity = _mapping_map[? "sensitivity" ];
            
            for( var _i = 0; _i < global.control_master_total; _i++ ) {
                var _control = global.control_master_list[| _i ];
                var _key = _mapping_map[? _control ];
                if ( keyboard_check_pressed(  _key ) ) _state_map[?_control] = CTRL_PRESSED  else
                if ( keyboard_check(          _key ) ) _state_map[?_control] = CTRL_HELD     else
                if ( keyboard_check_released( _key ) ) _state_map[?_control] = CTRL_RELEASED else
                                                       _state_map[?_control] = CTRL_OFF;
            }
            
            var _control = "mouse";
            var _key = _mapping_map[?_control];
            if ( mouse_check_button_pressed(  _key ) ) _state_map[?_control] = CTRL_PRESSED  else
            if ( mouse_check_button(          _key ) ) _state_map[?_control] = CTRL_HELD     else
            if ( mouse_check_button_released( _key ) ) _state_map[?_control] = CTRL_RELEASED else
                                                       _state_map[?_control] = CTRL_OFF;
            
            if ( options_get( "lock mouse", FORCE_LOCK_MOUSE, true ) && _mouse_map[? "lock" ] ) {
                
                /*
                _mouse_map[?"point x"] += _sensitivity * ( cam_mouse_x() - window_get_width()/2 );
                _mouse_map[?"point y"] += _sensitivity * ( cam_mouse_y() - window_get_height()/2 );
                
                _mouse_map[?"aim x"] += _sensitivity * ( cam_mouse_x() - window_get_width()/2 );
                _mouse_map[?"aim x"] += _sensitivity * ( cam_mouse_y() - window_get_height()/2 );
                */
                
                var _dx = 0;
                var _dy = 0;
                if ( time_has_passed( _mouse_map[? "lock time" ], 50 ) ) {
                    var _dx = _sensitivity * ( window_mouse_get_x() - window_get_width()/2 );
                    var _dy = _sensitivity * ( window_mouse_get_y() - window_get_height()/2 );
                }
                
                _mouse_map[?"point x"] += _dx;
                _mouse_map[?"point y"] += _dy;
                
                _mouse_map[?"aim x"] += _dx;
                _mouse_map[?"aim y"] += _dy;
                
                _mouse_map[?"dx"] = _dx;
                _mouse_map[?"dy"] = _dy;
                
                window_mouse_set( window_get_width()/2, window_get_height()/2 );
                
            } else {
                /*
                _mouse_map[?"point x"] = cam_mouse_x();// * room_width  / window_get_width();
                _mouse_map[?"point y"] = cam_mouse_y();// * room_height / window_get_height();
                */
                _mouse_map[?"point x"] = window_mouse_get_x();
                _mouse_map[?"point y"] = window_mouse_get_y();
            }
            
            #endregion
        break;
        
        case GAMEPAD:
            #region GAMEPAD
            
            var _mapping_map = _player_map[?"gamepad mapping"];
            var _device      = _mapping_map[?"device"];
            var _sensitivity = _mapping_map[?"sensitivity"];
            
            for( var _i = 0; _i < global.control_master_total; _i++ ) {
                var _control = global.control_master_list[| _i ];
                var _key = _mapping_map[? _control ];
                if ( gamepad_button_check_pressed(  _device, _key ) ) _state_map[?_control] = CTRL_PRESSED  else
                if ( gamepad_button_check(          _device, _key ) ) _state_map[?_control] = CTRL_HELD     else
                if ( gamepad_button_check_released( _device, _key ) ) _state_map[?_control] = CTRL_RELEASED else
                                                                      _state_map[?_control] = CTRL_OFF;
            }
            
            var _control = "mouse";
            var _key = _mapping_map[?_control];
            if ( gamepad_button_check_pressed(  _device, _key ) ) _state_map[?_control] = CTRL_PRESSED  else
            if ( gamepad_button_check(          _device, _key ) ) _state_map[?_control] = CTRL_HELD     else
            if ( gamepad_button_check_released( _device, _key ) ) _state_map[?_control] = CTRL_RELEASED else
                                                                  _state_map[?_control] = CTRL_OFF;
            
            var _lx = gamepad_axis_value( _device, gp_axislh );
            var _ly = gamepad_axis_value( _device, gp_axislv );
        
            if ( abs( _lx ) > 0.2 ) _mouse_map[?"point x"] += _sensitivity * _lx;
            if ( abs( _ly ) > 0.2 ) _mouse_map[?"point y"] += _sensitivity * _ly;
            
            _mouse_map[?"aim x"] = _lx;
            _mouse_map[?"aim y"] = _ly;
                
            _mouse_map[?"dx"] = _lx;
            _mouse_map[?"dy"] = _ly;
            
            #endregion
        break;
        
    }
    
    _mouse_map[?"point x"] = clamp( _mouse_map[?"point x"], 0, room_width );
    _mouse_map[?"point y"] = clamp( _mouse_map[?"point y"], 0, room_height );
    
}