;;
;; other.el for other in /u/all/plenar_d/cu/.emacs.d
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Nov 30 17:17:47 2009 damien plenard
;; Last update Tue Dec  7 15:36:32 2010 Damien Plenard
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Ispell
;;

;; Met le dico en FR
(ispell-change-dictionary "francais")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Gnus
;;

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