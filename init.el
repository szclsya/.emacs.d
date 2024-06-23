;;; init.el --- The Beta.                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Load modules
(load (expand-file-name "local.el" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Configure use-package environment
(package-initialize)
(require 'package)
;; This var is configured in local.el
(if (and (boundp use-chinese-elpa-mirrors) use-chinese-elpa-mirrors)
	(setq package-archives '(("gnu"   . "https://mirrors.bfsu.edu.cn/elpa/gnu/")
							 ("melpa" . "https://mirrors.bfsu.edu.cn/elpa/melpa/")
							 ("melpa-stable" . "https://mirrors.bfsu.edu.cn/elpa/melpa-stable/")))
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
						   ("melpa" . "https://melpa.org/packages/")
						   ("melpa-stable" . "https://stable.melpa.org/packages/"))))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
;; Automatically install
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; No littering
(use-package no-littering
  :config
  (no-littering-theme-backups))

;; Necessary features
(add-to-list 'load-path (expand-file-name "lisp/base" user-emacs-directory))
(require 'init-performance)
(require 'init-theme) ;; Gotta get pretty fast!
(require 'init-keybinding)
(require 'init-completion)
(require 'init-evil)
(require 'init-buffer)
(require 'init-ligature)
(require 'init-lsp)
(require 'init-flycheck)
(require 'init-spell)
(require 'init-template)
(require 'init-editing)

;; Language supports
(add-to-list 'load-path (expand-file-name "lisp/language" user-emacs-directory))
(require 'init-latex)
(require 'init-c)
(require 'init-web)
(require 'init-racket)
(require 'init-markdown)
(require 'init-python)
(require 'init-rust)
(require 'init-sql)
(require 'init-misc-lang)

;; Functional modules
(add-to-list 'load-path (expand-file-name "lisp/tool" user-emacs-directory))
(require 'init-elfeed)
(require 'init-org)
(require 'init-magit)
(require 'init-hledger)
(require 'init-mu4e)

;;; init.el ends here
