;;; init-performance.el --- performance tools & tweaks -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Might be useful for lsp
(setq read-process-output-max (* 4 1024 1024))

;; Show startup time.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %.2f seconds. Welcome back pilot."
                     (float-time
                      (time-subtract after-init-time emacs-start-time)))))

(provide 'init-performance)
;;; init-performance.el ends here
