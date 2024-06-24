;;; init-theme.el --- Theming                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Font settings
(set-face-attribute 'default nil :font (font-spec :family "monospace" :size 16))


;; Disable toolbar and  menubar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable welcome screen
(setq inhibit-startup-screen t)

;; Enable line number dislay
(global-display-line-numbers-mode)

;; highlight end of bracket
(show-paren-mode 1)

;; Show column number and file size in modeline
(setq column-number-mode t
      size-indication-mode t)

;; rainbow-delimiters!
(use-package rainbow-delimiters
  :hook
  ((prog-mode . rainbow-delimiters-mode)))

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
