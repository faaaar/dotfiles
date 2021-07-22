;;; init-basic.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Basic configuration.
;;

;;; Code:

(eval-when-compile
  (require 'init-const))

;; Environment
(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOVERSION" "GOPATH" "GOROOT" "GO111MODULE" "WAKATIME_API_KEY"))
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))

(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 200)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          ".cache"
                          ".cask"
                          ".elfeed"
                          "bookmarks"
                          "cache"
                          "ido.*"
                          "persp-confs"
                          "recentf"
                          "undo-tree-hist"
                          "url"
                          "COMMIT_EDITMSG\\'")))

(use-package try)

(use-package which-key
  :diminish which-key-mode
  :hook (after-init . which-key-mode))

(use-package dired
  :ensure nil
  :config
  ;; Always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always))

(provide 'init-basic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-basic.el ends here
