;;; early-init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary: Mostly performance stuff
;;; Code:

(defconst emacs-start-time (current-time))

;; Allow up to 256MiB of RAM during startup
;; This will be later reduced by gcmh
(setq gc-cons-threshold (* 256 1024 1024)
      gc-cons-percentage 0.8)

;; lsp-mode
(setq read-process-output-max (* 4 1024 1024))
(setenv "LSP_USE_PLISTS" "true")

;; Show startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time emacs-start-time)))
                     gcs-done)))

(provide 'early-init)
;;; early-init.el ends here
