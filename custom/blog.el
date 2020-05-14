;;; blog.el --- rzry

;;; Commentary:
;; 

(require 'ox-publish)
  (setq org-publish-project-alist
        '(

         ("blog-notes"
   :base-directory "/home/rzry/rzry.github.io/blog/notes/"
   :base-extension "org"
   :publishing-directory "/home/rzry/rzry.github.io/blog/"
   :recursive t
   :publishing-function org-html-publish-to-html
   :headline-levels 4             ; Just the default for this project.
   :auto-preamble t
   :section-numbers nil
   :author "Rzry"
   :email "rzry36008@ccie.lol"
   :auto-sitemap t                ; Generate sitemap.org automagically...
   :sitemap-filename "index.org"  ; ... call it sitemap.org (it's the default)...
   :sitemap-title "Rzry's Blog"         ; ... with title 'Sitemap'.
   :sitemap-sort-files anti-chronologically
   :sitemap-file-entry-format "%d %t"
   :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"/>"
   )
           ("blog-static"
   :base-directory "/home/rzry/rzry.github.io/blog/notes/"
   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
   :publishing-directory "/home/rzry/rzry.github.io/blog/"
   :recursive t
   :publishing-function org-publish-attachment
   )


 ("blog" :components ("blog-notes" "blog-static"))

          ))
;;; Code:

(setq org-src-fontify-natively t)

(provide 'blog)

;;; blog.el ends here
