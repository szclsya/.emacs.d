;;; init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Reduce load time via giving it a lot of memory (~100M) before gc
(setq gc-cons-threshold (* 200 1000 1000))

;; reduce freeze (http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/)
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  ;; Set to this large for LSP
  (setq gc-cons-threshold (* 1000 1000)))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)


;; Set for LSP
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Show startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Load modules
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Set up instance-specific settings
(require 'init-local)

;; Necessary features
(add-to-list 'load-path (expand-file-name "lisp/base" user-emacs-directory))
(require 'init-elpa)
(require 'init-theme)
(require 'init-ligature)
(require 'init-ivy)
(require 'init-evil)
(require 'init-company)
(require 'init-lsp)
(require 'init-flycheck)
(require 'init-flyspell)

;; Settings
(require 'init-editing)

;; Language supports
(add-to-list 'load-path (expand-file-name "lisp/language" user-emacs-directory))
(require 'init-latex)
(require 'init-c)
(require 'init-web)
(require 'init-racket)
(require 'init-markdown)
(require 'init-typescript)
(require 'init-python)
(require 'init-rust)
(require 'init-sql)

;; Functional modules
(add-to-list 'load-path (expand-file-name "lisp/tool" user-emacs-directory))
(require 'init-elfeed)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-magit)
(require 'init-projectile)

;;; init.el ends here
