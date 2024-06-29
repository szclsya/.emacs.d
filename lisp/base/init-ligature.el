;;; init-ligature.el --- Ligature settings -*- lexical-binding: t; -*-
;;; Commentary: Works only on Emacs28+
;;; Code:

(use-package ligature
  :config
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode
                          '(;; Iosevka CLIK (C-like) ligature set
                            "->" "->>" "-->" "--->" "<<=" "<=" "=>" "==>" "===>" ">=" ">>="
                            "<->" "<=>" "::" ":::" "__" "~~>" "==" "!=" "<>" "===" "=!=" "!==="
                            "*=" "<|" "<|>" "|>" "/*"  "*/" "++" "+++"
                            ;; And a little bit more that I use"
                            "<!--" "</" "/>"
                            ))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(provide 'init-ligature)
;;; init-ligature.el ends here
