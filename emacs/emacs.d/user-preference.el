;; delete space at the end line
(add-hook 'c++-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook   'c-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))

;; auto complete mini-buffer
(icomplete-mode 1)

;; auto complete without case
(setq completion-ignore-case t)

;; don't create ~ file
(setq make-backup-files nil)

;; show paren
(custom-set-variables
 '(show-paren-mode t))
(custom-set-faces)

;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)

;; display line and column number
(column-number-mode t)
(line-number-mode t)

;; KILL the startup message
(setq inhibit-startup-message t)

;; replace the region if your write
(delete-selection-mode t)

;; scroll with mousse
(mouse-wheel-mode t)

(put 'upcase-region 'disabled nil)