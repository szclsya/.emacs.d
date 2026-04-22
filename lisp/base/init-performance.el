;;; init-performance.el --- performance tools & tweaks -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Might be useful for lsp
(setq read-process-output-max (* 4 1024 1024))

;; Show startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time emacs-start-time)))
                     gcs-done)))

(provide 'init-performance)
;;; init-performance.el ends here
