// Given the angle between 2 markers, and the length of the side, gets the length of side B.
params ["_angle", "_markers_dist"];
abs (_markers_dist * cos _angle)
