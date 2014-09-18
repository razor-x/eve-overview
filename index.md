---
layout: content
subnav:
  - id: introduction
  - id: usage
  - id: structure
---

<a name="introduction"></a>
<h2 data-magellan-destination="introduction">Introduction</h2>

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
