;;; early-init.el --- Emacs early init file
;;  Author: pyrho
;;; Commentary:
;;; Code:

;; Set compiler environment variables
(setenv "CC" "gcc-15")
(setenv "CXX" "g++-15")
(setq native-comp-driver-options
      '("-I/opt/homebrew/include"
        "-L/opt/homebrew/lib/gcc/15"
        "-lgccjit"))
(setq default-frame-alist
      (append ;                        Note: if there are any conflicting settings in ‘default-frame-alist’, it is the one that comes first that gets applied.
       '((undecorated-round . t)
         (drag-internal-border . t)
         (internal-border-width . 40))
       default-frame-alist))

;; For straight
(setq package-enable-at-startup nil)

;; This is needed for lsp-booster
;; See https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization
(setenv "LSP_USE_PLISTS" "true")


;; See https://stackoverflow.com/questions/15390178/emacs-and-symbolic-links
;; Always follow links
(setq vc-follow-symlinks t)


;;; early-init.el ends here
