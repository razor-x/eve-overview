# Changelog

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
