-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import           Data.Monoid
import           System.Exit
import           XMonad                              hiding ((|||))
import           XMonad.ManageHook

import           XMonad.Actions.CycleWS              (nextWS, prevWS, toggleWS)
import           XMonad.Actions.GroupNavigation
import           XMonad.Layout.Gaps
import           XMonad.Layout.Spiral

import           XMonad.Layout.Grid
import           XMonad.Layout.LayoutCombinators
import           XMonad.Layout.MultiToggle
import           XMonad.Layout.MultiToggle.Instances
import           XMonad.Layout.SimpleDecoration      (shrinkText)
import           XMonad.Layout.Tabbed
import           XMonad.Layout.ThreeColumns
import           XMonad.Util.WorkspaceCompare        (getSortByTag, getSortByXineramaPhysicalRule)
-- Removes window borders if they aren't needed
import           XMonad.Layout.NoBorders             (noBorders, smartBorders)
-- Allow gaps to be displayed around windows, for aesthetic purposes

import           XMonad.Layout.Spacing

import           XMonad.Util.NamedScratchpad
import           XMonad.Util.Run
import           XMonad.Util.SpawnOnce

import           XMonad.Hooks.ManageDocks

import qualified Data.Map                            as M
import qualified XMonad.StackSet                     as W

-- Fixes automatic fullscreening of applications
import           XMonad.Hooks.EwmhDesktops

-- Allows us to customise the logHook that sends information to xmobar
import           XMonad.Hooks.DynamicLog

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "kitty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 4

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.

--myModMask       = mod4Mask
myModMask       = mod1Mask 

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
--myWorkspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#555555"
myFocusedBorderColor = "#ffCCDD"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
toggleFloat :: Window -> X ()
toggleFloat w =
  windows
    ( \s ->
        if M.member w (W.floating s)
          then W.sink w s
          --                               Left  Top    Width Height
          else (W.float w (W.RationalRect (1/6) (1/10) (2/3) (8/10)) s)
    )

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), windows W.swapMaster)


    , ((modm .|. controlMask, xK_n), namedScratchpadAction scratchpads "term")
    , ((modm .|. controlMask, xK_e), namedScratchpadAction scratchpads "bpytop")


    , ((modm,               xK_f     ), sendMessage $ Toggle FULL)

    -- launch gmrun
    --, ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)


    -- launch dmenu
    , ((modm,               xK_p     ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_p ), setLayout $ XMonad.layoutHook conf)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), spawn "rofi -show-icons -no-lazy-grab -show drun -modi run,drun,window -terminal kitty -theme paper-float")
    , ((modm,               xK_d ), spawn "rofi -show-icons -no-lazy-grab -show window -modi run,drun,window -terminal kitty -theme paper-float")
    , ((modm .|. shiftMask, xK_d ), spawn "xdg-open \"http://linear.app/caribou/issue/CAR-$(rofi -theme dmenu -p 'Issue #' -dmenu)\"")
    , ((modm .|. shiftMask, xK_v ), spawn "rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}' -theme paper-float")
     --
     -- Rotate through the available layout algorithms
    -- , ((modm .|. shiftMask, xK_space ), spawn "rofi ")

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), nextMatch History (return True))

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), spawn $ XMonad.terminal conf)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused toggleFloat)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    , ((modm              , xK_Escape), toggleWS)
    , ((modm              , xK_Right), nextWS)
    , ((modm              , xK_Left), prevWS)

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- XF86AudioMute
    , ((0, 0x1008ff12), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
      -- XF86AudioRaiseVolume
    , ((0, 0x1008ff13), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
      -- XF86AudioLowerVolume
    , ((0, 0x1008ff11), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]


-- scratchPads
scratchpads :: [NamedScratchpad]
scratchpads = [
-- run htop in xterm, find it by title, use default floating window placement
    -- NS "taskwarrior" "urxvtc -name taskwarrior -e ~/bin/tw" (resource =? "taskwarrior")
    --     (customFloating $ W.RationalRect (2/6) (2/6) (2/6) (2/6)),

    NS "term" "kitty --title scratchpad --class scratchpad" (className =? "scratchpad")
    (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)),

    NS "bpytop" "kitty --title bpytop --class bpytop bpytop" (className =? "bpytop")
    (customFloating $ W.RationalRect 0 0 1 (2/3))


    -- NS "pavucontrol" "pavucontrol" (className =? "Pavucontrol")
    --     (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4))
  ]


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

-- Gaps around and between windows
-- Changes only seem to apply if I log out then in again
-- Dimensions are given as (Border top bottom right left)
mySpacing = spacingRaw False             -- Only for >1 window
                       -- The bottom edge seems to look narrower than it is
                       (Border 10 10 10 10) -- Size of screen edge gaps
                       True             -- Enable screen edge gaps
                       (Border 10 10 10 10) -- Size of window gaps
                       True             -- Enable window gaps


myTabConfig = def { activeColor = "#556064"
                  , inactiveColor = "#2F3D44"
                  , urgentColor = "#FDF6E3"
                  , activeBorderColor = "#454948"
                  , inactiveBorderColor = "#454948"
                  , urgentBorderColor = "#268BD2"
                  , activeTextColor = "#80FFF9"
                  , inactiveTextColor = "#1ABC9C"
                  , urgentTextColor = "#1ABC9C"
                  , fontName = "xft:Victor Mono:size=10:antialias=true"
                  }


myLayout = avoidStruts
    $ mySpacing
    $ mkToggle (NOBORDERS ?? FULL ?? EOT)
    $ (ThreeColMid 1 (3/100) (3/7) ||| tiled ||| Mirror tiled |||  spiral (6/7) ||| Grid)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , title =? "kazam"           --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , namedScratchpadManageHook scratchpads ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myPP = def { ppCurrent = xmobarColor "#1ABC9C" "" . wrap "[" "]"
           , ppTitle = xmobarColor "#1ABC9C" "" . shorten 60
           , ppVisible = wrap "(" ")"
           , ppUrgent  = xmobarColor "red" "yellow"
           , ppSort = getSortByXineramaPhysicalRule def
           }


myLogHook = return ()
-- Symbols for displaying workspaces in xmobar

-- Must be functions, as it expects a different symbol for each
-- myCurrentWsSymbol workspaceName = "[" ++ workspaceName ++ "]" -- The workspace currently active
-- myHiddenWsSymbol  workspaceName =  "|" ++ workspaceName ++ "|"  -- Workspaces with open windows
-- myEmptyWsSymbol   workspaceName =  " " ++ workspaceName ++ " "  -- Workspaces with no windows
myCurrentWsSymbol workspaceName = "\xf111"-- The workspace currently active
myHiddenWsSymbol  workspaceName =  "\xf192"-- Workspaces with open windows
myEmptyWsSymbol   workspaceName =  "\xf10c"-- Workspaces with no windows

-- bar points to the status bar's process handle
-- XMonad.Hooks.DynamicLog (dynamicLogWithPP) allows us to format the output
-- XMonad.Hooks.DynamicLog (xmobarPP) gives us some defaults
myLogHook2 bar = dynamicLogWithPP xmobarPP
        -- Write to bar instead of stdout
        { ppOutput          = hPutStrLn bar
        -- How to order the different sections of the log
        , ppOrder           = \(workspace:layout:title:extras)
                            -> [workspace,layout,title]
        -- Separator between different sections of the log
        , ppSep             = xmobarColor "#ffccdd" ""  " \xf444 "
        , ppTitle = xmobarColor "white" "" . shorten 30
        -- Format the workspace information
        , ppCurrent         = xmobarColor "white" "" . myCurrentWsSymbol
        , ppHidden          = xmobarColor "white" "" . myHiddenWsSymbol
        , ppHiddenNoWindows = xmobarColor "white" "" . myEmptyWsSymbol

        , ppWsSep = xmobarColor "#ffccdd" ""  " \xe0bb "
        , ppLayout = xmobarColor "#ffccdd" "" . myLayoutPrinter
        }

myLayoutPrinter :: String -> String
myLayoutPrinter "Spacing Tall"        = "\xfbfb"
myLayoutPrinter "Spacing Mirror Tall" = "\xfbfa"
myLayoutPrinter "Spacing Spiral"      = "\xf110"
myLayoutPrinter "Spacing ThreeCol"    = "\xf0db"
myLayoutPrinter "Spacing Full"        = "\xf792"
myLayoutPrinter x                     = x

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    spawnOnce "nitrogen --restore &"
    spawnOnce "compton &"
    spawnOnce "greenclip daemon &"
    spawnOnce "systemctl --user start dropbox"
    spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 15 --transparent true --alpha 50 --tint 0x000000 --height 22 --monitor 0 &"
    spawnOnce "dunst &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
    xmproc <- spawnPipe "xmobar -d -x 0 /home/pyrho/.config/xmobar/xmobarrc.hs"
    xmonad
        $ ewmh
        $ docks defaults
            {
                logHook = myLogHook2 xmproc
                        >> historyHook
            }

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
