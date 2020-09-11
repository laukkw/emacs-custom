; go.el --- Go rleated setup                       -*- lexical-binding: t; -*-

;; Copyright (C) 2018  vagrant

;; Author: vagrant <vagrant@node1.onionstudio.com.tw>
;; Keywords: languages

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;; Code:
;;;  lose  zxxx
(use-package go-mode
  :ensure t
  :mode (("\\.go\\'" . go-mode))
  :config
  (setq gofmt-command "goimports")
  (setq electric-pair-mode nil))
;;  (use-package company-go
;;    :ensure t
;;    :config
;;    (add-hook 'go-mode-hook (lambda()
;;                              (add-to-list (make-local-variable 'company-backends)
;;                                           '(company-lsp company-files company-yasnippet company-capf company-dabbrev))))))

;;;tabline


(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;;(use-package company-tabnine
;;  :ensure t
  
;;  )


;;  (use-package go-errcheck
;;    :ensure t
;;    :hook (go-mode . go-errcheck-ignore)
;;  )
;;  (use-package lsp-mode
;;    :ensure t
;;    :hook (go-mode . lsp-mode)
;;    )
;;  (use-package company-lsp
;;      :defer t
;;      :init (setq company-lsp-cache-candidates 'auto))

;;;  (use-package lsp-ui
;;      :defer t
;;      :commands lsp-ui-mode)

;;;(add-hook 'go-mode-hook #'company-mode-on)
;;; go.el ends here
