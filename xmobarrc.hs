Config {
       font = "xft:Hack Nerd Font Mono:size=12:antialias=true:hinting=true"
       , additionalFonts = [ "xft:Font Awesome 5 Free Solid:pixelsize=12"
                           , "xft:Font Awesome 5 Brands:pixelsize=12"
                           ]
       , bgColor = "#000000"
       , fgColor = "#ffCCDD"
       , alpha = 200
       , position = TopW L 95
       , commands = [ Run Cpu [ "--template" , "\xe0b9 \xf2db <total>%", "-L","0","-H","50","--normal","#ffccdd","--high","darkred"] 10
                    , Run Memory ["-t","\xe0b9 \xf538 <usedratio>%"] 10
                    , Run DiskU [("/", "\xe0b9 \xf0a0 <free> \xe0b9")] ["-L", "20", "-H", "60"] 10
                    -- , Run Swap [] 10
                    , Run Date "%a %d.%m  %H:%M" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " ﬦ  %StdinReader% } %date% { %cpu%  %memory%  %disku%"
       }

