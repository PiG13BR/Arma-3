ARSENAL WHITELIST ROLE BASED By PiG13BR
Credits: KP Liberation (https://github.com/KillahPotatoes/KP-Liberation) - required functions.

This is a form of arsenal whitelist based on role selection.
- To get it working, you need to define the classnames of the roles in the file presets\arsenal\arsenal_presets\role_selection.sqf
- Also, you need to organize all weapons, magazines, items classnames in the file presets\arsenal\arsenal_presets\arsenal_config.sqf
- The whitelist is determined by the role_selection.sqf, that detects what role the player is (by getting the classname that should be defined in the same file), and calls a file in presets\arsenal\arsenal_presets\roles that uses the variables from the arsenal_config.sqf to make the whitelist for that specific role.

The init_config.sqf has some allowed items and blacklist items required to run some functions. You can modify those arrays.

Also, thanks to some of the KP Liberation functions, items loaded outside not listed in the whitelist will be deleted from the player's inventory.