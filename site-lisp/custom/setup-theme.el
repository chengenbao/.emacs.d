;;; setup the color theme

(custom-set-faces
 '(minibuffer-prompt ((t (:foreground "brightred")))))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq-default indent-tabs-mode nil)

(when window-system
  (when (featurep 'aquamacs)
    (setq default-frame-alist nil))
  (load-theme 'material t))

(load-theme 'material t)  ;;; load atom-dark-theme
(setq color-theme-is-global t)
(setq org-src-fontify-natively t)

(global-linum-mode t) ;; enable line numbers globally
(setq inhibit-startup-message t) ;; hide the startup message

(require 'paren-face)
(show-paren-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(custom-set-variables
 '(menu-bar-mode nil)
 '(speedbar-use-images nil)
 '(sr-speedbar-right-side nil))

(provide 'setup-theme)
