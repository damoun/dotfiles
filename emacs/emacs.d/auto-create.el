;; create Makefile
(add-hook 'find-file-hook
          (lambda()
	    (if (and
		 (= (buffer-size) 0)
		 (string-match "\\Makefile$" (buffer-file-name)))
		(create-makefile))))
	    
;; protect the include file
(add-hook 'find-file-hook
          (lambda()
	    (if (and
		 (= (buffer-size) 0)
		 (or
		  (string-match "\\.h$" (buffer-file-name))
		  (or
		   (string-match "\\.hh$" (buffer-file-name))
		   (string-match "\\.hpp$" (buffer-file-name)))))
		(progn (insert-protect-header)
		       (goto-line 13)))))

;; create main
(add-hook 'find-file-hook
          (lambda()
	    (if (and
		 (= (buffer-size) 0)
		 (string-match "\\main.c$" (buffer-file-name)))
		(create-main))))
