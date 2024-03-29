;;; init-elpa.el --- ELPA and MELPA configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Set up environment for use-package
(package-initialize)
(require 'package)

;; This var will be set in init-local.el
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
  (no-littering-theme-backups)
)

(use-package fish-mode)

(use-package nginx-mode)

(use-package esup
  :ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa-stable)

(provide 'init-elpa)

;;; init-elpa.el ends here
