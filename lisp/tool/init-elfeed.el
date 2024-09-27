;;; init-elfeed.el --- RSS Feeds and configurations -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(le-def
  :keymaps 'normal
  "ar" 'elfeed)

(use-package elfeed
  :defer 2
  :custom
  (elfeed-feeds
   '(("https://farseerfc.me/feeds/atom.xml" blog)
	 ("https://ioover.net/feed.xml" blog)
	 ("https://sh.alynx.moe/atom.xml" blog)
	 ("http://laike9m.com/blog/rss" blog)
	 ("https://hfo4.github.io/atom.xml" blog)
     ("https://pyonpyon.today/rss.xml" blog)
     ("https://typeblog.net/feed" blog)
     ("https://blog.yuuta.moe/index.xml" blog)

	 ("https://xkcd.com/atom.xml" webcomic)

     ("https://hacks.mozilla.org/feed/" tech)
     ("https://fasterthanli.me/index.xml" tech)

	 ("https://www.vincehut.top/?feed=atom" inspiration)
     ("https://selfh.st/rss/" newsletter)
     ))

  :config
  (evil-make-overriding-map elfeed-search-mode-map 'normal))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
