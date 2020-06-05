;;; init-elpa.el --- ELPA and MELPA configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; A temporary fix for GNU ELPA failure
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Set up environment for use-package
(package-initialize)
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(add-to-list 'package-archives (cons "melpa-stable" "https://stable.melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Automatically install
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package graphviz-dot-mode)

(use-package elvish-mode)

(provide 'init-elpa)

;;; init-elpa.el ends here
