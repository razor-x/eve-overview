# EVE Online Overview Profile Generator

_Generates DRY modular overview profiles._

[![MIT License](http://img.shields.io/badge/license-MIT-red.svg?style=flat)](./LICENSE.txt)
[![Dependency Status](http://img.shields.io/gemnasium/razor-x/eve-overview.svg?style=flat)](https://gemnasium.com/razor-x/eve-overview)
[![Build Status](http://img.shields.io/travis/razor-x/eve-overview/master.svg?style=flat)](https://travis-ci.org/razor-x/eve-overview)

## Installation

Download the pre-built YAML files under [releases].

Alternatively, clone or fork this project and roll your own.

[releases]: https://github.com/razor-x/eve-overview/releases

## Description

This generates individual EVE-importable `.yaml` files
from the overview files in the `overviews` directory.

### Overviews

Each overview file is a YAML file in the `overviews` directory
that specifies how to combine the YAML files
in the other folders to create a set of overviews.

An example overview file looks like

````yaml
# overviews/default.yml
---
appearance: default
columns: default
labels: default
settings: default
tabs:
  - default
````

Each parameter references a `.yml` file in the corresponding folder.

The `appearance`, `columns`, `labels`, and `settings`
YAML files use syntax identical to that generated by the EVE client.

The `tabs` YAML file is different.
An overview will be created for each set of tabs.

### Tabs

Each tabs file is a five element array (one for each tab).

An example tabs files looks like

````yaml
# tabs/default.yml
---
- name: travel
  color: FFFFBB33
  overview: travel
  bracket: minimal

- name: primary
  color: FF33B5E5
  overview: ships
  bracket: all

- name: tactical
  color: FF99CC00
  overview: friendly
  bracket: all

- name: auxiliary
  color: FFAA66CC
  overview: skirmish
  bracket: all

- name: disengage
  color: FFFF4444
  overview: celestial
  bracket: all
````

The `name` and `color` parameters control
the in-game display of the tab name.

The `overview` and `bracket` parameters each reference
a `.yml` file in the `presets` folder.

### Presets

An example preset file looks like

````yaml
# presets/skirmish.yml
---
name: skirmish
symbol: ❏
level: 1
groups:
  - pvp
  - celestial
states:
  - all
````

The `name`, `symbol`, and `level` parameters control
the in-game display of the preset name.

The `states` parameter is an array that references any number of
`.yml` files in the `states` folder.
The preset will use the filters defined in all supplied states.

The `groups` parameter is an array that references any number of
`.yml` files in the `groups` folder.
The preset will use the objects from all supplied groups.

### States

Each state file is just an array of state ids.

### Groups

Each group file can contain two attributes:

- `types` is just an array of object ids.
- `include` is an array of other groups.

Do not include a group that references the group that is including it.

An example group file looks like

````yaml
# groups/pvp.yml
---
include:
  - ships
  - planets
types:
  - 100
  - 101
````

## Requirements

Ruby ≥ 2 with [Bundler](http://bundler.io/).

[Bundler]: http://bundler.io/

## Usage

Install the required gems with

````bash
$ bundle
````

Build the overview files to the `Overview` directory with

````bash
$ rake
````

## Development and Testing

### Source Code

The [source for EVE Online Overview Profile Generator][source]
is hosted on GitHub.
To clone the project run

````bash
$ git clone https://github.com/razor-x/eve-overview.git
````

[source]: https://github.com/razor-x/eve-overview

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/razor-x/eve-overview/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create a new Pull Request.

## License

EVE Online Overview Profile Generator is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
