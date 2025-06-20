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

;; Set default font for all frames (including daemon)
;; (setq default-frame-alist
;;       (append '((font . "Aporetic Serif Mono-18"))
;;               default-frame-alist))

;; Set additional face types
;; (defun pyrho--set-variable-pitch ()
;;   (when (member "Aporetic Sans" (font-family-list))
;;     (set-face-attribute 'variable-pitch nil :font "Aporetic Sans" :height 180)))

;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame
;;                   (pyrho--set-variable-pitch))))
;;   (pyrho--set-variable-pitch))

;;; early-init.el ends here
