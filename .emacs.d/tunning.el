;;
;; tunning.el for color in /u/all/plenar_d/cu/.emacs.d
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Nov 30 16:59:22 2009 damien plenard
;; Last update Sat May  8 16:12:58 2010 damien plenard
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Tuning-Emacs
;;

;; Nom de la fenetre
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; Ligne courante en surbrillance :)
;; (require 'highlight-current-line)
;; (highlight-current-line-on t)
;; (set-face-background 'highlight-current-line-face "grey")

;; Couleur
(set-face-background 'show-paren-match-face "red")
(set-face-background 'show-paren-mismatch-face "red")
(set-face-foreground 'show-paren-mismatch-face "red")
(set-cursor-color "black")

;; Zonning apres 1 minute 30secondes
;; (when (>= emacs-major-version 21)
;;   (require 'zone)
;;   (setq zone-idle 90)
;;   (zone-when-idle 90))

;; cursor clignote
(if (>= emacs-major-version 21)
    (blink-cursor-mode -1))

;; Activer la coloration syntaxique
(global-font-lock-mode t)
;; Mettre un maximu de couleurs
(setq font-lock-maximum-size nil)