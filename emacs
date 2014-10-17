;; Environnement
(set-language-environment "UTF-8")

;; Affichage
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode t)

(setq truncate-partial-width-windows nil)
(setq ring-bell-function 'ignore)

(display-time-mode t)

;; Raccourcis
(global-set-key (kbd "C-c h") 'replace-string)
(global-set-key (kbd "C-c j") 'replace-regexp)
(global-set-key (kbd "C-c o") 'bury-buffer)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c g") 'gdb)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(defun package-safe-install (&rest packages)
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))
    (require package)))
  

  ; Load packages
  (package-safe-install 'evil)
  (evil-mode 1)        ;; enable evil-mode
  )

(defun system-is-my-workpc ()
(interactive)
"Return true if the system we are running on is my PC at work"
(string-equal system-name "PARWD17")
)

(defun system-is-laptop ()
(interactive)
"Return true if the system we are running on is my laptop"
(string-equal system-name "caladan")
)

(if (system-is-my-workpc)
    (setq ownCloudPath 'C:/Users/damien.DASHLANE/ownCloud)
)

(if (system-is-laptop)
    (setq ownCloudPath '~/ownCloud)
)


;(setq org-agenda-files (list (format "%s%s" ownCloudPath "/org/work.org")
;			     (format "%s%s" ownCloudPath "/org/home.org" )))

(setq org-todo-keywords
       '((sequence "TODO" "WAIT" "VERIFY" "|" "DONE")))

(setq org-directory (format "%s%s" ownCloudPath "/org/"))
(setq org-mobile-inbox-for-pull (format "%s%s" ownCloudPath "/org/flagged.org"))
(setq org-mobile-directory (format "%s%s" ownCloudPath "/mobileOrg/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(inhibit-startup-screen t)
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'sanityinc-solarized-light t)

(show-paren-mode 1)

(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 9)))
(define-key global-map "\C-cc" 'org-capture)

(require 'evil-leader)
(require 'evil-org)

 (setq org-agenda-custom-commands
       '(;; match those tagged with :inbox:, are not scheduled, are not DONE.
         ("ii" "[i]nbox tagged unscheduled tasks" tags "-SCHEDULED={.+}/!+TODO|+STARTED|+WAITING")))

