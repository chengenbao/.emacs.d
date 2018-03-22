;;; init --- Bootup script for emacs

;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/site-lisp/cide")
(add-to-list 'load-path "~/.emacs.d/site-lisp/custom")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'install-packages)
(require 'setup-theme)

(elpy-enable)

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'setup-general)
(require 'setup-helm)
;; (require 'setup-helm-gtags)
;; (require 'setup-ggtags)

(require 'setup-cedet)
(require 'setup-editing)

;; function-args
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;; start flymake-google-cpplint-load
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load))

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;;; flycheck
(global-flycheck-mode)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)
(setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode %f"
                              "xelatex -shell-escape -interaction nonstopmode %f"))

(require 'rtags)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(require 'helm-rtags)
(setq rtags-use-helm t)
;;; (cmake-ide-setup)

(setq explicit-shell-file-name "/bin/zsh")

(require 'smartparens-config)

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
  (add-hook 'c++-mode-hook #'smartparens-strict-mode)
  (add-hook 'c-mode-hook #'smartparens-strict-mode)
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'header2)

;;自动清除行位空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)
;;自动清除行之间的空白行
(add-hook 'before-save-hook 'delete-blank-lines)
;;显示空格
(global-set-key [f1] 'whitespace-newline-mode)

(provide 'init)
