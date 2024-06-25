fundamental-mode

(today (format-time-string "%Y-%m-%d"))

org-mode

(title   & "#+TITLE: " p n "#+DESCRIPTION: " p n "#+DATE: " p n
           "#+TAGS[]: " p n "#+LICENSE: " p n "#+STARTUP: indent" n n)
(src     & "#+BEGIN_SRC " p n r n "#+END_SRC")
(quote   & "#+BEGIN_QUOTE" n r n "#+END_QUOTE")
(comment & "#+BEGIN_COMMENT" n r n "#+BEGIN_COMMENT")
(verse   & "#+BEGIN_VERSE" n r n "#+END_VERSE")

emacs-lisp-mode

(header ";;; " (p (file-name-base (or (buffer-file-name) (buffer-name))) file) ".el --- " (p "summary" summary) " -*- lexical-binding: t -*-" n
        ";;; Commentary:" n
        ";;; Code:" n n
        p n n
        "(provide '" (s file) ")" n
        ";;; " (s file) ".el ends here")

sh-bash-mode

(! & "#!/usr/bin/env bash" n "set -euo pipefail" n q)

rust-mode rust-ts-mode

(drv & "#[derive(" p ")]" q)
