import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Dzen

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
  -- which denotes layout choice.
  --
  --myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full) ||| Full
  --where
  ---- default tiling algorithm partitions the screen into two panes
  --tiled   = Tall nmaster delta ratio

  ---- The default number of windows in the master pane
  --nmaster = 1

  ---- Default proportion of screen occupied by master pane
  --ratio   = 3/4

  ---- Percent of screen to increment by when resizing panes
  --delta   = 3/100

  --myLogHook = dynamicLogWithPP dzenPP

  --main = xmonad =<< dzen defaultConfig
  ---- 0.8.1 main:
  --main = dzen xmonad

  main = xmonad $ defaultConfig { 
    modMask = mod4Mask,
            terminal = "urxvt",
            focusedBorderColor = "#FF7247"
              --,
            --layoutHook = myLayout
              --,
            --logHook = myLogHook
  }
