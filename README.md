# [EVE Online Overview Generator]

_Generate DRY modular overviews._

[![MIT License](http://img.shields.io/badge/license-MIT-red.svg?style=flat)](./LICENSE.txt)
[![Dependency Status](http://img.shields.io/gemnasium/razor-x/eve-overview.svg?style=flat)](https://gemnasium.com/razor-x/eve-overview)
[![Build Status](http://img.shields.io/travis/razor-x/eve-overview/master.svg?style=flat)](https://travis-ci.org/razor-x/eve-overview)

## Description

The EVE Online Overview Generator facilitates creating and maintaining overview packs.

The overviews are created out of game by editing YAML files
and then running a Ruby script to compile the overview files for import into the EVE client.

Rather then a single YAML file per overview, the various overview settings are split
into many files which can be reused to create custom overviews
based on a set of common groups, presets, settings, etc.

Essentially, you define a common set of LEGO bricks and build your overviews with them.

This README is intended primarily for developers and contributors.

__Visit the [project site][EVE Online Overview Generator] for full documentaton.__

[EVE Online Overview Generator]: http://io.evansosenko.com/eve-overview/

## Installation

Download the pre-built overview YAML files under [releases]
and import them into the EVE client (reseting the overview first is recommended).

Alternatively, clone or fork this project and build your own overviews.

[releases]: https://github.com/razor-x/eve-overview/releases

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

The [source for EVE Online Overview Generator][source]
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

EVE Online Overview Generator is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
