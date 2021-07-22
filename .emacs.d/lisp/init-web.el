;;; init-web.el --- Emasc Configuration

;; Author: Yunfan Li <leeyunfans@gmail.com>
;; URL: https://github.com/faaaar/dotfiles/tree/master/.emacs.d

;;; Commentary:
;;
;; Web configuration.
;;

;;; Code:

(use-package css-mode
  :init (setq css-indent-offset 2))

(use-package scss-mode
  :init
   (setq scss-compile-at-save nil))

(use-package css-eldoc
  :commands turn-on-css-eldoc
  :hook ((css-mode scss-mode less-css-mode) . turn-on-css-eldoc))

(use-package json-mode)

(use-package js2-mode
  :custom
  (js2-strict-missing-semi-warning nil)
  :mode (("\\.js\\'" . js2-mode))
  :interpreter
  ("node" . js2-mode)
  ("node" . js2-jsx-mode)
  :hook
  (js2-mode . js2-imenu-extras-mode)
  (js2-mode . js2-highlight-unused-variables-mode))

;; {
;;  "baseIndentSize": 0,
;;  "indentSize": 2,
;;  "tabSize": 2,
;;  "newLineCharacter": "",
;;  "convertTabsToSpaces": true,
;;  "__indentStyleComment": "Support None Block Smart",
;;  "indentStyle": "Smart",
;;  "insertSpaceAfterCommaDelimiter": true,
;;  "insertSpaceAfterSemicolonInForStatements": true,
;;  "insertSpaceBeforeAndAfterBinaryOperators": true,
;;  "insertSpaceAfterKeywordsInControlFlowStatements": true,
;;  "insertSpaceAfterFunctionKeywordForAnonymousFunctions": true,
;;  "insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis": false,
;;  "insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets": false,
;;  "insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
;;  "insertSpaceBeforeFunctionParenthesis": true,
;;  "insertSpaceBeforeTypeAnnotation": true,
;;  "insertSpaceAfterConstructor": false,
;;  "insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces": false,
;;  "insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces": false,
;;  "insertSpaceAfterTypeAssertion": false,
;;  "placeOpenBraceOnNewLineForFunctions": false,
;;  "placeOpenBraceOnNewLineForControlBlocks": false
;; }

(use-package tide
  :diminish tide-mode
  :defines (company-backends tide-format-options)
  :functions (tide-setup tide-hl-identifier-mode)
  :preface
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (eldoc-mode 1)
    (tide-hl-identifier-mode 1)
    (setq emmet-expand-jsx-className? t))
  :hook
  (typescript-mode . setup-tide-mode)
  (web-mode . (lambda ()
                (when (string-equal "tsx" (file-name-extension buffer-file-name))
                  (setup-tide-mode))))
  (before-save . tide-format-before-save)
  :config
  (with-eval-after-load 'company
    (cl-pushnew 'company-tide company-backends)))

(use-package web-mode
  :defines company-backends
  :mode "\\.\\(phtml\\|php|html?\\|tm?pl\\|vue\\|tsx\\)$"
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package emmet-mode
  :hook (rjsx-mode js2-jsx-mode web-mode)
  :config
  (setq emmet-move-cursor-between-quotes t)
  (setq emmet-self-closing-tag-style " /")
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert t)))
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

(use-package rjsx-mode
  :init
  (setq js-switch-indent-offset 2)
  :mode ("\\.jsx\\'")
  :config
  (eval-when-compile
    (require 'emmet-mode))
  (setq emmet-expand-jsx-className? t)
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode)
               (with-eval-after-load 'rjsx-mode
                 (define-key rjsx-mode-map "<" nil)
                 (define-key rjsx-mode-map (kbd "C-d") nil)
                 (define-key rjsx-mode-map ">" nil))))


(provide 'init-web)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-web.el ends here
