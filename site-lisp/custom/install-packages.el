;;; Install packages for my emacs environment

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 t)
(add-to-list
 'package-archives
 '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(defvar my-packages
  '(auto-complete
    flycheck
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
    anzu
    flymake-google-cpplint
    flymake-cursor
    google-c-style
    rtags
    company-rtags
    helm-rtags
    smartparens))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)

(provide 'install-packages)
