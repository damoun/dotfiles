;; Header
(load "~/.emacs.d/header/std.el")
(load "~/.emacs.d/header/std_comment.el")

;; Mode
(load "~/.emacs.d/mode/javascript.el")
(load "~/.emacs.d/mode/ido.el")

;; Functions
(load "~/.emacs.d/functions.el")

;; Bindkey
(load "~/.emacs.d/bindkey.el")

;; User preference
(load "~/.emacs.d/user-preference.el")

;; Flymake
(load "~/.emacs.d/flymake/dominating-file.el")
(load "~/.emacs.d/flymake/flymake.el")
(load "~/.emacs.d/flymake/init-flymake.el")

;; CEDET
(load "~/.emacs.d/cedet/common/cedet.el")

;; ECB
(add-to-list 'load-path
	     "~/.emacs.d/ecb/")
(load "~/.emacs.d/ecb/init-ecb.el")

;; Auto-complete
(load "~/.emacs.d/auto-complete/popup.el")
(load "~/.emacs.d/auto-complete/auto-complete.el")
(load "~/.emacs.d/auto-complete/auto-complete-config.el")
(load "~/.emacs.d/auto-complete/auto-complete-extension.el")
(load "~/.emacs.d/auto-complete/auto-complete-semantic.el")
(load "~/.emacs.d/auto-complete/init-auto-complete.el")

;; Skeleton
(load "~/.emacs.d/skeleton/makefile.el")
(load "~/.emacs.d/skeleton/main.el")
(load "~/.emacs.d/skeleton/include.el")

;; Auto create
(load "~/.emacs.d/auto-create.el")

;; Colors
(load "~/.emacs.d/colors.el")

;; Gnus
(load "~/.emacs.d/gnus.el")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-key-map (quote ("C-c ." (t "fh" ecb-history-filter) (t "fs" ecb-sources-filter) (t "fm" ecb-methods-filter) (t "fr" ecb-methods-filter-regexp) (t "ft" ecb-methods-filter-tagclass) (t "fc" ecb-methods-filter-current-type) (t "fp" ecb-methods-filter-protection) (t "fn" ecb-methods-filter-nofilter) (t "fl" ecb-methods-filter-delete-last) (t "ff" ecb-methods-filter-function) (t "p" ecb-nav-goto-previous) (t "n" ecb-nav-goto-next) (t "lc" ecb-change-layout) (t "lr" ecb-redraw-layout) (t "lw" ecb-toggle-ecb-windows) (t "lt" ecb-toggle-layout) (t "s" ecb-window-sync) (t "r" ecb-rebuild-methods-buffer) (t "a" ecb-toggle-auto-expand-tag-tree) (t "x" ecb-expand-methods-nodes) (t "h" ecb-show-help) (t "gl" ecb-goto-window-edit-last) (t "g1" ecb-goto-window-edit1) (t "g2" ecb-goto-window-edit2) (t "gc" ecb-goto-window-compilation) (t "gd" ecb-goto-window-directories) (t "gs" ecb-goto-window-sources) (t "gm" ecb-goto-window-methods) (t "gh" ecb-goto-window-history) (t "ga" ecb-goto-window-analyse) (t "gb" ecb-goto-window-speedbar) (t "md" ecb-maximize-window-directories) (t "ms" ecb-maximize-window-sources) (t "mm" ecb-maximize-window-methods) (t "mh" ecb-maximize-window-history) (t "ma" ecb-maximize-window-analyse) (t "mb" ecb-maximize-window-speedbar) (t "e" eshell) (t "o" ecb-toggle-scroll-other-window-scrolls-compile) (t "\\" ecb-toggle-compile-window) (t "/" ecb-toggle-compile-window-height) (t "," ecb-cycle-maximized-ecb-buffers) (t "." ecb-cycle-through-compilation-buffers))))
 '(ecb-layout-name "left15")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote image))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
