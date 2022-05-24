;;; init-theme.el --- Theming                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Font settings
(add-to-list 'default-frame-alist '(font . "monospace"))

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

;; rainbow-delimiters!
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package all-the-icons)

(use-package doom-themes
  :config
  (load-theme 'doom-vibrant t)
  (doom-themes-neotree-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 15)
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-env-enable-python t))


(provide 'init-theme)
;;; init-theme.el ends here
