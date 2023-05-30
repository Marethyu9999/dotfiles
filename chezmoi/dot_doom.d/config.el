(setq user-full-name "Erik Grobecker"
      user-mail-address "erik@grobecker.me")

(setq doom-theme 'doom-one)

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(with-eval-after-load 'tramp
  (setq tramp-default-method "ssh"))
