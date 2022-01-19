# [EVE Online Overview Generator]

_Generate DRY modular overviews._

[![Release](https://img.shields.io/github/release/razor-x/eve-overview.svg)](https://github.com/razor-x/eve-overview/releases)
[![GitHub Actions](https://github.com/razor-x/eve-overview/workflows/main/badge.svg)](https://github.com/razor-x/eve-overview/actions)

__Don't die on patch day because you missed adding that new ship-type to one of your presets!__

## Description

### Overview Pack

An exhaustive and customizable overview pack:
download from the [main site](https://io.evansosenko.com/eve-overview/).
For questions, submit a new GitHub issue.

_I only update this pack when I'm actively playing EVE.
If you would like me to release an update, please submit an issue._

### Generator

The EVE Online Overview Generator facilitates creating and maintaining overview packs.

Essentially, you define a common set of LEGO bricks and build your overviews with them.

First, create overviews out of game by editing a set of YAML files.
Then, generate importable overview files by running the included Ruby script.

Rather than a single YAML file per overview, the various overview settings are split
into many files which can be reused to create custom overviews
based on a set of common groups, presets, settings, etc.
The modular design makes updating, sharing, and customizing simple.

__Visit the [project site][EVE Online Overview Generator] for full documentation.__

[![Donate ISK](https://img.shields.io/badge/Donate%20ISK-Leon%20Razor-blue.svg)](https://gate.eveonline.com/Profile/Leon%20Razor)

[EVE Online Overview Generator]: https://io.evansosenko.com/eve-overview/

## Installation

Download the pre-built overview YAML files under [releases]
and import them into the EVE client (resetting the overview first is recommended).

Alternatively, clone or fork this project and build your own overviews.

[releases]: https://github.com/razor-x/eve-overview/releases

## Requirements

Ruby ≥ 2 with [Bundler](http://bundler.io/).

[Bundler]: http://bundler.io/

## Usage

Install the required gems with

```bash
$ bundle
```

Build the overview files to the `Overview` directory with

```bash
$ rake
```

## Development and Testing

### Source Code

The [source for EVE Online Overview Generator][source]
is hosted on GitHub.
To clone the project run

```bash
$ git clone https://github.com/razor-x/eve-overview.git
```

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

EVE Online Overview Generator is licensed under the MIT license.

All Eve Related Materials © CCP hf. All rights reserved. Used with permission.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
