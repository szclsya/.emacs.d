;;; init-theme.el --- Theming                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Font settings
(add-to-list 'default-frame-alist '(font . "monospace"))

;; Disable toolbar and  menubar
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

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

;; Set theme separately for Emacs daemon and Emacs GUI
(use-package base16-theme
  :config
    (load-theme 'base16-tomorrow-night t))

(load-theme 'wheatgrass t t)

(defun szclsya/init-theme (frame)
  (select-frame frame)
  (if (window-system frame)
      (progn
	(disable-theme 'wheatgrass)
      	(enable-theme 'base16-tomorrow-night))
    (progn
      (disable-theme 'base16-tomorrow-night)
      (enable-theme 'wheatgrass))))

(add-hook 'after-make-frame-functions 'szclsya/init-theme)

(provide 'init-theme)

;;; init-theme.el ends here
