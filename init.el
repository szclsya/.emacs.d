(add-to-list 'default-frame-alist '(font . "monospace"))

;; Disable toolbar and  menubar
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Disable welcome screen
(setq inhibit-startup-screen t)

;; reduce freeze (http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/)
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; Enable line number dislay
(global-display-line-numbers-mode)

;; 4 spaces for a tab
(setq-default tab-width 4)

;; highlight end of bracket
(show-paren-mode 1)

;; Don't beep
(setq visible-bell 1)

;; Transparent
;; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;; C++ stuff
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Load modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Set theme stuff on emacs daemon
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

;; Org-mode stuff
(require 'init-org)

;; A temporary fix for GNU ELPA failure
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'init-elpa)

(require 'init-ivy)
(require 'init-tex)
(require 'init-racket)
(require 'init-evil)
(require 'init-elfeed)
(require 'init-telega)

;;; init.el ends here
