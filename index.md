---
layout: content
subnav:
  - id: introduction
  - id: usage
  - id: structure
---

<a name="introduction"></a>
<h2 data-magellan-destination="introduction">Introduction</h2>

<ul class="clearing-thumbs clearing-feature" data-clearing>
{% for img in site.data.overview_images %}
  <li{% if img.featured %} class="clearing-featured-img"{% endif %}>
    <a href="{{ img.src | asset_path }}">
      <img data-caption="{{ img.caption }}" alt="{{ img.caption }}" src="{{ img.thumb | asset_path }}">
    </a>
  </li>
{% endfor %}
</ul>

__Don't die on patch day because you missed adding that new ship-type to one of your presets!__

The EVE Online Overview Generator facilitates creating and maintaining overview packs.

Essentially, you define a common set of LEGO bricks and build your overviews with them.

First, create overviews out of game by editing a set of YAML files.
Then, generate importable overview files by running the included Ruby script.

Rather than a single YAML file per overview, the various overview settings are split
into many files which can be reused to create custom overviews
based on a set of common groups, presets, settings, etc.
The modular design makes updating, sharing, and customizing simple.

<a name="usage"></a>
<h2 data-magellan-destination="usage">How can I use this?</h2>

### Use the default pack

This project maintains several overview groups and presets.
Each release provides a set default overview profiles
you can download and import directly into the EVE client.

1. Download the latest release using the button at the top of this page.
2. The downloaded archive contains an `Overview` folder.
   The contents of this folder should be extracted to your `EVE/Overview` folder.
   If you are unsure of the location of the `Overview` folder,
   you can export your current overview and the client will show the export location.
3. In the EVE client, reset your overview to the default.
4. In the EVE client, import any of the extracted `.yaml` overview files.

- Each `.yaml` file has a name of the form `[overview]-[tabs].yaml`.
  Each file with the same `[overview]` name will be identical
  except for the differently configured tab names and default tab presets.
- There is no need to reset your overview settings when loading
  or switching between profiles with the same `[overview]` prefix.
- For each different `[tabs]` preset that use the same `[overview]`,
  you should create an in-game overview link in your notepad to quickly switch between presets.

### Make your own or customize this one

#### Requirements

- A text editor, e.g., [Atom].
- [Ruby], any version 2 release.
- The [Bundler] gem.
- Optionally, a [GitHub] account and [git], [GitHub Windows], or [GitHub Mac].
  If you are not familiar with git, [you can try it in your browser][tryGit].
  You can download and edit the source directly without using version control,
  however this is strongly discouraged.

Setting up this software is beyond the scope of this documentation.
Packages should be available for most major Linux distributions:
for Ruby, I recommend using [rbenv].
Packages for Mac should be available through [Homebrew].
Packages for Windows can be installed with [Chocolatey].

[Atom]: https://atom.io/
[Bundler]: http://bundler.io/
[Chocolatey]: https://chocolatey.org/
[git]: http://git-scm.com/
[GitHub]: https://github.com/
[GitHub Windows]: https://windows.github.com/
[GitHub Mac]: https://mac.github.com/
[Homebrew]: http://brew.sh/
[rbenv]: https://github.com/sstephenson/rbenv
[Ruby]: https://www.ruby-lang.org/
[tryGit]: https://try.github.io/

#### Instructions

1. Fork or clone the [source repository].
   You can also fork someone else's fork to base your overview off theirs.
2. Run `bundle` to install the needed Ruby gems.
2. Edit the `.yml` files according to their descriptions in the next section.
3. Run `rake` to build the overview files to the `Overview` folder.

Optionally, you can setup Travis CI to automatically build your overviews.
See this project's [.travis.yml][travis.yml] file as an example
and the [corresponding documentation][GitHub Releases Uploading] for details.

[travis.yml]: https://github.com/{{ site.source_repo }}/blob/master/.travis.yml
[GitHub Releases Uploading]: http://docs.travis-ci.com/user/deployment/releases/
[source repository]: https://github.com/{{ site.source_repo }}

<a name="structure"></a>
<h2 data-magellan-destination="structure">Overview structure</h2>

This section covers how the modular file structure of the Overview Generator
fits together to generate the importable overview files.
