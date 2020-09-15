;;; org.el --- org mode related                      -*- lexical-binding: t; -*-
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

(org-babel-load-file "~/.emacs.d/custom/org-setup.org")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C . t)
   (go . t)
   (emacs-lisp . t)
   (shell . t)))

;;;note

(package-install 'org-roam)
(package-install 'org-roam-server)

(require 'org-roam-protocol)                                        ;设定工作目录
(setq org-roam-directory "~/WorkBench/org/roam")

                                        ;设置自启动
(add-hook 'after-init-hook 'org-roam-mode)
                                        ;设置可视化

(setq org-roam-server-host "127.0.0.1"
      org-roam-server-port 9999
      org-roam-server-export-inline-images t
      org-roam-server-authenticate nil
      org-roam-server-network-label-truncate t
      org-roam-server-network-label-truncate-length 60
      org-roam-server-network-label-wrap-length 20)
(org-roam-server-mode)

;;;设置抓取
(add-to-list 'org-roam-capture-ref-templates
             '("a" "Annotation" plain (function org-roam-capture--get-point)
               "%U ${body}\n"
               :file-name "${slug}"
               :head "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n"
               :immediate-finish t
               :unnarrowed t))

;;;设置 roam 的 templete
(setq org-roam-capture-templates
      '(
        ("d" "default" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "%<%Y%m%d>-${slug}")
        ("g" "group")
        ("ga" "Group A" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "%<%Y%m%d%H%M%S>-${slug}"
         :head "#+title: ${title}\n#+roam_alias:\n\n")
        ("gb" "Group B" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "%<%Y%m%d%H%M%S>-${slug}"
         :head "#+title: ${title}\n#+roam_alias:\n\n")))
(provide 'org)
;;; org.el ends here
