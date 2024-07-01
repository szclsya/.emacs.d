;;; early-init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary: Mostly performance stuff
;;; Code:

;; Used to calculate startup time.
;; See ~init-performance~
(defconst emacs-start-time (current-time))

;; Allow up to 1GiB of RAM during startup
;; This will be later reduced in ~init-performance~
(setq gc-cons-threshold (* 1024 1024 1024)
      gc-cons-percentage 0.8)

;; no-littering's var directory should live in XDG_CACHE_HOME
(require 'xdg)
(setq no-littering-var-directory
      (expand-file-name "emacs" (xdg-cache-home)))

;; Move ~eln-cache~ to no-littering place
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name "eln-cache" no-littering-var-directory))))
;; And cleanup old AOT cache, deprecated in Emacs 29 I believe
(setq native-compile-prune-cache t)

;; And also package dir
(setq package-user-dir (expand-file-name "elpa" no-littering-var-directory))

;; Calculate use-package-report
(setq use-package-compute-statistics t)

;; Turn me on when debugging
;;(setq toggle-debug-on-error t)

(provide 'early-init)
;;; early-init.el ends here
