;; flymake
(require 'flymake)
(add-hook 'c-mode-hook
	  (lambda () (flymake-mode t)))
(add-hook 'c++-mode-hook 
	  (lambda () (flymake-mode t)))

;; flymake error in TTY
(defun next-flymake-error ()
  (interactive)
  (let ((err-buf nil))
    (condition-case err
        (setq err-buf (next-error-find-buffer))
      (error))
    (if err-buf
        (next-error)
      (progn
	(flymake-goto-next-error)
	(let ((err (get-char-property (point) 'help-echo)))
	  (when err
	    (message err)))))))