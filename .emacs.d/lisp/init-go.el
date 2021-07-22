;;; init-go.el --- Emacs Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Go configuration file
;;

;;; Code:

;; Go packages:
;; export GO111MODULE=on
;; export GOPROXY=https://goproxy.io
;; mkdir -p $GOPATH/src/golang.org/x/
;; git clone https://github.com/golang/tools.git $GOPATH/src/golang.org/x/tools
;; git clone https://github.com/golang/lint.git $GOPATH/src/golang.org/x/lint
;; cd $GOPATH/src/golang.org/x/tools/cmd/gorename
;; go install
;; cd $GOPATH/src/golang.org/x/tools/cmd/goimports
;; go install
;; cd $GOPATH/src/golang.org/x/lint/golint
;; go install
;; cd $GOPATH/src/golang.org/x/tools/gopls
;; go install
;; cd $GOPATH/src/golang.org/x/tools/cmd/godoc
;; go install
;; cd $GOPATH/src/golang.org/x/tools/cmd/gotype
;; go install
;; go get github.com/rogpeppe/godef
;; go get github.com/go-delve/delve
;; go get github.com/josharian/impl
;; go get github.com/cweill/gotests/...
;; go get github.com/fatih/gomodifytags
;; go get github.com/davidrjenni/reftools/cmd/fillstruct

(use-package go-mode
  :hook
  (go-mode . lsp-deferred)
  ;; (before-save . gofmt-before-save)
  :config
  (use-package go-dlv)
  (use-package go-fill-struct)
  (use-package golint)
  (use-package go-impl)
  (use-package go-tag
    :bind (:map go-mode-map
                ("C-c t" . go-tag-add)
                ("C-c T" . go-tag-remove))
    :config (setq go-tag-args (list "-transform" "snakecase")))
  (use-package gotest)
  (use-package go-gen-test
    :bind (:map go-mode-map
                ("C-c C-t" . go-gen-test-dwim)))
  (setq gofmt-command "goimports")
  (require 'dap-go))

(use-package protobuf-mode)

(provide 'init-go)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-go.el ends here
