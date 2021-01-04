;;; theem.el --- org mode related                      -*- lexical-binding: t; -*-
;; Copyright (C) 2018  Jerry Hsieh
;; Author: Jerry Hsieh <jerryhsieh@Jerryde-MacBook-Pro.local>
;; Keywords: calendar, processes

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

;; 

;;; Code:
(setq custom-safe-themes t)

;; doom theme enable
(use-package doom-themes
   :config
   ;; Global settings (defaults)
   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
         doom-themes-enable-italic t) ; if nil, italics is universally disabled
   ;; Enable flashing mode-line on errors
   (doom-themes-visual-bell-config)

   (if (display-graphic-p)
       (progn
         ;; Enable custom neotree theme (all-the-icons must be installed!)
         (doom-themes-neotree-config)
         ;; or for treemacs users
         (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
         (doom-themes-treemacs-config)
         ))

   ;; Corrects (and improves) org-mode's native fontification.
   (doom-themes-org-config))

(if (string-equal system-type "darwin")
    (use-package darkokai-theme
      :ensure t
      :config (load-theme 'darkokai t))
  (use-package doom-themes
    :ensure t
    :config (load-theme 'doom-nord))
  )


;; nerd-icons
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/nerd-icons"))
;;(require 'nerd-icons)

;; modeline
;;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode))

 ;;;(set-face-background 'mode-line nil)
