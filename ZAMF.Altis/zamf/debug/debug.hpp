private ["_formatArray", "_stringArray"];

zamf_debug = (!isNil "zamf_debug") && {zamf_debug};

#define zamf_DEBUG(TEXT, PARAMS) if (zamf_debug) then { _formatArray = ["    " + TEXT ]; _stringArray = [ __FILE__ , "\"] call BIS_fnc_splitString; {_formatArray set [count _formatArray, _x]} forEach PARAMS ; diag_log "                       "; diag_log "-------ZAM DEBUG-------"; diag_log ( (_stringArray select ((count _stringArray) - 1)) + "  Line " + #__LINE__  ); diag_log format _formatArray; diag_log "-----------------------"; diag_log "                       ";};