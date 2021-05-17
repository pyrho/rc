Config {
       font = "xft:Hack Nerd Font Mono:size=12:antialias=true:hinting=true"
       , additionalFonts = [ "xft:Font Awesome 5 Free Solid:pixelsize=12"
                           , "xft:Font Awesome 5 Brands:pixelsize=12"
                           ]
       , bgColor = "#000000"
       , fgColor = "#22CCDD"
       , alpha = 200
       , position = TopW L 85
       , commands = [ Run Cpu [ "--template" , "\xe0b9 \xf2db <total>%", "-L","0","-H","50","--normal","#1ABC9C","--high","darkred"] 10
                    , Run Memory ["-t","\xe0b9 \xf538 <usedratio>%"] 10
                    , Run DiskU [("/", "\xe0b9 \xf0a0 <free>")] ["-L", "20", "-H", "60"] 10
                    -- , Run Swap [] 10
                    , Run Date "\xe0b9 \xf017 %a %d.%m. %H:%M \xe0b9" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %cpu%  %memory%  %disku%  %date%"
       }

