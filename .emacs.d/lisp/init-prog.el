;;; init-prog.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Emacs program configruation
;;

;;; Code:

(use-package dumb-jump
  :functions dumb-jump-hydra/body
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :hook (after-init . dumb-jump-mode)
  :config
  (setq dumb-jump-force-searcher 'rg))

(use-package dockerfile-mode)

(use-package editorconfig
  :diminish editorconfig-mode
  :hook (after-init . editorconfig-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; brew install multimarkdown
(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode
  ("README\\.md\\'" . gfm-mode)
  ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)
  :init
  (setq markdown-command "multimarkdown")
  :config
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

  (autoload 'gfm-mode "markdown-mode"
    "Major mode for editing GitHub Flavored Markdown files" t)
  (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode)))


(use-package yaml-mode
  :mode
  ("\\.yaml\\'" . yaml-mode)
  ("\\.yml\\'" . yaml-mode))

(provide 'init-prog)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-prog.el ends here
