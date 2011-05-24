import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Hooks.SetWMName 
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
 
main = do
    conf <- dzen defaultConfig
    xmonad $ conf
        { 
         startupHook = setWMName "LG3D"
        , layoutHook = smartBorders (layoutHook conf)
        ,modMask = mod4Mask
        , terminal = "urxvt"
        , focusedBorderColor = "#FF7247"
        --      , manageHook = composeOne [ isFullscreen -?> doFullFloat ]
        }
         `additionalKeys`
        [ ((modMask conf , xK_p), runOrRaisePrompt defaultXPConfig { position = Top })]
