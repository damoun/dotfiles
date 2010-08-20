;;
;; utils.el for utils in /u/all/plenar_d/cu/.emacs.d
;; 
;; Made by damien plenard
;; Login   <plenar_d@epitech.net>
;; 
;; Started on  Mon Nov 30 16:57:30 2009 damien plenard
;; Last update Sat May  8 16:39:47 2010 damien plenard
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Utile
;;

;; numero de ligne a gauche
;(global-linum-mode 1)

;; Affiche l'heure au format 24h
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(display-time)

;; Suppression des espaces en fin de ligne a l'enregistrement
(add-hook 'c++-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook   'c-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))

;; Laisser le curseur en place lors d'un defilement par pages.
;; Par defaut, Emacs place le curseur en debut ou fin d'ecran
;; selon le sens du defilement.
(setq scroll-preserve-screen-position t)

;; Complette automatiquement ce que vous tapez dans le mini-buffer
(icomplete-mode 1)

;; Pouvoir utiliser la completition sous emacs en ignorant la casse
(setq completion-ignore-case t)

;; Supprime les fichier ~
(setq make-backup-files nil)

;; parenthese em couleur
(custom-set-variables
 '(show-paren-mode t))
(custom-set-faces)

;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)

;; Affiche le numero de ligne et de colonne
(column-number-mode t)
(line-number-mode t)

;; Enlever le message au demarrage
(setq inhibit-startup-message t)

;; Remplacer le texte selectionne si on tape
(delete-selection-mode t)

;; Sauvegarder la session
(desktop-load-default)
(desktop-read)

;; ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Pour la roulette de la souris
(mouse-wheel-mode t)
