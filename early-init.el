;;; early-init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary: Mostly performance stuff
;;; Code:

(defconst emacs-start-time (current-time))

;; no-littering's var directory should live in XDG_CACHE_HOME
(require 'xdg)
(setq no-littering-var-directory
      (expand-file-name "emacs" (xdg-cache-home)))

;; Move ~eln-cache~ to no-littering place
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name "eln-cache" no-littering-var-directory))))

;; And also package dir
(setq package-user-dir (expand-file-name "elpa" no-littering-var-directory))

;; Allow up to 256MiB of RAM during startup
;; This will be later reduced by gcmh
(setq gc-cons-threshold (* 256 1024 1024)
      gc-cons-percentage 0.8)

;; lsp
(setq read-process-output-max (* 4 1024 1024))

;; Show startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time emacs-start-time)))
                     gcs-done)))

;; Calculate use-package-report
(setq use-package-compute-statistics t)

(provide 'early-init)
;;; early-init.el ends here
