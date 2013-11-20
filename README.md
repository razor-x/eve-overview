# Jekyll & ZURB

[![Dependency Status](https://gemnasium.com/razor-x/jekyll-and-zurb.png)](https://gemnasium.com/razor-x/jekyll-and-zurb)
[![Build Status](https://travis-ci.org/razor-x/jekyll-and-zurb.png?branch=master)](https://travis-ci.org/razor-x/jekyll-and-zurb)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/razor-x/jekyll-and-zurb/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

Source for your personal blog running on Jekyll and Foundation.
Just clone and blog: create the `_posts` and `_drafts` folder.

- Bare bones [Jekyll](http://jekyllrb.com/) blog: HTML5 & CSS3 ready.
- Running [Foundation by ZURB](http://foundation.zurb.com/).
- Asset pipeline with [Jekyll::AssetsPlugin](https://github.com/ixti/jekyll-assets).
- Bower for asset dependency management.
- Plugins for easy responsive images and YouTube videos.
- [Compass](http://compass-style.org/), [Sass](http://sass-lang.com/), [CoffeeScript](http://coffeescript.org/).
- Basic [Rake](https://github.com/jimweirich/rake) tasks with support for dev and testing modes, run `rake -D` for info.
- Meta data system for SEO.
- Optional pagination using Foundation.
- [Disqus](https://disqus.com/) ready: set `disqus: your_shortname` in `_config.yml`.
- [Google Analytics](http://www.google.com/analytics/) ready: see `google_analytics` variable in `_config.yml`.
- [Piwik](https://piwik.org/) ready: set `piwik: yoursite.com/piwik/` in `_config.yml` (yoursite.com/piwik/ points to the piwik install root).

## Quick start

Just clone this with

    git clone https://github.com/razor-x/jekyll-and-zurb.git my_blog

run `bundle && bower install` and create the `_posts` folder.
Head over to the [Jekyll Docs](http://jekyllrb.com/docs/home/) for the rest of the details.

## Add future update support

If you want to merge in future updates from this project and have your own origin,
set up a separate branch to track this.

    git remote rename origin razorx-jekyll-and-zurb
    git branch jekyll-and-zurb
    git branch -u razorx-jekyll-and-zurb/master jekyll-and-zurb

Then add an origin and push master

    git remote add origin git@github.com:username/username-blog.git
    git push -u origin master

Now, the `jekyll-and-zurb` branch will pull changes from this project,
which you can then merge into your other branches.

## Updating

The `Gemfile` is using pessimistic version constraints for everything,
so if you want major updates, you need to bump the versions yourself.

JavaScript library versions need to be updated in `bower.json` and `_config.yml`.

If you update Foundation, but sure to update the version numbers in `Gemfile` and `bower.json`.

## License

This code is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
