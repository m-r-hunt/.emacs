; Get Melpa for packages. Note no https as it doesn't work on windows (?!)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; Stuff set from GUI. tango-dark is nice and builtin. Also packages.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (fill-column-indicator lua-mode rainbow-delimiters paredit cider))))

; No terminal bell dear christ please.
(setq ring-bell-function 'ignore)

; Nicer font for windows. May need changing for other oses?
(add-to-list 'default-frame-alist '(font . "Consolas-14" ))
(set-face-attribute 'default t :font "Consolas-14" )

; Paredit is best mode for lisps. Also rainbows are nice.
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

; Show matching parens. Essential for lisps.
(show-paren-mode 1)

; Pico-8 files are Lua (at least the bit we want to edit in emacs)
(add-to-list 'auto-mode-alist '("\\.p8\\'" . lua-mode))

; Make mouse wheel scrolling work the way I expect.
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(4 ((shift) . 1) ((control))))
