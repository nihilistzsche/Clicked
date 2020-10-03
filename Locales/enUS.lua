local L = LibStub("AceLocale-3.0"):NewLocale("Clicked", "enUS", true)

-- The localized addon name
L["NAME"] = "Clicked"

-- Only errors that could be shown to the user are localized,
-- there are several error strings in the source code that could
-- only happen in a development environment.

-- If an error occurred while registering a frame for click and hovercasting,
-- this error will be shown.
-- Example: "Clicked: Unable to register unit frame: PlayerFrame"
L["ERR_FRAME_REGISTRATION"] = "|cffe31919Clicked|r: Unable to register unit frame: %s"

-- If another addon is installed and enabled that Clicked is incompatible with,
-- this error message will be shown prompting the user to disable one of the two
-- addons.
-- Example: "Clicked is not compatbile with Clique and requires one of the two to be disabled."
-- Example: "Keep Clicked" "Keep Clique"
L["ERR_ADDON_INCOMPATIBILITY"] = "Clicked is not compatible with %s and requires one of the two to be disabled."
L["ERR_ADDON_INCOMPATIBILITY_KEEP"] = "Keep %s"

-- If Clicked was recently updated and the profile database format has changed,
-- this message is printed in the user's chat window.
-- Example: "Clicked: Upgraded profile from version 0.4.0 to version 0.5.0"
L["MSG_PROFILE_UPDATED"] = "|cffe31919Clicked|r: Upgraded profile from version %s to version %s"
L["MSG_POPUP_OK"] = "Continue"

-- Everything prefixed with CFG_UI is shown in the main binding configuration
-- window.

L["CFG_UI_TITLE"] = "Clicked Binding Configuration"

-- Status text in the bottom left of the configuration window,
-- the contents are "VERSION - CURRENT_PROFILE", e.g. 0.7.0 | Alloxa - Kazzak

L["CFG_UI_STATUS_TEXT"] = "%s | %s"

-- Tree items are used for the main bindings list
L["CFG_UI_TREE_LABEL_CAST"] = "Cast %s"
L["CFG_UI_TREE_LABEL_USE"] = "Use %s"
L["CFG_UI_TREE_LABEL_RUN_MACRO"] = "Run custom macro"
L["CFG_UI_TREE_LABEL_TARGET_UNIT"] = "Target the unit"
L["CFG_UI_TREE_LABEL_UNIT_MENU"] = "Open the unit menu"
L["CFG_UI_TREE_LOAD_STATE_LOADED"] = "L"
L["CFG_UI_TREE_LOAD_STATE_UNLOADED"] = "U"
L["CFG_UI_TREE_TOOLTIP_LOAD_STATE_LOADED"] = "Loaded"
L["CFG_UI_TREE_TOOLTIP_LOAD_STATE_UNLOADED"] = "Not loaded"
L["CFG_UI_TREE_TOOLTIP_TARGETS"] = "Targets"
L["CFG_UI_TREE_TOOLTIP_MACRO"] = "Macro"

L["CFG_UI_BINDING_CREATE"] = "Create"
L["CFG_UI_BINDING_DUPLICATE"] = "Duplicate"
L["CFG_UI_BINDING_COPY"] = "Copy"
L["CFG_UI_BINDING_PASTE"] = "Paste"
L["CFG_UI_BINDING_DELETE"] = "Delete"
L["CFG_UI_BINDING_DELETE_CONFIRM_LINE1"] = "Are you sure you want to delete this binding?"
L["CFG_UI_BINDING_DELETE_CONFIRM_LINE2"] = "%s %s"
L["CFG_UI_BINDING_SEARCH_PLACEHOLDER"] = "Search..."
L["CFG_UI_BINDING_SET_TOOLTIP"] = "Press a key to bind, or ESC to clear the binding."
L["CFG_UI_BINDING_UNBOUND"] = "UNBOUND"

-- Action items are used on the main binding action page

-- The tab item name
L["CFG_UI_ACTION"] = "Actions"

-- Help and other informative labels
L["CFG_UI_ACTION_RESTRICTED"] = "Note: Bindings using the left or right mouse button are considered restricted and will always be hovercast bindings."

-- The various actions that a binding can perform
L["CFG_UI_ACTION_TYPE"] = "Action"
L["CFG_UI_ACTION_TYPE_SPELL"] = "Cast a spell"
L["CFG_UI_ACTION_TYPE_ITEM"] = "Use an item"
L["CFG_UI_ACTION_TYPE_MACRO"] = "Run a macro (advanced)"
L["CFG_UI_ACTION_TYPE_MACRO_HELP"] = "|cffffff00The \"Cast a spell\" and \"Use an item\" action types support most macro functionality and should be preferred over custom macros. Custom macros are available as a fallback option if you're trying to acomplish something not covered by those. If you feel those actions are missing options and you have to resort to using custom macros please leave a comment on CurseForge or on GitHub.|r"
L["CFG_UI_ACTION_TYPE_UNIT_TARGET"] = "Target the unit"
L["CFG_UI_ACTION_TYPE_UNIT_MENU"] = "Open the unit menu"

-- Basic options for all binding types
L["CFG_UI_ACTION_TARGET_SPELL"] = "Target Spell"
L["CFG_UI_ACTION_TARGET_SPELL_BOOK"] = "Pick from spellbook"
L["CFG_UI_ACTION_TARGET_SPELL_BOOK_HELP"] = "Click on a spell book entry to select it."
L["CFG_UI_ACTION_TARGET_ITEM"] = "Target Item"
L["CFG_UI_ACTION_TARGET_ITEM_HELP"] = "Tip: You can shift-click an item in your bags when the input field is selected to autofill."
L["CFG_UI_ACTION_MACRO_TEXT"] = "Macro Text"
L["CFG_UI_ACTION_MACRO_HOVERCAST_HELP"] = "This macro will only execute when hovering over unit frames, in order to interact with the selected target use the [@mouseover] conditional."
L["CFG_UI_ACTION_MACRO_NAME_ICON"] = "Macro Name and Icon (optional)"
L["CFG_UI_ACTION_MACRO_ICON_SELECT"] = "Select"
L["CFG_UI_ACTION_OPTIONS_MACRO_MODE_FIRST"] = "Run first (default)"
L["CFG_UI_ACTION_OPTIONS_MACRO_MODE_APPEND"] = "Append after bindings"
L["CFG_UI_ACTION_OPTIONS_MACRO_MODE_APPEND_HELP"] = "This mode will directly append the macro text onto an automatically generated command generated by other bindings using the specified keybind. Generally, this means that it will be the last section of an '/use' command.\n\nWith this mode you're not writing a macro command. You're adding parts to an already existing command, so writing '/use Holy Light' will not work, in order to cast Holy Light simply type 'Holy Light"
L["CFG_UI_ACTION_OPTIONS_MACRO_MODE_LAST"] = "Run last"

-- additional options
L["CFG_UI_ACTION_OPTIONS"] = "Options"
L["CFG_UI_ACTION_OPTIONS_INTERRUPT_CURRENT_CAST"] = "Interrupt current cast"

-- Target items are used on the binding target options page

L["CFG_UI_TARGET"] = "Targets"
L["CFG_UI_ACTION_TARGET_UNIT"] = "On this target"
L["CFG_UI_ACTION_TARGET_UNIT_EXTRA"] = "Or"
L["CFG_UI_ACTION_TARGET_UNIT_PLAYER"] = "Player (you)"
L["CFG_UI_ACTION_TARGET_UNIT_GLOBAL"] = "Global (no target)"
L["CFG_UI_ACTION_TARGET_UNIT_TARGET"] = "Target"
L["CFG_UI_ACTION_TARGET_UNIT_TARGETTARGET"] = "Target of target"
L["CFG_UI_ACTION_TARGET_UNIT_MOUSEOVER"] = "Mouseover target"
L["CFG_UI_ACTION_TARGET_UNIT_HOVERCAST"] = "Unit frame"
L["CFG_UI_ACTION_TARGET_UNIT_FOCUS"] = "Focus target"
L["CFG_UI_ACTION_TARGET_UNIT_CURSOR"] = "Cursor position"
L["CFG_UI_ACTION_TARGET_UNIT_PARTY"] = "Party %s"
L["CFG_UI_ACTION_TARGET_UNIT_NONE"] = "<No one>"
L["CFG_UI_ACTION_TARGET_UNIT_REMOVE"] = "<Remove this option>"

-- Used for target hostility filters (dynamic prioritization)
L["CFG_UI_ACTION_TARGET_HOSTILITY_ANY"] = "Either friendly or hostile"
L["CFG_UI_ACTION_TARGET_HOSTILITY_FRIEND"] = "Friendly"
L["CFG_UI_ACTION_TARGET_HOSTILITY_HARM"] = "Hostile"
L["CFG_UI_ACTION_TARGET_STATUS_ANY"] = "Either dead or alive"
L["CFG_UI_ACTION_TARGET_STATUS_ALIVE"] = "Alive"
L["CFG_UI_ACTION_TARGET_STATUS_DEAD"] = "Dead"

-- Load items are used on the binding load options page

L["CFG_UI_LOAD"] = "Load Options"
L["CFG_UI_LOAD_NEVER"] = "Never load"
L["CFG_UI_LOAD_SPECIALIZATION"] = "Talent specialization"
L["CFG_UI_LOAD_TALENT"] = "Talent selected"
L["CFG_UI_LOAD_PVP_TALENT"] = "PvP talent selected"
L["CFG_UI_LOAD_WAR_MODE"] = "War Mode"
L["CFG_UI_LOAD_WAR_MODE_TRUE"] = "War Mode enabled"
L["CFG_UI_LOAD_WAR_MODE_FALSE"] = "War Mode disabled"
L["CFG_UI_LOAD_STANCE"] = "Stance"
L["CFG_UI_LOAD_STANCE_NONE"] = "No stance"
L["CFG_UI_LOAD_COMBAT"] = "Combat"
L["CFG_UI_LOAD_COMBAT_TRUE"] = "In combat"
L["CFG_UI_LOAD_COMBAT_FALSE"] = "Not in combat"
L["CFG_UI_LOAD_SPELL_KNOWN"] = "Spell known"
L["CFG_UI_LOAD_IN_GROUP"] = "In group"
L["CFG_UI_LOAD_IN_GROUP_SOLO"] = "Not in a group"
L["CFG_UI_LOAD_IN_GROUP_PARTY"] = "In a party"
L["CFG_UI_LOAD_IN_GROUP_RAID"] = "In a raid group"
L["CFG_UI_LOAD_IN_GROUP_PARTY_OR_RAID"] = "In a party or raid group"
L["CFG_UI_LOAD_PLAYER_IN_GROUP"] = "Player in group"

-- Everything prefixed with OPT is shown in the interface options UI

L["OPT_GENERAL_MINIMAP_NAME"] = "Enable minimap icon"
L["OPT_GENERAL_MINIMAP_DESC"] = "Enable or disable the minimap icon."
L["OPT_GENERAL_CAST_ON_KEY_DOWN_NAME"] = "Cast on key down rather than key up"
L["OPT_GENERAL_CAST_ON_KEY_DOWN_DESC"] = "This option will make bindings trigger on the 'down' portion of a button press rather than the 'up' portion."
L["OPT_GENERAL_CAST_ON_KEY_DOWN_POPUP"] = "If you are using custom unit frames you may have to adjust a setting within the unit frame configuration panel to enable support for this, and potentially even a UI reload.\n\nFor |cff1784d1ElvUI|r, check the box at: \n/ec -> UnitFrames -> Target On Mouse-Down, and reload the UI."
L["OPT_PROFILES_NAME"] = "Profiles"
L["OPT_BLACKLIST_TITLE"] = "Frame Blacklist"
L["OPT_BLACKLIST_HELP"] = "If you want to exclude certain unit frames from click-cast functionality, you can tick the boxes next to each item in order to blacklist them. This will take effect immediately."
