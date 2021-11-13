;;; init-ligature.el --- Ligature settings -*- lexical-binding: t; -*-
;;; Commentary: Works only on Emacs28+
;;; Code:

(use-package ligature
  :quelpa (ligature
           :fetcher github
           :repo "mickeynp/ligature.el")
  :config
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<--" "<---" "<<-" "<-" "<->" "->" "->>" "-->" "--->" "<!--"
                                       "-<<" "-<" "-<-" "->-" ">-" ">>-" "<-->" "<--->" "<---->"
                                       "<==" "<===" "<<=" "<=" "<=>" "=>" "=>>" "==>" "===>" "<!---"
                                       "=<<" "=<" "=<=" "=>=" ">=" ">>=" "<==>" "<===>" "<====>"
                                       "<-------" "------->" "<======>" "<~~" "<~" "~>" "~~>"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(provide 'init-ligature)
;;; init-ligature.el ends here
