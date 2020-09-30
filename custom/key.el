;;;start
;;;开启shell
(global-set-key (kbd "C-x a") 'shell)
;;; kill windows 
(global-set-key (kbd "C-c C-d") 'kill-this-buffer)
;;; 跳转行
;;;(global-set-key (kbd "C-x C-e") 'goto-line)

;;;tab 
(global-set-key (kbd "C-> ")  'awesome-tab-ace-jump)
(global-set-key (kbd "C-<")  'awesome-tab-select-beg-tab)

;;
;;;switch buffer
(global-set-key (kbd "ESC s") 'ivy-switch-buffer)

;;;end'
