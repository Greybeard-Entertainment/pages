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

;; Generate the site output
(org-publish-all t)

(message "Build complete")
