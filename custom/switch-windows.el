;;; 

(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
(global-set-key (kbd "C-x e") 'switch-window-then-delete)
;;;(global-set-key (kbd "ESC o") 'delete-window)
;;;(global-set-key (kbd "C-x C-g") ')
;;;end 
