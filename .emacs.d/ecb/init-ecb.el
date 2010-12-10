(require 'ecb)
(custom-set-variables
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-layout-name "left15")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote image)))
(ecb-activate)

(defun ecb-off ()
  (interactive)
  ()
  (ecb-deactivate)
  (set-screen-width 80))

(defun ecb-on ()
  (interactive)
  ()
  (set-screen-width))