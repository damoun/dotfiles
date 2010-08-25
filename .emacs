;;
;; dot.emacs for skel in /afs/.epitech.net/users/skel
;; 
;; Made by rocky luke
;; Login   <root@epitech.eu>
;; 
;; Started on  Thu Aug 28 09:39:55 2008 rocky luke
;; Last update Wed Aug 25 15:39:46 2010 damien plenard
;;

(load "~/.emacs.d/std.el")
(load "~/.emacs.d/std_comment.el")

(if (file-exists-p "~/.myemacs") 
    (load-file "~/.myemacs"))
; EOF

(put 'upcase-region 'disabled nil)
