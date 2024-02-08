;; -*- lexical-binding: t; -*-
(require 'ox-publish)

(message "Building")

;; Bootstrap HTMLize
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./docs"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
			 :email "ap886@cantab.ac.uk"
			 :html5-fancy t
			 :with-email t
			 :auto-sitemap t)))

(setq org-html-validation-link nil)

(defconst stylesheet "style1.css")
;; Custom appearance
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head (format "<link rel=\"stylesheet\" href=\"%s\" />" stylesheet))

;; Generate the site output
(org-publish-all t)



;; Copy local css
(message (format "Copying CSS ./docs/%s" stylesheet))
(copy-file (format "./docs/%s"stylesheet) "./public/" t nil nil nil)

(message "Build complete")
