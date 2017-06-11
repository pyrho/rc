===================
Awesome WM Copycats
===================

--------------------------
Themes for Awesome WM 3.5+
--------------------------

:Author: Luke Bonham <dada [at] archlinux [dot] info>
:Version: git
:License: BY-NC-SA_
:Source: https://github.com/copycat-killer/awesome-copycats

Description
===========

A set of themes with the aim of making Awesome_ appearance awesome too!

Notable features
================

- Autohide widgets (*tell me only when you have to*)
- Autostart applications
- Fast MPD and volume shortcuts (first time this trick has been used in Awesome)
- Other shortcuts for copying to the clipboard (no need for clipboard managers), toggle wiboxes, widgets popups, screenshots capture, moving and magnifying clients
- Quake drop-down terminal
- Calendar with current day highlighted and months switch with a click/scroll
- Notifications for new mails, current song, volume level, hdd critical state, low battery
- OpenWeatherMap integration
- Net carrier status notifier
- Colorful autoupdating icons
- Symbolic tag names
- TXT layoutbox
- PNG wibox bar
- Custom layouts
- No borders when there's only one visible client
- Menubar menu
- Vi-like client focus
- Non-empty tag browsing
- Dynamic client borders (colors change along with processes status)
- Dynamic useless gaps
- Dynamic tagging

Gallery
=======

**Multicolor**, inspired by lucamanni_

.. image:: http://dotshare.it/public/images/uploads/650.png

**Powerarrow Darker**, inspired by romockee_

.. image:: http://dotshare.it/public/images/uploads/649.png

**Steamburn**, porting of ok100_'s dwm 

.. image:: http://dotshare.it/public/images/uploads/648.png

**Blackburn**

.. image:: http://dotshare.it/public/images/uploads/553.png

**Dremora**

.. image:: http://dotshare.it/public/images/uploads/652.png

**Rainbow**

.. image:: http://dotshare.it/public/images/uploads/606.png

**Holo**, requested by amouly_

.. image:: http://dotshare.it/public/images/uploads/651.png

**Copland**, inspired by foozer_

.. image:: http://dotshare.it/public/images/uploads/655.png

Installation
============

With Git: ::

    $ git clone --recursive https://github.com/copycat-killer/awesome-copycats.git
    $ mv -bv awesome-copycats/* ~/.config/awesome


otherwise, download awesome-copycats-master_ and lain-master_ archives, extract the first one, extract the second one into the first one, and put the contents of the first one into ``~/.config/awesome``.

Usage
=====

Switch a theme this way: ::

    $ cd ~/.config/awesome
    $ cp rc.lua.theme rc.lua

Alternatively, you can use `switch-theme.sh`_, which will also update to the latest commit.

Then, customize your ``rc.lua`` and restart Awesome (``Mod4 + ctrl + r``).

Notes
=====

Only compatible with **stable** versions of Lua and Awesome (git/unstable versions are *not* supported).

Complements are provided by lain_: be sure to meet its dependencies_.

Fonts are Terminus_ (Multicolor, Powerarrow Darker) and Tamsyn_ (other ones).

Every theme has a colorscheme_.

Blackburn and Dremora use Icons_: be sure to have bitmaps enabled if running under Debian_ or Ubuntu_.

.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0/
.. _Awesome: http://github.com/awesomeWM/awesome
.. _lucamanni: https://github.com/lucamanni/awesome
.. _romockee: https://github.com/romockee/powerarrow
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _foozer: http://dotshare.it/dots/499/
.. _awesome-copycats-master: https://github.com/copycat-killer/awesome-copycats/archive/master.zip
.. _lain-master: https://github.com/copycat-killer/lain/archive/master.zip
.. _`switch-theme.sh`: https://github.com/copycat-killer/awesome-copycats/issues/36
.. _lain: https://github.com/copycat-killer/lain
.. _dependencies: https://github.com/copycat-killer/lain/wiki
.. _Terminus: http://terminus-font.sourceforge.net/
.. _Tamsyn: http://www.fial.com/~scott/tamsyn-font/
.. _colorscheme: https://github.com/copycat-killer/dots/tree/master/.colors
.. _Icons: https://github.com/copycat-killer/dots/tree/master/.fonts
.. _Debian: http://weiwu.sdf.org/100921.html
.. _Ubuntu: https://wiki.ubuntu.com/Fonts#Enabling_Bitmapped_Fonts
