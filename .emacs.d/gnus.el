;; Pseudo
(setq user-full-name "Damoun")

;; Supprime la signature pour repondre
(setq message-cite-function 'message-cite-original-without-signature)

;; Decode en mime/quoted-printable
(add-hook 'gnus-article-display-hook 'gnus-article-de-quoted-unreadable)

;; resout le probleme des accents
(setq gnus-default-posting-charset (quote iso-8859-1)
      mm-body-charset-encoding-alist '((iso-8859-1 . 8bit)
				              (iso-8859-15 . 8bit)))
;; backspace for linux
(keyboard-translate ?\C-h ?\C-?) 
(keyboard-translate ?\C-? ?\C-h)