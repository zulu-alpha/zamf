# Zulu-Alpha Mission Framework (ZAMF)

Mission template for rapid development of Zulu-Alpha missions and events. The ZAMF automatically manages all gear and crates for the Zulu-Alpha units. This is managed with the `init` field of the ZAMF units and crates. See ***CUSTOMIZE*** for more.

## BASIC USAGE:

1. Copy The contents of this folder (Specifically the ***ZAMF.Altis*** folder) into your Arma 3 missions folder. `
"C:\Users\< YOUR USERNAME >\Documents\Arma 3 - Other Profiles\zeMuppet\mpmissions"`

2. Change the folder name to suit your requirements:
 * Change the folder name to match your mission name according to the following template: `co@<NUMBER_OF_PLAYERS>_<MISSION_NAME>_V<VERSION_NUMBER>.<TERRAIN>`
 * **< NUMBER\_OF\_PLAYERS >**: Recommended number of players that the mission is designed for
 * **< MISSION\_NAME >**:The name of your mission with underscores  `_` between words.
 * **< VERSION\_NUMBER >**: Recommended number of players that the mission is designed for.
 * **< TERRAIN >**: Change the ***.Altis*** file extension to match the terrain you require for your mission.
 * **Example:** `co@16_Operation_Awesome_V1.Tanoa`

3. Open your mission in Arma 3's ED3N Mission editor and move the pre-made the ZAMF components to your mission's staging point.
> **NOTE:** When opening the ZAMF on a different terrain for the first time, the assets will most likely appear way off map. Select everything and drag it to the map's defined area. You can use the X and Y coordinates at the bottom of the ED3N screen to find your way. Head for 0, 0.
> **NOTE:** When moving items in ED3N pay special attention to the ZAMF ++Respawn marker++ as it can only be moved from the map view, or by selecting it in the Asset Browser in the left side of the ED3N window and setting it's X and Y coordinates manually. *Place this marker where players will respawn.*

4. Using ED3N's Toolbar, set the Mission name, Description and Mission Author fields. These will be shown at the mission selection screen (and not the mission folder name). *Keep track of your version numbers here too!*

5. Make your mission as you would any other ED3N mission by placing assets, objectives, markers and triggers.

## DEPLOY YOUR MISSION
1. Make sure that the mission is saved and that the Mission parameters such as *Independant* allegiance, mission name and author have been set.
2. Save the mission.
3. Using the ED3N Toolbar, click `File -> Export -> To MP Mission`
4. You can now `ALT+TAB` out of game and navigate to your Arma 3 Installation directory. Default:`C:\Program Files (x86)\Steam\steamapps\common\Arma 3\MPMissions`
5. Use the FTP server (Details in the Missions Office) to transfer the mission **PBO** file to the Zulu-Alpha server.
6. Test on the server

## CUSTOMIZE:

* To customize all ZAMF crates and gear loadouts, edit the following files respectively:
 * `loadout\crates.sqf`
 * `loadout\gear.sqf`

> Editing the Script files can be made a LOT simpler by using the right tools. Have a look at [Visual Studio Code](https://code.visualstudio.com/) with the [SQF Launguage](https://marketplace.visualstudio.com/items?itemName=Armitxes.sqf) and [SQF Lint](https://marketplace.visualstudio.com/items?itemName=skacekachna.sqflint) addons.

>**NOTE:** You will need the classnames of the objects you wish to place into the scripts. These can be cound by using the *Arma 3 Aresnal* tool (Under Bootcamp) from the Arma 3 Main Menu. Create a loadout containing the gear you want and click the `Copy` button at the bottom of the *Arsenal* window. Then `Alt+Tab` out of game and open Notepad or other equivalent text editor. Use `CTRL+V` to paste the text description of your loadout, from which you can find the classnames you need to use.

* To change settings such as `View Distance` edit the `cba_settings.sqf` file.

## NOTES:

* When saving the mission with a new file name from the Arma 3 ED3N editor, a new folder is created and only the *mission.sqm* is copied to the new folder. **Make sure to copy over the rest of the ZAMF files ++(NOT THE OLD MISSION.SQM)++ from the previous mission folder**
* Keep mission files as small as possible.



