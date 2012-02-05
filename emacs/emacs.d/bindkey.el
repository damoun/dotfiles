(global-set-key [f1] 'toggle-hiding)
(global-set-key [f2] 'toggle-selective-display)

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c++-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'js-mode-hook         'hs-minor-mode)

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

;; Tmux fix
(define-key function-key-map (kbd "M-[ A") [C-up])
(define-key function-key-map (kbd "M-[ B") [C-down])
(define-key function-key-map (kbd "M-[ C") [C-right])
(define-key function-key-map (kbd "M-[ D") [C-left])
