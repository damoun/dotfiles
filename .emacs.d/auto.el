;;
;; auto.el for auto in /u/all/plenar_d/cu
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Dec  7 09:58:08 2009 damien plenard
;; Last update Tue Dec  7 16:59:51 2010 Damien Plenard
;;

;; Mise en place du header d'un fichier (auto)
;; (add-hook 'find-file-hook
;;           (lambda()
;; 	    (if (= (buffer-size) 0)
;; 		(std-file-header))))

;; Si Makefile vide, creer une makefile
(add-hook 'find-file-hook
          (lambda()
	    (if (and
		 (= (buffer-size) 0)
		 (string-match "\\Makefile$" (buffer-file-name)))
		(create-makefile))))
	    
;; Si header vide, creer un header protege
(add-hook 'find-file-hook
          (lambda()
	    (if (and
		 (= (buffer-size) 0)
		 (string-match "\\.h$" (buffer-file-name)))
		(progn (insert-protect-header)
		       (goto-line 13)))))

;; Si main vide, creer un main
(add-hook 'find-file-hook
          (lambda()
	    (if (and
		 (= (buffer-size) 0)
		 (string-match "\\main.c$" (buffer-file-name)))
		(create-main))))

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