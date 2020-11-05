;;;start
;;;开启shell
(global-set-key (kbd "ESC t") 'shell)
;;; kill windows 
(global-set-key (kbd "ESC d") 'kill-this-buffer)
;;; 跳转行
;;;(global-set-key (kbd "C-x C-e") 'goto-line)

;;;tab 
(global-set-key (kbd "C-> ")  'awesome-tab-ace-jump)
(global-set-key (kbd "C-<")  'awesome-tab-select-beg-tab)

;;
;;;switch buffer
(global-set-key (kbd "ESC s") 'ivy-switch-buffer)


;;;翻译
(global-set-key (kbd "C-r") 'sdcv-search-pointer+)
;;; 补全
(global-set-key (kbd "M->") 'toggle-company-english-helper)
;;;汉译英
(global-set-key (kbd "M-<") 'insert-translated-name-insert)
;;;Sky blue waiting for rain And I'm waiting for you
;;;end'
