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
(require 'go-mode)
(set-variable 'gofmt-command "goimports")

(defun go-mode-fmt ()
  (interactive)
  (when (eq major-mode 'go-mode)
    (gofmt)))
(global-set-key (kbd "C-c f") 'go-mode-fmt)



(require 'eglot)
(add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
(define-key eglot-mode-map (kbd "C-c d") 'eglot-help-at-point)
(define-key eglot-mode-map (kbd "C-c v") 'eglot-shutdown)
(add-hook 'go-mode-hook #'eglot-ensure)

;;;(add-hook 'go-mode-hook #'company-mode-on)
;;; go.el ends here
