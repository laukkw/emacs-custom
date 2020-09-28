;;; init-modeline.el --- init spaceline. -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2017-2020  Kevin Leung
;;
;; Author: Kevin Leung <kevin.scnu@gmail.com>
;; URL: https://github.com/lkzz/emacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
;;
;;; Commentary:
;;
;;; Code:
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  (setq doom-modeline-height 5)
(setq doom-modeline-project-detection 'project)
(setq doom-modeline-buffer-file-name-style 'auto)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-github-interval (* 20 60))
(setq doom-modeline-env-go-executable "go"))
(setq find-file-visit-truename t)
;; built-in `project' on 26+
(setq doom-modeline-project-detection 'project)
;; or `find-in-project' if it's installed
(setq doom-modeline-project-detection 'ffip)
;;; powerline.el ends here

