;;; init-theme.el --- Theming                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Font settings
(set-face-attribute 'default nil :font (font-spec :family "Sarasa Term SC" :size 16))
(set-fontset-font t 'han (font-spec :family "Sarasa Gothic SC" :size 16))
(set-fontset-font t 'cjk-misc (font-spec :family "Sarasa Gothic SC" :size 16))
(set-fontset-font t 'kana (font-spec :family "Sarasa Gothic J" :size 16))
(setq inhibit-compacting-font-caches t)

(setq
 ;; Disable welcome screen
 inhibit-startup-screen t
 ;; Precision scrolling
 ;; Use minibuffer instead of dialog boxes
 use-dialog-box nil
 ;; y/n instead of yes/no
 use-short-answers t
 ;; Show column number and file size in modeline
 column-number-mode t
 size-indication-mode t)

;; Enable line number dislay
(global-display-line-numbers-mode)

;; highlight end of bracket
(show-paren-mode 1)

;; rainbow-delimiters!
(use-package rainbow-delimiters
  :hook
  ((prog-mode . rainbow-delimiters-mode)))

;; We install the icons themselves here, integration with other plugins will live in their corresponding place
(use-package nerd-icons)

(use-package doom-themes
  :config
  (load-theme 'doom-vibrant t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-env-enable-python t))

(provide 'init-theme)
;;; init-theme.el ends here
