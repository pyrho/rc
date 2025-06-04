;;; early-init.el --- Emacs early init file
;;  Author: pyrho
;;; Commentary:
;;; Code:
(setq default-frame-alist
      (append ;                        Note: if there are any conflicting settings in ‘default-frame-alist’, it is the one that comes first that gets applied.
       '((undecorated-round . t)
         (drag-internal-border . t)
         (internal-border-width . 40))
       default-frame-alist))

; For straight
(setq package-enable-at-startup nil)

;;; early-init.el ends here
