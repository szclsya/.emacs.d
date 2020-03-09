(use-package elfeed
  :config
  (setq elfeed-feeds
		'(("https://farseerfc.me/feeds/atom.xml" blog)
		  ("https://ioover.net/feed.xml" blog)
		  ("https://sh.alynx.moe/atom.xml" blog)
		  ("https://astrianzheng.cn/atom.xml" blog)
		  ("http://laike9m.com/blog/rss" blog)
		  ("https://hfo4.github.io/atom.xml" blog)

		  ("https://xkcd.com/atom.xml" webcomic)

		  ("https://viflythink.com/atom.xml" inspiration)
		  ("https://www.vincehut.top/?feed=atom" inspiration)
		  ("https://zhihu.com/rss" inspiration)
		  ))
  (evil-make-overriding-map elfeed-search-mode-map 'normal)
)

(provide 'init-elfeed)
