;;; init-typescript.el --- TypeScript configurations. -*- lexical-binding: t; -*-
;;; Commentary: 
;;; Code:

(use-package typescript-mode)

;; Highlight TODO, FIXME and BUG in comment
(add-hook 'typescript-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

(provide 'init-typescript)

;;; init-typescript.el ends here
 
