# Changelog

## 2.11.5

- Set Modernizr version to force version 2 as 3 is incompatible.

## 2.11.4

- Fix bug with ssh-agent command.

## 2.11.3

- Fix issue when using `DEPLOY_KEY`.
- Set staging site CNAME with `CNAME` environment variable.

## 2.11.2

- Update minor dependencies.

## 2.11.1

- Fix gist tag not loading async.

## 2.11.0

- Use io.js v2.5.0.
- Remove Compass.
- Remove default webfonts.
- Load Foundation Icon Fonts from cdnjs.
- Update jekyll-assets to 1.0.0.
- Use `h2` for 404 page.

## 2.10.0

- Deploy keys can be overridden via the `DEPLOY_KEY`
  environment variable.
- Switch to using [rake-jekyll] for git based deployment.
  You may now set the `SOURCE_BRANCH` environment variable
  to enable testing on all other branches.
- Split main body content out from the default layout
  and into a new body layout.
- Use gist-aysnc bower package.
- Remove Sub-content feature.
- Add staging environment support for Travis CI builds.
- Add 404 page.
- Optimize Travis build by adding bower to package.json.

[rake-jekyll]: https://github.com/jirutka/rake-jekyll

## 2.9.1

- Update jQuery to 2.1.4.

## 2.9.0

- Update Foundation to 5.2.2.
- Use `<noscript>` tag and no `src` for picture-tag interchange mode.
- Travis CI deployment now uses deploy keys instead of personal access tokens.
  If you use this feature you must follow the new setup instructions.

## 2.8.2

- Travis CI optimizations.

## 2.8.1

- Fix Twitter button width bug.

## 2.8.0

- Update Foundation to 5.5.1.
- Remove social button fade-in (kept breaking).

## 2.7.6

- Fix body visibility.
- Fix Facebook Like Button aync issue.

## 2.7.5

- Don't use async loading for critial assets
  to prevent flash of unstyled content.

## 2.7.4

- Update Google +1 Button code.
- Update Facebook Like Button code.

## 2.7.3

- Fix issue where display property on body could cause display bugs.

## 2.7.2

- Regenerate bower.json.

## 2.7.1

Version 2.6.1 introduced a change that would
print your deploy token in the Travis CI build.

If you suspect you were affected:
**regenerate your personal access tokens!**

- Hide secure token in deploy_url.

## 2.7.0

- Add favicon.
- Add LiveReload support.

## 2.6.2

- Fix body display bug.

## 2.6.1

- Avoid flash of unstyled content due to asynchronously loading CSS.
- Travis CI updates.
- Require fonts in head.js instead of inline.

## 2.6.0

- Enable autosize for Jekyll Assets.
- Load app.css with HeadJS.
- Optimize script loading.
- Replace yepnope with HeadJS.

## 2.5.0

- Update Foundation to 5.5.0.
- Update jQuery to 2.1.3.
- Update mini_magick to 4.0.1.

## 2.4.1

- Update highlightjs to 8.4.
- Update Jekyll to 2.5.
- Update uglifier to 2.6.
- Update rake to 10.4.

## 2.4.0

- Check-in Gemfile.lock.
- Jekyll to 2.4.0.
- Foundation to 5.4.7.
- Compass to 1.0.1.

## 2.3.0

- Jekyll to 2.1.0.
- Foundation to 5.3.0.
- Other component versions updated.

## 2.2.0

- Foundation updated to version 5.2.2.
- Added Display Advertising to Google Analytics Tracking Code.

## 2.1.0

- Foundation updated to version 5.1.1.
- jQuery updated to version 2.1.0.
- Normalize.css updated to version 3.0.0.
- Added 'use strict'.

## 2.0.0

- Foundation updated to version 5.0.3.
- Modernizr.load replaced by yepnope.
- Fastclick included.
- Automatically publish to GitHub pages with Travis CI.
- Easily incorporate the source from other web projects as
  subdirectories in your site (see sub_content in `_config.yml`).
- Load fonts with Web Font Loader.
- Included Foundation Icon Fonts.
- Switched to highlight.js.
- Load GitHub Gists asynchronously.
- Only load basic Foundation JavaScript, but no plugins by default.
  * If you are using Foundation JavaScript plugins
    you will need to require them in
    `_assets/javascripts/app.js.coffee.erb`.

## 1.2.0

- Foundation updated to version 5.
- Optional pagination using Foundation.

## 1.0.0

- Now using Bower for javascript libs.
  * Need to run `bower install`.
  * jQuery version 2 by default.
  * Loading scripts via Modernizr.load.

## 0.6.0

- New option upload_only for deploy.
- Better meta tag order for SEO.

## 0.4.0

- Some config defaults have been added and changed.
- Removed sftp deploy support.
- New meta data system.
- Social features
  * Facebook share button.
  * Google+ share button.
  * Twitter tweet button.

## 0.3.0

- Google Analytics tracking code updated to use Universal Analytics.
  * `google_analytics` config variable is now a hash which takes `id` and `url`.

## 0.2.0

- Jekyll YouTube Embed Plugin for Foundation.
- Jekyll Picture Tag Plugin with Interchange support.

## 0.1.0

- Foundation to 4.3.1.

## 0.0.1

- Initial release.
