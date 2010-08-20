;;
;; norme.el for norme in /u/all/plenar_d/cu
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Nov 30 16:50:33 2009 damien plenard
;; Last update Tue May  4 17:28:17 2010 damien plenard
;;

;; Longueur maximum de chaque ligne a 80 caracteres
(add-hook 'c-mode-common-hook 'turn-on-auto-fill)
(setq-default fill-column 80)