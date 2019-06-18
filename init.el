(add-to-list 'default-frame-alist '(font . "monospace"))

;; Disable toolbar and  menubar
(menu-bar-mode -1)
(tool-bar-mode -1)

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

;; 4 spaces for a tab in CC mode
(setq-default c-basic-offset 4)

;; Load modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-elpa)
