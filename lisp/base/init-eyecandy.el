;;; init-eyecandy.el --- Please my eyes -*- lexical-binding: t -*-
;;; Commentary:
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



(provide 'init-eyecandy)
;;; init-eyecandy.el ends here
