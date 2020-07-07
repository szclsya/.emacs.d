;;; init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; reduce freeze (http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/)
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  ;; Set to this large for LSP
  (setq gc-cons-threshold 100000000))

;; Set for LSP
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; 4 spaces for a tab
(setq-default tab-width 4)

;; Don't beep
(setq visible-bell 1)

;; Electric pair mode
(electric-pair-mode 1)
 
;; Don't pollute my working dir!
    (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Load modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Set up instance-specific settings
(require 'init-local)

;; Necessary features
(require 'init-elpa)
(require 'init-theme)
(require 'init-ivy)
(require 'init-evil)
(require 'init-company)
(require 'init-neotree)
(require 'init-lsp)

;; Language supports
(require 'init-c)
(require 'init-web)
(require 'init-tex)
(require 'init-racket)
(require 'init-markdown)
(require 'init-typescript)
(require 'init-python)

;; Functional modules
(require 'init-elfeed)
(require 'init-telega)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-magit)
(require 'init-projectile)
(require 'init-pdf-tools)

;;; init.el ends here
