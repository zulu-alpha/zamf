class zebsBriefingHandler
{
	class functions
	{
		file = "zamf\zebs_briefing_handler\fnc";
		class init
		{
			description = "Initializes global variables and registers marker event handler.";
			postInit = 1;
		};
		class checkIfMarkerExists
		{
			description = "Check if the given marker exists.";
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
		class createBriefingAreaMarker
		{
			description = "Create an area marker for the briefing table.";
		};
		class createZebsBriefingTablebySavedAndGivenMarkers
		{
			description = "Creates a marker covering the area defined by the given marker, of which another must have been found before.";
		};
		class sanatizeMarkerArray
		{
			description = "Sanatizes the given marker array, removing any markers that don't exist.";
		};
		class clearBriefingTable
		{
			description = "Clear the briefing table, mark it as cleared and delete the marker.";
		};
	};
};
