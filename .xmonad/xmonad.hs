import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Hooks.SetWMName 
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders

myWorkspaces = ["code", "web", "junk" ] ++ map show [4..9]
 
main = do
    conf <- dzen defaultConfig
    xmonad $ conf
        { 
         startupHook = setWMName "LG3D"
        , layoutHook = smartBorders (layoutHook conf)
        ,modMask = mod4Mask
        , terminal = "gnome-terminal"
        , focusedBorderColor = "#FF7247"
        , workspaces = myWorkspaces
        --      , manageHook = composeOne [ isFullscreen -?> doFullFloat ]
        }
         `additionalKeys`
        [ ((modMask conf , xK_p), runOrRaisePrompt defaultXPConfig { position = Top })]

        `additionalKeysP` 
        [ 
        -- Lock Screen
          --("M1-l",    spawn "gnome-screensaver-command -l")
          -- Logout
          --, 
          ("M-S-l", spawn "gnome-session-save --gui --kill")
        ]
