;; -*- lexical-binding: t; -*-
(require 'ox-publish)

(message "Building")
;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./docs"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html)))

;; Generate the site output
(org-publish-all t)

(message "Build complete")
