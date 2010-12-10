;; change the name of the window
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; Colors
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