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
(use-package snails
  :load-path "~/.emacs.d/custom/snails"
  :if (display-graphic-p)
  :custom-face
  (snails-content-buffer-face ((t (:background "#111" :height 110))))
  (snails-input-buffer-face ((t (:background "#222" :foreground "gold" :height 110))))
  (snails-header-line-face ((t (:inherit font-lock-function-name-face :underline t :height 1.1))))
  :init
  (use-package exec-path-from-shell :if (featurep 'cocoa) :defer t)
  :config
  ;; Functions for specific backends
  (defun snails-current-project ()
    (interactive)
    (snails '(snails-backend-projectile snails-backend-rg snails-backend-fd)))
  (defun snails-active-recent-buffers ()
    (interactive)
    (snails '(snails-backend-buffer snails-backend-recentf)))
  (defun snails-everywhere ()
    (interactive)
    (snails '(snails-backend-everything snails-backend-mdfind)))
    :bind (("C-S-r" . snails)))
(provide 'init-snails)
;;;end el
