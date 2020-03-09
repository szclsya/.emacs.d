;; Insert Lambda symbol on F2
(use-package fill-column-indicator
  :config
  (setq-default fci-rule-column 80))

(use-package racket-mode
  :config
  (add-hook 'racket-mode-hook
		    (lambda ()
			  (define-key racket-mode-map (kbd "<f1>") 'racket-doc)
			  (define-key racket-mode-map (kbd "<f2>") 'racket-insert-lambda)
		      (define-key racket-mode-map (kbd "<f5>") 'racket-run)
			  (auto-fci-mode))))

(provide 'init-racket)
