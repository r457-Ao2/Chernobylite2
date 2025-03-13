# Chernobylite2
 Chernobylite2 fixes & mods

## r457FixZAxis - Fix for NPCs falling through the bunker floor

You need this fix if you're stuck with your save because NPCs you were bringing to your base are placed underground so you can't interact with them.

**It's a critical game-breaking progression-blocking bug that needs to be fixed ASAP! Because if you can't interact with your companions, you can't learn skills nor do quests!**

[Download and install the latest UE4SS version](url=https://github.com/UE4SS-RE/RE-UE4SS/releases) (ue4ss folder and dwmapi.dll should go into the \[Path to Steam Library\]\\steamapps\\common\\Chernobylite 2\\Chernobylite2\\Binaries\\Win64 folder).

Download the mod's package from the releases tab and unzip its contents into the \[Path to Steam Library\]\\steamapps\\common\\Chernobylite 2\\Chernobylite2\\Binaries\\Win64\\ue4ss\\Mods folder.

File structure should look like this:
\[Path to Steam Library\]\\steamapps\\common\\Chernobylite 2\\Chernobylite2\\Binaries\\Win64\\ue4ss\\Mods\\r457FixZAxis\\Scripts\\main.lua
\[Path to Steam Library\]\\steamapps\\common\\Chernobylite 2\\Chernobylite2\\Binaries\\Win64\\ue4ss\\Mods\\r457FixZAxis\\enabled.txt

In game load your broken save, go to the bunker, stand close to the NPC you're trying to "rescue" and press F1. The NPC should "pop" to its proper place (see screenshots here: https://imgur.com/a/EpP2kA3). Repeat with all the bugged NPCs. Make a new save.

You can rename dwmapi.dll to ~dwmapi.dll to turn UE4SS off and play as usual. Rename the file back and repeat the procedure if any of the other NPCs end up under the bunker floor.