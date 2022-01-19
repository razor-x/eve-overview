# EVE Online Overview Generator

_Project page built with Jekyll & ZURB_

[![MIT License](https://img.shields.io/github/license/razor-x/eve-overview.svg)](./LICENSE.txt)
[![release](https://github.com/razor-x/eve-overview/actions/workflows/release.yml/badge.svg?branch=source)](https://github.com/razor-x/eve-overview/actions/workflows/release.yml)

The rest of this README is just cloned from
[Jekyll & ZURB](https://github.com/razor-x/jekyll-and-zurb).

Source for your personal blog running on Jekyll and Foundation 5.
Just clone and blog: create the `_posts` and `_drafts` folder.

Demo at [io.evansosenko.com/jekyll-and-zurb/](https://io.evansosenko.com/jekyll-and-zurb/).

Lots of baked in features that work even if you don't want to use Foundation.

If you like this, check out the sister project
[Jekyll & deck.js](https://github.com/razor-x/jekyll-and-deck.js).

### Bare bones [Jekyll](http://jekyllrb.com/) site or blog: HTML5 & CSS3 ready.

  * Basic [Rake](https://github.com/jimweirich/rake) tasks with support
    for dev and testing modes, run `rake -D` for info.
  * Automatically publish to [GitHub pages](http://pages.github.com/)
    with GitHub Actions.
  * [LiveReload](http://livereload.com/) support. Just run `guard`.

### Running [Foundation by ZURB](http://foundation.zurb.com/).

  * Plugins for easy responsive images and YouTube videos.
  * Optional pagination using Foundation.
  * Includes [Foundation Icon Fonts](http://zurb.com/playground/foundation-icon-fonts-3).

### Asset pipeline with [Jekyll::AssetsPlugin](https://github.com/ixti/jekyll-assets).

  * [Bower](http://bower.io/) for asset dependency management.

### Modern web libraries and patterns.

  * Syntax highlighting with [highlight.js](http://highlightjs.org/).
  * Load fonts with [Web Font Loader](https://github.com/typekit/webfontloader).
  * Load JavaScript asynchronously with [HeadJS](http://headjs.com).
  * [Load GitHub Gists asynchronously](https://gist.github.com/razor-x/8288761).
  * Meta data system for SEO and social media support.
  * Complete favicon set from [Favic-o-matic](http://www.favicomatic.com/).

### Analytics and social features.

  * Social media button support.
  * [Disqus](https://disqus.com/) ready:
    set `disqus: your_shortname` in `_config.yml`.
  * [Google Analytics](http://www.google.com/analytics/) ready:
    see `google_analytics` variable in `_config.yml`.
  * [Piwik](https://piwik.org/) ready:
    set `piwik: yoursite.com/piwik/` in `_config.yml`
    (yoursite.com/piwik/ points to the piwik install root).

## Quick start

You will need Ruby ≥ 2 with [Bundler](http://bundler.io/) and [Bower](http://bower.io/).

Just clone this with

```bash
$ git clone https://github.com/razor-x/jekyll-and-zurb.git my-blog
```

run `bundle && bower install` and create the `_posts` folder.
Head over to the [Jekyll Docs](http://jekyllrb.com/docs/home/) for the rest of the details.

Running off the `master` branch may be unstable and is not suitable for production.
Only tagged releases are considered stable.

## Demo site and documentation

The `master` branch of this project is designed to be used
as a starting point for your site and as a branch to pull updates from.
Thus, most features are disabled by default,
and only the `index.html` page has been created with minimal markup.

The `demo` branch is a full website that will contain
real examples and documentation for the included features.
That branch is automatically built and published by GitHub Actions.

Demo site hosted on GitHub pages:
[io.evansosenko.com/jekyll-and-zurb/](https://io.evansosenko.com/jekyll-and-zurb/).

## Add future update support

If you want to merge in future updates from this project and have your own origin,
set up a separate branch to track this.

```bash
$ git remote rename origin upstream
$ git branch jekyll-and-zurb
$ git branch -u upstream/master jekyll-and-zurb
```

Then add an origin and push master

```bash
$ git remote add origin git@github.com:username/my-blog.git
$ git push -u origin master
```

Now, the `jekyll-and-zurb` branch will pull changes from this project,
which you can then merge into your other branches.

If you later clone your repo you will need to create the update branch again.

```bash
$ git remote add upstream https://github.com/razor-x/jekyll-and-zurb.git
$ git fetch upstream
$ git checkout -b jekyll-and-zurb upstream/master
```

## Automatic publishing to GitHub pages with GitHub Actions

If you are hosting at `username.github.io` you will need to leave the `master` branch empty
and put your code in a different branch.
The `master` branch otherwise functions like the `gh-pages` branch below.

[See here](http://pages.github.com/) for details on the different use cases.

First, make a `gh-pages` branch unless you are using `master` as discussed above,

```bash
$ git checkout --orphan gh-pages
```

and **remove all files and folders except the `.git` directory**.

```bash
$ git reset .
$ git clean -fdx
```

Then, make an initial commit with only `index.html`, push it, and make sure it goes live online.

```bash
$ echo "GitHub Pages placeholder" > index.html
$ git add index.html
$ git commit -m "GitHub Pages placeholder"
$ git push -u origin gh-pages
$ git checkout master
```

### Staging site

If the environment variable `STAGING_URL` is set,
then this value will be used to set `domain`, `baseurl`, and the assets `baseurl`.
This is useful when you want to setup a staging site
on a separate development repository.

You may override the CNAME for the staging site by setting
the `CNAME` environment variable.
Set `CNAME` to `false` to remove the `CNAME` file on build.

## Updating

The `Gemfile` is using pessimistic version constraints for everything,
so if you don't want to wait for updates, you need to bump the versions yourself,
run `bundle update` and commit the updated `Gemfile.lock`.

JavaScript library versions need to be updated in `bower.json` and `_config.yml` (for CDN support).
If you want to update Foundation, update the version number in `bower.json`.

## License

This code is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
