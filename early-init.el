;;; early-init.el --- The Alpha.                  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defconst emacs-start-time (current-time))

(setq gc-cons-threshold most-positive-fixnum
     gc-cons-percentage 0.6)

;; Show startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time emacs-start-time)))
                     gcs-done)))

;; early-init.el ends here
