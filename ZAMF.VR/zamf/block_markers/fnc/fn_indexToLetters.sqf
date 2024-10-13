// Takes an index and converts it to a human readable capital letter representation.
// For example, 2, will provide `C`, and 26, and 26 will produce `AA`;
// Only 701 Indicies are supported.
params ["_index"];
private _len_alphabet = 26;
private _starting_char_i = 65;
private _no_prefix_letter = -1;
if (_index < 0) then {
throw "Index must be greater than 0!";
};
private _times_larger_than_alphabet = floor (_index / _len_alphabet);
if (_times_larger_than_alphabet > _len_alphabet) throw "Only 701 indicies can be handled!";
private _prefix_letter = _no_prefix_letter;
private _letter = _index + _starting_char_i;
if (_times_larger_than_alphabet > 0) then {
_prefix_letter = _times_larger_than_alphabet + _starting_char_i - 1;
};
_letter = _letter - (_times_larger_than_alphabet * _len_alphabet);
private _letters = [_letter];
if (_prefix_letter > _no_prefix_letter) then {
_letters insert [0, [_prefix_letter], false];
};
toString _letters
