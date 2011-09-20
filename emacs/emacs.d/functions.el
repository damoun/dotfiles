(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointe par le curseur"
  (interactive)
  (manual-entry (current-word)))
