;;;tabnine
(use-package company-tabnine
  :ensure t)
(add-to-list 'company-backends #'company-tabnine)


;; Trigger completion immediately.
(setq company-idle-delay 0)
(setq company-show-numbers t)
;;;end
