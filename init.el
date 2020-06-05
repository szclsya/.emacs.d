;;; init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; reduce freeze (http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/)
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; 4 spaces for a tab
(setq-default tab-width 4)

;; Don't beep
(setq visible-bell 1)

;; Load modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;; Necessary features
(require 'init-elpa)
(require 'init-ivy)
(require 'init-evil)

;; Eye candy
(require 'init-theme)

;; Language supports
(require 'init-c)
(require 'init-tex)
(require 'init-racket)
(require 'init-markdown)
(require 'init-typescript)

;; Functional modules
(require 'init-elfeed)
(require 'init-telega)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-magit)

;;; init.el ends here
