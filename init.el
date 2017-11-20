(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(defvar my-packages
  '(auto-complete
    paren-face
    color-theme
    rainbow-delimiters
    use-package
    function-args
    yasnippet
    better-defaults
    elpy
    flycheck
    py-autopep8
    material-theme
    zygospore
    helm-gtags
    helm
    yasnippet
    ws-butler
    volatile-highlights
    use-package
    undo-tree
    iedit
    dtrt-indent
    counsel-projectile
    company
    clean-aindent-mode
    anzu))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)

(custom-set-faces
  '(minibuffer-prompt ((t (:foreground "brightred")))))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/site-lisp/cide")

(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

;;;(color-theme-shaman)
;;;(color-theme-kingsajz)
;;;(color-theme-taylor)

(global-linum-mode t) ;; enable line numbers globally

(require 'paren-face)
(show-paren-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(elpy-enable)

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme


(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)

(require 'setup-cedet)
(require 'setup-editing)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

(require 'function-args)
(fa-config-default)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(custom-set-variables
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (zygospore
     rainbow-delimiters
     helm-gtags
     helm
     yasnippet
     ws-butler
     volatile-highlights
     use-package
     undo-tree
     iedit
     dtrt-indent
     counsel-projectile
     company
     clean-aindent-mode
     anzu
     use-package
     function-args
     yasnippet
     better-defaults
     elpy
     flycheck
     py-autopep8
    material-theme)))
 '(speedbar-use-images nil)
 '(sr-speedbar-right-side nil))

