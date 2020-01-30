;; Insert Lambda symbol on F2
(defun insert-lambda-symbol ()
  (interactive)
  (insert "λ"))

(use-package racket-mode
  :config (add-hook 'racket-mode-hook
		    (lambda ()
		      (define-key racket-mode-map (kbd "<f5>") 'racket-run)
			  (define-key racket-mode-map (kbd "<f2>") 'insert-lambda-symbol))))

(provide 'init-racket)
