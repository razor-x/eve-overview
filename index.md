---
layout: content
title: Overview Generator for EVE Online
picture: overview.jpg
subnav:
  - id: introduction
  - id: usage
  - id: structure
    name: Overview structure
  - id: faq
    name: FAQ
  - id: changelog
    name: CHANGELOG
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

Read on for the details or check out the [FAQ](#faq).

<a name="usage"></a>
<h2 data-magellan-destination="usage">How can I use this?</h2>

### Use the default pack

This project maintains several overview groups and presets.
Each release provides a set of default overview profiles
you can download and import directly into the EVE client.

#### Installation or upgrade

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

#### Included presets

Presets are organized into groups and optimized for a given activity or role.
Most presets include common "required" objects such as bombs and scanner probes,
although some very specific presets may purposely exclude such things.
The following is meant as a summary.
To see exactly what makes up each preset,
see the source code for the version you are using or check in the EVE client.

- ✈ travel
  - Designed to be loaded into the first tab.
  - Shows rats.
  - The default travel preset shows stations and gates.
  - Includes a preset that hides stations.
  - Includes a preset that shows hostiles.
- ♞ hostile
  - Presets that display hostile entities.
  - The minimal preset shows only ships and the sun.
  - Includes presets for drones.
  - Includes a versatile set of presets to filter by ship classes.
- ★ friendly
  - Works just like the hostile presets, but only shows friendlies.
- ☆ fleet
  - Works just like the hostile presets, but only shows fleet members.
- ♜ sov
  ([in development](https://github.com/razor-x/eve-overview/issues/2))
  - Presets tailored for sovereignty warfare.
- ♣ pve
  - Includes presets for mining, missioning, and ratting.
  - Specialized PvE presets
    ([in development](https://github.com/razor-x/eve-overview/issues/4)).
- ✥ dscan
  - Presets designed to be used by the directional scanner.
- ✪ extra
  - Utility presets.
  - Includes a warpout preset for escaping to celestials.
  - The loot preset shows hostiles while the salvage preset does not.
- ❏ brackets
  - Presets designed to be loaded as brackets.

Special thanks to [Oh Takashawa] for maintaining Sarah's Overview Pack
which inspired much of style behind the packaged default overview.

[Oh Takashawa]: https://twitter.com/OhTakashawa

### Use a community pack

If you have created an overview pack with this generator,
create a new issue in the [GitHub issue tracker], and I'll add a link here.

[GitHub issue tracker]: https://github.com/razor-x/eve-overview/issues

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

1. Fork or clone the [source repository]. You should only need the `master` branch.

    ````bash
    $ git clone https://github.com/{{ site.source_repo }}.git --branch master
    ````
    You can also fork someone else's fork to base your overview off theirs.

2. Install the needed Ruby gems with

    ````bash
    $ bundle
    ````
3. Edit the `.yml` files according to their descriptions in the next section.
4. Build the overview files to the `Overview` folder with

    ````bash
    $ rake
    ````

Optionally, you can setup Travis CI to automatically build your overviews.
See this project's [.travis.yml][travis.yml] file as an example
and the [corresponding documentation][GitHub Releases Uploading] for details.

[travis.yml]: https://github.com/{{ site.source_repo }}/blob/master/.travis.yml
[GitHub Releases Uploading]: http://docs.travis-ci.com/user/deployment/releases/
[source repository]: https://github.com/{{ site.source_repo }}

#### Updating

You can pull updates from this project into your fork using git.
This way, you can maintain your own overview pack,
but still benefit directly from updates to the original project.

Just add this as a remote,

````bash
$ git remote add upstream https://github.com/{{ site.source_repo }}.git
````

When you want to merge updates, fetch and merge.
For example,

````bash
$ git fetch --no-tags upstream
$ git merge upstream/master
````

<a name="structure"></a>
<h2 data-magellan-destination="structure">Overview structure</h2>

This section covers how the modular file structure of the Overview Generator
fits together to generate the importable overview files.

### Overview

Each file under `overviews` will generate a set of importable `.yaml` files:
one for each selected group of tabs.

For example,

```yaml
# overviews/default.yml
---
appearance: default
columns: default
labels: default
settings: default
tabs:
  - pve
  - pvp
```

will generate `Overview/default-pve.yaml` and `Overview/default-pvp.yaml`.
Thus, there will be two overview files that are identical aside from the
tab settings defined in `tabs/pve.yml` and `tabs/pvp.yml`.

The first four attributes load options from the corresponding file,
e.g., this overview will use `appearances/default.yml`, `columns/default.yml`,
`labels/default.yml`, and `settings/default.yml`.

### Basic settings and appearance

The following is the simplest way to create any `.yml` file for one of the
four types: appearance, columns, labels, or settings.

1. Setup the corresponding overview options in the EVE client.
2. Export the overview from the EVE client to a file.
3. Open the exported file and copy and paste the corresponding keys.

#### Appearance

Files under `appearances` define the tag, color, background color, and blink priority.

The following keys should be defined here:

- `flagOrder`
- `flagStates`
- `backgroundOrder`
- `backgroundStates`
- `stateBlinks`
- `stateColorsNameList`

For example,

```yaml
# appearances/default.yml
---
flagOrder:
  - 13
  - 44
  - 52
  ...

flagStates:
  - 9
  - 11
  - 12
  ...

backgroundOrder:
  - 13
  - 44
  - 52
  ...

backgroundStates:
  - 9
  - 10
  - 11
  ...

stateBlinks:
  - - background_13
    - false
  - - background_44
    - false
  - - flag_13
    - true
  ...

stateColorsNameList:
  - - background_10
    - white
  - - background_12
    - darkBlue
  ...
```

Note that the ellipses indicate some content was removed for brevity.

#### Columns

Files under `columns` define the columns and the order they appear in the overview.

The following keys should be defined here:

- `columnOrder`
- `overviewColumns`

For example,

```yaml
# columns/default.yml
---
columnOrder:
  - ICON
  - DISTANCE
  - NAME
  - TYPE
  - ALLIANCE

overviewColumns:
  - ALLIANCE
  - DISTANCE
  - ICON
  - NAME
  - TYPE
```

#### Labels

Files under `labels` define how objects are labeled in space.

The following keys should be defined here:

- `shipLabelOrder`
- `shipLabels`

For example,

```yaml
# labels/default.yml
---
shipLabelOrder:
  - ship type
  - alliance
  - corporation
  - pilot name
  - ship name
  - null

shipLabels:
  - - null
    - - - post
        - ''
      - - pre
        - '['
      - - state
        - 0
      - - type
        - null
  - - alliance
    - - - post
        - '}'
      - - pre
        - ' {'
      - - state
        - 1
      - - type
        - alliance
  ...
```

Note that the ellipses indicate some content was removed for brevity.

#### Settings

Files under `settings` define any other general overview settings.

The following key should be defined here:

- `userSettings`

For example,

```yaml
# settings/default.yml
---
userSettings:
  - - hideCorpTicker
    - true
  - - overviewBroadcastsToTop
    - true
```

### Tabs

Files under `tabs` define the name of each tab and which
overview presets and bracket presets are loaded for that tab.

You can define up to five tabs.

Each tab must set the following keys:

- `name` - the title that labels the tab
- `color` - the hex color value to use for the tab label
- `overview` - the overview preset to use for the tab
- `bracket` - the bracket preset to use for the tab

The `overview` and `bracket` keys can point to any file under the `presets` folder.

For example, here are the first two tabs of a PvE setup,

```yaml
# tabs/pve.yml
---
- name: npc
  color: FF99CC00
  overview: pve-npc
  bracket: brackets-all

- name: salvage
  color: FFFF4444
  overview: extra-loot
  bracket: brackets-all
...
```

and the first two tabs of a PvP setup,

```yaml
# tabs/pvp.yml
---
- name: ✈
  color: FFFFBB33
  overview: travel
  bracket: brackets-all

- name: hostile
  color: FF33B5E5
  overview: hostile-minimal
  bracket: brackets-all
...
```

Note that the ellipses indicate the code for the other three tabs was removed for brevity.

### Presets

Each overview tab in the EVE client loads an overview preset,
which determines what appears in the current overview window,
and a bracket preset, which determines which brackets appear in space.
Presets are normally created and saved manually in the EVE client,
however this is tedious and prone to error.

Each file in the `presets` folder corresponds to a saved preset.
Every preset defined this way will be included in every generated
importable overview file, and thus may be imported into the EVE client.

Preset files define which object types to display through groups,
and which state filters to apply using states.

The `name`, `symbol`, and `level` keys determine the preset name.

The `groups` key is a list of files in the `groups` folder.

The `states` key is a list of files in the `states` folder.

For example, a clean PvP preset is

```yaml
# presets/hostile-minimal.yml
---
name: minimal
symbol: ♞ hostile
level: 1
groups:
  - common-minimal
  - _celestial-sun
  - _ship
states:
  - hostile
```

In this case, the preset will appear in-game as `♞ hostile -- minimal`.

The preset will show all objects defined in the files
`groups/common-minimal.yml`, `groups/_celestial-sun.yml`, `groups/_ship.yml`.
Specifically it will show the sun, all ship types, and a common set of required PvP objects
such as bombs, probes, etc.

It will use the `states/hostile.yml` file, thus hiding friendlies.

### States

Files under `states` define a set of filtered and always-shown states
which may be referred to and reused to create presets.

These files are most easily created by setting the filters
in the EVE client, and then pulling the array of numeric ids
from the exported file.

For example, this filters out all ships from displaying,
but always shows fleet members

```yaml
#  states/fleet.yml
---
show:
  - 11
hide:
  - 13
  - 17
  - 18
  - 19
  - 21
  - 44
```

### Groups

Groups collect object types together under a custom name
so they may be referred to and reused to create presets.

Groups can contain two keys:

- `types` - an array of object type ids
- `include` - an array of groups to include in this group

By convention, all groups that are prefixed with an underscore correspond
exactly to the group of objects with the same name in the EVE client.
For example, `groups/_celestial.yml` is everything under the Celestial group,
and `groups/_celestial-moon.yml` is only the Moon type under the Celestial group.

For example, the default `common-minimal` group

```yaml
# groups/common-minimal.yml
---
include:
  - _charge-scanner_probe
  - beacons
  - bombs
  - bubbles
```

only includes other groups such as

```yaml
# groups/_charge-scanner_probe.yml
---
types:
  - 479
```

and

```yaml
# groups/bubbles.yml
---
include:
  - _charge-interdiction_probe
  - _deployable-mobile_warp_disruptor
```

and

```yaml
# groups/bombs.yml
---
types:
  - 90
  - 863
  - 864
```
<a name="faq"></a>
<h2 data-magellan-destination="faq">FAQ</h2>

#### Who are you?

I've been playing EVE since 2008 and am currently a Core member of [Agony Unleashed].

#### Should I trust you?

Can you really trust anyone in EVE other than Chribba?

As for trusting the overview, the entire project is open source and open to scrutiny.
Please submit any bugs or issues you find.
Don't fly what you can't afford to loose.
I'm not responsible for any loses you might incur while using the overview.

> This software is provided "as is" and without any express or
> implied warranties, including, without limitation, the implied
> warranties of merchantibility and fitness for a particular
> purpose.

#### Is this an overview pack?

Yes, but it's much more.

Anyone who wants a new overview can use the provided overview pack out of the box.

If you are setup with the listed requirements you can use this
as a base for customizing or making your own pack.

#### Should I use this?

Do you want a new overview?

Do you want to make an overview pack for yourself,
corporation, alliance, or the general public?

Do you like the idea of having your overview under version control
and appreciate the flexibility and precision of the modular design?

If you answered yes to any of the above then you should try this!

Note that I'm still adding presets and tweaking the default overview,
but I've been using this as my primary overview for while now.

#### Where is the graphical interface?

My goal with this project is to track my overview in version control
in a [DRY] format while keeping everything in human readable text files.
I have no plans to write a web interface or a graphical program.

#### I still don't get it?

That's okay. You can still just download the pack.

I didn't intend for this to be generally accessible to everyone.
If you have any development or general hacking experience
the listed requirements should be familiar or at lease approachable.

#### Can I contribute?

Yes. This project (including this project site)
is open source and hosted on GitHub.
Pull requests and issue reports are welcome.
Keep in mind that everyone has a different opinion on what makes a good overview,
so I can't possibly promise to incorporate all suggestions.

If you find this useful, I will accept ISK donations
to the in-game corporation `Measure Zero`.

[Agony Unleashed]: http://www.agony-unleashed.com/
[DRY]: https://en.wikipedia.org/wiki/Don't_repeat_yourself

<a name="changelog"></a>
<a data-magellan-destination="changelog"></a>

<div id="changelog">
  <h2>Loading CHANGELOG.</h2>
</div>
