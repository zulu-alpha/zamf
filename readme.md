# Zulu-Alpha Mission Framework (ZAMF)

Mission template for rapid development of Zulu-Alpha missions and events. The ZAMF automatically manages all gear and crates for the Zulu-Alpha units. This is managed with the `init` field of the ZAMF units and crates. See ***CUSTOMIZE*** for more.

## BASIC USAGE:

1. Create a new mission in the eden editor and save before doing anything else with the following mission name format:
`co@<NUMBER OF PLAYERS>_<MISSION NAME>_V<VERSION NUMBER>.<TERRAIN>`

    * **< NUMBER OF PLAYERS >**: Recommended number of players that the mission is designed for
    * **< MISSION NAME >**: The name of your mission without underscores `_` or spaces between words.
    * **< VERSION NUMBER >**: Version of format `v#-#-#`, where the `#`s are major, minor and patch respectively. **Major** is usually just `1` and only incremented when the mission is remade, **minor** is incremented from `0` whenever a new feature is added and a **fix** is incremented without adding a new feature.
    * **< TERRAIN >**: Leave as is as this represents the name of the terrain the mission was saved with.
    * **Example:** `co@16_OperationAwesome_V1-0-0.Tanoa`

2. Copy the ***ZAMF.Altis*** folder into your Arma 3 missions folder, located in `
"C:\Users\< YOUR USERNAME >\Documents\Arma 3 - Other Profiles\zeMuppet\mpmissions"`

3. Copy all the contents of the ***ZAMF.Altis*** folder into your new mission, except for the ***mission.sqm*** file

4. Open the ***ZAMF.Altis*** folder the Eden editor, select all the objects in marker mode so as to make sure to also select any hidden markers, press ***Ctrl+c*** for copy on your keyboard, open your new mission in the eden editor, move your mouse where you want to the players to start from and then press ***Ctrl+v*** for paste on your keyboard.

4. Using ED3N's Toolbar, set the Mission name, Description and Mission Author fields. These will be shown at the mission selection screen (and not the mission folder name).
    * You can use the exact same mission name format as above, except to make it look nicer in the mission selection screen, do these differently:
    * **< MISSION NAME >**: You can use spaces between the words. You didn't use spaces before as Arma does not save folder names with spaces.
    * **< VERSION NUMBER >**: Version of format `v#.#.#`. You did not use `.` before for safety with regards to file name extensions.

5. Make your mission as you would any other ED3N mission by placing assets, objectives, markers and triggers.

## DEPLOY YOUR MISSION

1. Make sure that the mission is saved and that the Mission parameters such as *Independant* allegiance, mission name and author have been set.
2. Save the mission. Make 
3. Using the ED3N Toolbar, click `File -> Export -> To MP Mission`
4. You can now `ALT+TAB` out of game and navigate to your Arma 3 Installation directory. Default:`C:\Program Files (x86)\Steam\steamapps\common\Arma 3\MPMissions`
5. Use the FTP server (Details in the Missions Office) to transfer the mission **PBO** file to the Zulu-Alpha server.
6. Test on the server

When you what to upload a new version of your mission:

1. In the ED3N's Toolbar, increment the version number of your mission by editing it's name,
2. Export as before.
3. Rename the exported mission **PBO** file in order to as you did in the first step.
4. Upload via FTP as you normally do.

> You rename themission **PBO** instead of the mission folder name in the ED3N editor, because when you do it in the editor, it creates a brand new folder with nothing in it other than the *mission.sqm* file. If you do want to rename the folder this way, then **Make sure to copy over the rest of the ZAMF files ++(NOT THE OLD MISSION.SQM)++ from the previous mission folder**

## CUSTOMIZE:

* To customize all ZAMF crates and gear loadouts, edit the following files respectively:
 * `loadout\crates.sqf`
 * `loadout\gear.sqf`

> Editing the Script files can be made a LOT simpler by using the right tools. Have a look at [Visual Studio Code](https://code.visualstudio.com/) with the [SQF Launguage](https://marketplace.visualstudio.com/items?itemName=Armitxes.sqf) and [SQF Lint](https://marketplace.visualstudio.com/items?itemName=skacekachna.sqflint) addons.

> If you would like to use the ED3N editor to edit the loadouts of players, then change `"grunt"` in the script call of player's init field to `False` in order to preserve the team settings but not use ZAMF loadouts.

>**NOTE:** You will need the classnames of the objects you wish to place into the scripts. These can be found by using the *Arma 3 Aresnal* tool (Under Bootcamp) from the Arma 3 Main Menu. Create a loadout containing the gear you want and click the `Copy` button at the bottom of the *Arsenal* window. Then `Alt+Tab` out of game and open Notepad or other equivalent text editor. Use `CTRL+V` to paste the text description of your loadout, from which you can find the classnames you need to use.

* To change settings such as Night Vision settings, edit the `cba_settings.sqf` file.

## NOTES:

* Keep mission files as small as possible.



