;;
;; fonctions.el for fonctions in /u/all/plenar_d/cu/.emacs.d
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Nov 30 17:20:18 2009 damien plenard
;; Last update Sat May  8 16:23:51 2010 damien plenard
;;

;; Lancer le man
(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointe par le curseur"
  (interactive)
  (manual-entry (current-word)))
