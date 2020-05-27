;;;  init.el --- Initialization file for Emacs
;;;Commentary: Emacs Startup File --- initialization for Emacs
;;;                             Rzry_Emacs_config                                           ;;;;
;;;                                                                                         ;;;;
;;;                             Date: 20200514                                              ;;;;
;;;                                                                                         ;;;;
;;;                             rzry                                                        ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               添加套件路径                                               ;;;;

;;; Commentary:
;; 

(require 'package)
;;; Code:

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
;;             ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;;             ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;;;生效套件路径                                                                             ;;;;
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                             设置自动保存备份                                            ;;;;
(defconst emacs-tmp-dir (format "%s%s/" temporary-file-directory "emacs-backup"))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)
;;;                             自定义变量路径
(setq custom-file "~/.emacs.d/custom-variables.el")
(when (file-exists-p custom-file)
  (load custom-file))
;;;                             use package 插件管理                                        ;;;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
  (use-package diminish :ensure t)
  (use-package bind-key :ensure t)
;;;                            设定是否更新                                                 ;;;;
  (use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))
;;;                            菜单                                                         ;;;;
(menu-bar-mode -1)
;;;                            括号                                                         ;;;;
(show-paren-mode t)
;;;                            自动补全括号                                                 ;;;;
(electric-pair-mode t)
;;                             添加<> 成对                                                  ;;;;
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            ))
;;;                            关掉 tab 单独设置                                            ;;;;
(setq-default indent-tabs-mode nil)
;;;                            视窗跳转 支持C x ←                                          ;;;;
(winner-mode t)
;;;                            函数折叠  C c @ C h    C c @ C s                             ;;;;
(add-hook 'prog-mode-hook #'hs-minor-mode)
;;;                            匹配选中                                                     ;;;;
(use-package multiple-cursors
  :ensure t
  :bind (
         ("M-c" . mc/mark-next-like-this)
         ("M-m" . mc/mark-previous-like-this)
         :map ctl-x-map
         ("\C-m" . mc/mark-all-dwim)
         ("<return>" . mule-keymap)
         ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                           ivy-mode 模糊匹配搜索比如打开文件;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  (setq ivy-use-virutal-buffers t) ;;;加快启动速度
  (setq enable-recursive-minibuffers t) ;;;加快启动速度
  (setq ivy-height 10);;;展示10个待选
  (setq ivy-initial-inputs-alist nil);;;初始项为nil
  (setq ivy-count-format "%d/%d");;;; 1/23
  (setq ivy-re-builders-alist
        `((t . ivy--regex-ignore-order)))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;代替原来 M x C x C f;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("\C-x \C-f" . counsel-find-file)))
;;;; 代替原来的搜索
(use-package swiper
  :ensure t
  :bind (("\C-s" . swiper))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;yasnippet输入key出来代码;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode)
  (use-package yasnippet-snippets :ensure t)
  ;;;自己下载一些 package 在 elpa的文件下面
  ;;; 使用 yas-des***-table 查看当前模式下面的yas
  ;;; 可以点进去自定义修改 yas new snippets 新增
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;补全;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :ensure t
  :config
  (global-company-mode t) ;;;所有模式都启动 global mode
  (setq company-idle-delay 0) ;;;反应时间
  (setq company-minimum-prefix-length 2) ;;; 三个字开始
  (setq company-backends
        '((company-files ;;;补全引入路径
           company-yasnippet ;;;补全snippet
           company-keywords ;;;补全key
           company-capf ;;;
           )
          (company-abbrev company-dabbrev))))
;;; 绑定到主模式
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (add-to-list  (make-local-variable 'company-backends)
                                                '(company-elisp))))
;;; 更改选项 选择  本来是 M n   改成 C n
(with-eval-after-load 'company
  (define-key company-active-map (kbd "\C-n") #'company-select-next)
  (define-key company-active-map (kbd "\C-p") #'company-select-previous)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil))
;;;如果打了三个字没有跳出 就使用 company diag 来检查
;;;major mode 是 主模式 used backend 是使用的 补全模式

;;; yasnippet 会和 company 的  tab 冲突 所以
;;;
(advice-add 'company-complete-common :before (lambda () (setq my-company-point (point))))
(advice-add 'company-complete-common :after (lambda () (when (equal my-company-point (point))
                                                         (yas-expand))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;语法检查 flycheck   查看错误检查  C c ! v的依赖;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;查看错误 C c ! l
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t)
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;magit;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
  :ensure t
  :bind (("\C-x g" . magit-status))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Projectile;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;跳转 以 项目 git 为基准
;;;C c p p 跳转
;;; 可以跳转函数 C c p a  c++ 的header 就可以 go 不行
;;;搜索grep C c p s g
(use-package projectile
  :ensure t
  :bind-keymap
  ("\C-c p" . projectile-command-map)
  :config
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  (use-package counsel-projectile
    :ensure t)
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;搜索类似  grep ** -ri;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;sudo apt-get install silversearcher-ag 记得安装这个
;;;
(use-package ag
  :ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                 org                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/custom/org.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                 Blog                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/custom/blog.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                 golang              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;暂时使用 lsp-mode company-lsp 来做代码提示
(load "~/.emacs.d/custom/go.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package posframe
  :ensure t
  )

(require 'posframe)
(load-file "~/.emacs.d/nox/nox.el")
(dolist (hook (list
               'js-mode-hook
               'rust-mode-hook
               'python-mode-hook
               'ruby-mode-hook
               'java-mode-hook
               'sh-mode-hook
               'php-mode-hook
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'haskell-mode-hook
               ))
  (add-hook hook '(lambda () (nox-ensure))))

(provide 'init)

;;;;;;;;;
;;;(lab-themes-load-style 'dark)
;;;(flucui-themes-load-style 'dark)

(setq-default mode-line-format
              '("%e"
                ;;mode-line-front-space
                mode-line-client
                ;;mode-line-modified
                ;; mode-line-remote -- no need to indicate this specially 
                ;; mode-line-frame-identification -- this is for text-mode emacs only
                "--   -- Miss:Zxx --- "
                ;mode-line-directory
                mode-line-buffer-identification
                " "
                mode-line-position
                "   "
                ;;mode-line-modes
                ;;;mode-line-misc-info
                "Path: "
                buffer-file-name
                "    "
                (flycheck-mode flycheck-mode-line)
                lsp--before-change-vals
                "    "
                " Author :rzry    "
                ))


;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
