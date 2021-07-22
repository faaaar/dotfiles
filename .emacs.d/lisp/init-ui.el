;;; init-ui.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; UI configuration.
;;

;;; Code:
(eval-when-compile
  (require 'init-const))

(unless (or sys/mac-x-p sys/linux-x-p sys/winp)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))

(set-face-attribute 'default nil
                               :family "Roboto Mono"
                               :height (/ (nth 3 (nth 1 (frame-monitor-attributes))) 16)
                               :weight 'normal
                               :width 'normal)

(setq-default indent-tabs-mode nil)
(setq-default cursor-type 'bar)
(setq select-enable-clipboard t)
(setq tab-width 2)
(setq auto-save-default nil)
(setq kill-ring-max 1000)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq buffer-file-coding-system 'utf-8)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq frame-title-format "emacs@%b")
(menu-bar-mode -1)
(xterm-mouse-mode 1)

(if (or sys/mac-x-p sys/linux-x-p sys/winp)
  (progn
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))

(tab-bar-mode)
(setq tab-bar-new-tab-to 'rightmost)
(global-set-key (kbd "C-t") 'tab-bar-new-tab-to)
(global-set-key (kbd "<C-left>") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "<C-right>") 'tab-bar-switch-to-next-tab)

(fset 'yes-or-no-p 'y-or-n-p)

(use-package display-line-numbers
  :ensure nil
  :hook
  ((prog-mode yaml-mode systemd-mode org-mode protobuf-mode) . display-line-numbers-mode))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config))

(if (or sys/mac-x-p sys/linux-x-p sys/winp)
    (load-theme 'doom-dracula t)
    ;; (load-theme 'doom-homage-white t)
    ;; (load-theme 'doom-flatwhite t)
  (load-theme 'doom-nova t))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-icon nil))

;; Highlight the current line
(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

;; Highlight matching parens
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :config
  (setq show-paren-when-point-inside-paren t)
  (setq show-paren-when-point-in-periphery t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
