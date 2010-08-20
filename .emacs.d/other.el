;;
;; other.el for other in /u/all/plenar_d/cu/.emacs.d
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Nov 30 17:17:47 2009 damien plenard
;; Last update Sat May  8 16:25:33 2010 damien plenard
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

(require 'ucs-tables)
(unify-8859-on-encoding-mode 1)
(unify-8859-on-decoding-mode 1)
