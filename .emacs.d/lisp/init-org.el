;;; init-org.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Org configuration.
;;

;;; Code:

(use-package org
  :ensure nil
  :commands org-try-structure-completion
  :functions hydra-org-template/body
  :bind
  ("C-c o a" . org-agenda)
  ("C-c o n" . org-capture)
  :hook (org-indent-mode . (lambda() (diminish 'org-indent-mode)))
  :config

  (setq org-use-sub-superscripts nil
        org-agenda-files `(,(exec-path-from-shell-getenv "ORGPATH"))
        org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "TESTING" "|" "PAUSE(p)" "CANCEL(c)" "DONE(d)"))
        org-todo-keyword-faces '(("PAUSE" . warning))
        org-log-done 'date
        org-catch-invisible-edits 'smart
        org-startup-indented t
        ;; org-ellipsis (if (char-displayable-p ?) "  " nil)
        org-pretty-entities t
        org-hide-emphasis-markers t
        org-export-with-sub-superscripts nil)

  (setq org-default-notes-file "~/.org/note.org")
  (setq org-capture-templates nil)
  (add-to-list 'org-capture-templates
               '("w" "cmos work" entry
                 (file+olp "~/.org/cmos.org" "Work List")
                 "\n* TODO %^{TaskName} [0/0] :cmos:%^{Tag}:\n"))

  ;; More fancy UI
  ;; (use-package org-bullets
  ;;   :if (char-displayable-p ?◉)
  ;;   :hook (org-mode . org-bullets-mode))

  ;; priorities
  (use-package org-fancy-priorities
    :diminish
    :defines org-fancy-priorities-list
    :hook (org-mode . org-fancy-priorities-mode)
    :config
    (setq org-fancy-priorities-list '("HIGH" "MID" "LOW" "OPTIONAL")))

  ;; org-babel go
  (use-package ob-go)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((go . t)
     (emacs-lisp . t)
     (shell . t)))

  ;; Static hugo gen tool
  (use-package ox-hugo)

  ;; Babel
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t))

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite" "go")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
p    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(provide 'init-org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
