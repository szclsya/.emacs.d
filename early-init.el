;;; early-init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary: Mostly performance stuff
;;; Code:

;; Used to calculate startup time.
;; See ~init-performance~
(defconst emacs-start-time (current-time))

;; Disable toolbar and  menubar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; No GC tuning thanks to IGC

(require 'xdg)
(defconst init-state-dir (expand-file-name "emacs" (xdg-data-home)))
(defconst init-cache-dir (expand-file-name "emacs" (xdg-cache-home)))

(setq no-littering-var-directory init-state-dir)

(setq savehist-file     (expand-file-name "savehist.el" init-state-dir)
      project-list-file (expand-file-name "project-list.el" init-state-dir))

;; Move ~eln-cache~ out of the config directory, into the disposable one
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name "eln-cache" init-cache-dir))))
;; And cleanup old AOT cache, deprecated in Emacs 29 I believe
(setq native-compile-prune-cache t)

;; Package dir: persistent, alongside no-littering's var files
(setq package-user-dir (expand-file-name "elpa" init-state-dir))

;; Calculate use-package-report
(setq use-package-compute-statistics t)

;; Turn me on when debugging
;;(setq toggle-debug-on-error t)

(provide 'early-init)
;;; early-init.el ends here
