;;; init-edit.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Edit config
;;

;;; Code:

(define-key input-decode-map [?\C-i] [C-i])
(global-set-key (kbd "<C-i>") 'indent-region)

(prefer-coding-system 'utf-8)

(setq initial-scratch-message nil)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq adaptive-fill-regexp "[ t]+|[ t]*([0-9]+.|*+)[ t]*")
(setq adaptive-fill-first-line-regexp "^* *$")
(setq make-backup-files nil)
(setq auto-save-default nil)
(delete-selection-mode t)

(setq-default major-mode 'text-mode)

;; Tab and Space
(setq-default c-basic-offset   4
              tab-width        4
              indent-tabs-mode nil)

(use-package hydra)

(use-package rect
  :ensure nil
  :bind (("<C-return>" . rectangle-mark-mode)))

(use-package autorevert
  :ensure nil
  :diminish
  :hook (after-init . global-auto-revert-mode))

(use-package comment-dwim-2
  :bind ([remap comment-dwim] . comment-dwim-2))

(use-package drag-stuff
  :diminish
  :commands drag-stuff-define-keys
  :hook (after-init . drag-stuff-global-mode)
  :config
  (add-to-list 'drag-stuff-except-modes 'org-mode)
(drag-stuff-define-keys))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package smartparens
  :hook
  (after-init . smartparens-global-mode)
  :config
  (sp-local-pair '(emacs-lisp-mode) "'" "'" :actions nil)
  (sp-local-pair '(lisp-mode) "'" "'" :actions nil))

(use-package multiple-cursors
  :bind (
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-M->" . mc/skip-to-next-like-this)
         ("C-M-<" . mc/skip-to-previous-like-this)))

(use-package iedit
  :bind
  ("C-;" . iedit-mode))



(defun smart-hungry-delete-region-code(&optional arg)
  "delete a char or region code"
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end))
          (smart-hungry-delete-forward-char arg)
        (kill-region (region-beginning) (region-end)))
    (smart-hungry-delete-forward-char arg)))

(use-package smart-hungry-delete
  :diminish
  :commands smart-hungry-delete-region-code
  :bind
  ("C-d" . smart-hungry-delete-region-code)
  ;; ("C-h" . smart-hungry-delete-backward-char)
  ("M-h" . backward-kill-word)
  :config
  (smart-hungry-delete-add-default-hooks))

(use-package origami
  :hook (prog-mode . origami-mode)
  :init (setq origami-show-fold-header t)
  :config
  (defhydra origami-hydra (:color blue :hint none)
    "
      _:_: recursively toggle node       _a_: toggle all nodes    _t_: toggle node
      _o_: show only current node        _u_: undo                _r_: redo
      _R_: reset
    "
    (":" origami-recursively-toggle-node)
    ("a" origami-toggle-all-nodes)
    ("t" origami-toggle-node)
    ("o" origami-show-only-node)
    ("u" origami-undo)
    ("r" origami-redo)
    ("R" origami-reset))

  :bind (:map origami-mode-map
              ("C-c l" . origami-hydra/body)))

(use-package sudo-edit)

(use-package browse-kill-ring)
(use-package popup-kill-ring
  :bind
  ("C-c b k" . popup-kill-ring))

(use-package avy
  :bind
  ("C-c j" . avy-goto-word-or-subword-1))

(use-package undo-tree)
(global-undo-tree-mode)

(provide 'init-edit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
