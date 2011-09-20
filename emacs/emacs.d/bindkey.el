;; F1: collapse
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key [f1] 'hs-hide-block)

;; F2: extend
(global-set-key [f2] 'hs-show-block)

;; F3: man
(global-set-key [f3] 'vectra-man-on-word)

;; F4: find reference
(global-set-key [f4] 'semantic-symref)

;; F5: flymake display error
(global-set-key [f5] 'next-flymake-error)

;; F6: compile
(setq compilation-window-height 10)
(setq compilation-window-width 10)
(global-set-key [f6] `compile)

;; F7 -> GDB
(setq-default gdb-many-windows t)
(global-set-key [f7] `gdb)

;; F8: next error
(global-set-key	[f8] 'next-error)

;; PuTTY fix. Ugly. Bad. But it works. (Good)
(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)