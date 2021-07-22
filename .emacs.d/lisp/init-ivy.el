;;; init-ivy.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; helm configruation
;;

;;; Code:

(use-package counsel
  :diminish ivy-mode counsel-mode
  :commands swiper-isearch
  :bind(("C-s" . swiper-isearch)
        ("s-f" . swiper)
        ("C-c C-r" . ivy-resume)

        ("C-c v p" . ivy-push-view)
        ("C-c v o" . ivy-pop-view)
        ("C-c v ." . ivy-switch-view)
        :map counsel-mode-map
        ([remap swiper] . counsel-grep-or-swiper)
        ([remap dired] . counsel-dired)
        ("C-c c i" . counsel-git)
        ("C-c c j" . counsel-git-grep)
        ("C-c c r" . counsel-rg)
        ("C-c c z" . counsel-fzf)
        ("C-x C-r" . counsel-recentf)
        ("C-x C-b" . counsel-ibuffer)

        ("M-x" . counsel-M-x)

        :map ivy-minibuffer-map
        ("C-w" . ivy-yank-word)

        :map counsel-find-file-map
        ("C-h" . counsel-up-directory)

        :map swiper-map
        ("M-s" . swiper-isearch-toggle)
        ("M-%" . swiper-query-replace)

        :map isearch-mode-map
        ("M-s" . swiper-isearch-toggle))
  :hook
  (after-init . ivy-mode)
  (ivy-mode . counsel-mode)
  :config
  (setq enable-recursive-minibuffers t)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-initial-inputs-alist nil)
  (setq swiper-action-recenter t)
  (setq counsel-find-file-at-point t)
  (setq counsel-yank-pop-separator "\n-------\n")

  ;; Integration with `projectile'
  (with-eval-after-load 'projectile
    (setq projectile-completion-system 'ivy))

  ;; Integration with `magit'
  (with-eval-after-load 'magit
    (setq magit-completing-read-function 'ivy-completing-read)))

;; Enhance fuzzy matching
(use-package flx
  :config (setq ivy-re-builders-alist
                '((swiper . ivy--regex-plus)
                  (swiper-all . ivy--regex-plus)
                  (swiper-isearch . ivy--regex-plus)
                  (counsel-recentf . ivy--regex-plus)
                  (counsel-rg . ivy--regex-plus)
                  (counsel-M-x . ivy--regex-plus)

                  (counsel-projectile . ivy--regex-plus)
                  (counsel-projectile-switch-project . ivy--regex-plus)
                  (counsel-projectile-find-file . ivy--regex-plus)
                  (counsel-projectile-find-file-dwim . ivy--regex-plus)
                  (counsel-projectile-find-dir . ivy--regex-plus)
                  (counsel-projectile-switch-to-buffer . ivy--regex-plus)
                  (counsel-projectile-rg . ivy--regex-plus)

                  (t . ivy--regex-fuzzy))))

(use-package wgrep)

;; Ivy integration for Projectile
(use-package counsel-projectile
  :init
  (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point))
  (counsel-projectile-mode 1)
  :after (counsel projectile)
  :bind
  ("C-c p h" . counsel-projectile)
  ("C-c p p" . counsel-projectile-switch-project)
  ("C-c p f" . counsel-projectile-find-file)
  ("C-c p g" . counsel-projectile-find-file-dwim)
  ("C-c p d" . counsel-projectile-find-dir)
  ("C-c p b" . counsel-projectile-switch-to-buffer)
  ("C-c p s r" . counsel-projectile-rg))

;; Integrate yasnippet
(use-package ivy-yasnippet
  :commands ivy-yasnippet--preview
  :bind ("C-c C-y" . ivy-yasnippet)
  :config (advice-add #'ivy-yasnippet--preview :override #'ignore))

(use-package counsel-etags)

(provide 'init-ivy)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
