;;; init.el --- The Beta.                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Load modules
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Set up instance-specific settings
(require 'init-local)

;; Necessary features
(add-to-list 'load-path (expand-file-name "lisp/base" user-emacs-directory))
(require 'init-elpa)
(require 'init-performance)
(require 'init-theme) ;; Gotta get pretty fast!
(require 'init-keybinding)
(require 'init-completion)
(require 'init-evil)
(require 'init-buffer)
(require 'init-ligature)
(require 'init-yasnippet)
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
(require 'init-magit)
(require 'init-hledger)
(require 'init-mu4e)

;;; init.el ends here
