; Get Melpa for packages. Note no https as it doesn't work on windows (?!)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; Stuff set from GUI. tango-dark is nice and builtin. Also packages.
(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (rust-mode fill-column-indicator lua-mode rainbow-delimiters paredit cider))))

; No terminal bell dear christ please.
(setq ring-bell-function 'ignore)

; Nicer font for windows.
(if (eq system-type 'windows-nt)
    (progn
      (add-to-list 'default-frame-alist '(font . "Consolas-14" ))
      (set-face-attribute 'default t :font "Consolas-14" )))

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

; Ctrl+Enter for recompile. Run M-x compile first to set the compile command.
; Seems like this could be smarter?
(global-set-key (kbd "<C-return>") 'recompile)
