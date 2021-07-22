;;; init.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Emacs config entry file
;;

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (< emacs-major-version 26)
  (error "This requires Emacs 26 and above!"))

(setq byte-compile-warnings '(cl-functions))

;; Speed up startup
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 80000000)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after init."
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold 800000)
            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function
                              (lambda ()
                                (unless (frame-focus-state)
                                  (garbage-collect))))
              (add-hook 'focus-out-hook 'garbage-collect))))

(defun update-load-path (&rest _)
  "Update `load-path'."
  (push (expand-file-name "lisp" user-emacs-directory) load-path))

(advice-add #'package-initialize :after #'update-load-path)

(update-load-path)

;; Constants
(require 'init-const)

;; Package
(require 'init-package)

;; Basic
(require 'init-basic)

;; UI
(require 'init-ui)

;; Ivy
(require 'init-ivy)

;; Projectile
(require 'init-projectile)

;; Edit
(require 'init-edit)

;; LSP
(require 'init-lsp)

;; Company
(require 'init-company)

;; Prog
(require 'init-prog)

;; Yasnippet
(require 'init-yasnippet)

;; Go
(require 'init-go)

;; Web
(require 'init-web)

;; Neotree
(require 'init-neotree)

;; VCS
(require 'init-vcs)

;; Lisp
(require 'init-lisp)

;; Org
(require 'init-org)

;; Youdao
(require 'init-youdao)

;; Rust
(require 'init-rust)

;; dap
(require 'init-dap)

;; wakatime
(require 'init-wakatime)
(global-wakatime-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
(put 'scroll-left 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "d5f8099d98174116cba9912fe2a0c3196a7cd405d12fa6b9375c55fc510988b5" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "285efd6352377e0e3b68c71ab12c43d2b72072f64d436584f9159a58c4ff545a" default))
 '(package-selected-packages
   '(projectile treemacs company-capf dap-mode use-package-hydra go-gen-test gotest go-tag go-impl golint go-fill-struct go-dlv cargo rustic youdao-dictionary ox-hugo ob-go org-fancy-priorities org-bullets slime gitignore-mode gitconfig-mode gitattributes-mode git-messenger magit neotree rjsx-mode emmet-mode web-mode tide js2-mode json-mode css-eldoc scss-mode protobuf-mode go-mode yasnippet-snippets yaml-mode editorconfig dockerfile-mode dumb-jump company-lsp company lsp-ui lsp-mode undo-tree avy popup-kill-ring browse-kill-ring sudo-edit origami smart-hungry-delete iedit smartparens expand-region drag-stuff comment-dwim-2 hydra counsel-etags ivy-yasnippet counsel-projectile wgrep flx counsel rainbow-delimiters doom-modeline doom-themes which-key try exec-path-from-shell diminish use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
