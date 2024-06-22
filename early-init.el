;;; early-init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defconst emacs-start-time (current-time))

;; Allow up to 512MiB of RAM during startup
;; This will be later reduced by gcmh
(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.8)

;; Show startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time emacs-start-time)))
                     gcs-done)))

;; early-init.el ends here
