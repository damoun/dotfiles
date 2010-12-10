(define-skeleton insert-protect-header
  "Inserts a define to protect the header file."
  ""
  '(setq str (file-name-sans-extension
	      (file-name-nondirectory (buffer-file-name))))
"#ifndef __"(upcase str)"_H__
# define __"(upcase str)"_H__



#endif /* !__"(upcase str)"_H__ */\n")