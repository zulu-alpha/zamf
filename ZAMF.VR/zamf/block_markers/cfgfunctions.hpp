class blockMarkers
{
	class functions
	{
		file = "zamf\block_markers\fnc";
		class init
		{
			description = "Initializes global variables and registers marker event handler.";
			preInit = 1;
		};
		class indexToLetters
		{
			description = "Takes an index and converts it to a human readable capital letter representation.";
		};
		class indexToColor
		{
			description = "Takes an index and converts it to a color.";
		};
		class createBuildingMarkersForBlock
		{
			description = "Creates markers for all the buildings in a block.";
		};
		class createUserCreatedMarkerName
		{
			description = "Create a marker name that is user generated, using the given index.";
		};
		class checkIfMarkerExists
		{
			description = "Check if the given marker exists.";
		};
		class getNextMarkerIndex
		{
			description = "Get the next marker index.";
		};
		class getUniqueUserCreatedMarkerName
		{
			description = "Create a unique, user generated marker name.";
		};
		class getAllBuildingsInArea
		{
			description = "Gets all the buildings in a rectangular area, defined by it's sides and angle.";
		};
		class getDirectionOfAnyMarker
		{
			description = "Gets the direction of the first marker that isn't 0, else 0";
		};
		class getAbsoluteDifferenceBetweenAngles
		{
			description = "Gets the absolute difference between two angles.";
		};
		class getSideALength
		{
			description = "Given the angle between 2 markers, and the length of the side, gets the length of side A.";
		};
		class getSideBLength
		{
			description = "Given the angle between 2 markers, and the length of the side, gets the length of side B.";
		};
		class getCenterCoordinatesBetweenTwoMarkers
		{
			description = "Gets the center coordinates between 2 markers.";
		};
		class getAreaDefinition
		{
			description = "Gets an area definition from two given markers.";
		};
		class getNextBlockIndex
		{
			description = "Gets the next block index.";
		};
		class createBlockMarker
		{
			description = "Create a marker for the next block (according to the blockMarkers_var_block_index variable).";
		};
		class createAllBlockMarkersIfDefinedAreaBySavedAndGivenMarkers
		{
			description = "Creates markers for all the buildings in a block, using the given marker, of which another must have been found before.";
		};
		class sanatizeMarkerArray {
			description = "Sanatizes the given marker array, removing any markers that don't exist.";
		};
	};
};