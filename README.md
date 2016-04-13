# hubot-chunkify
[![npm version](https://badge.fury.io/js/hubot-chunkify.svg)](https://badge.fury.io/js/hubot-chunkify)

__This script relies on a new Hubot [v2.17.0](https://github.com/github/hubot/blob/master/CHANGELOG.md#v2170) feature known as ['response middleware'](https://github.com/github/hubot/pull/1021). It WILL NOT work on older versions of Hubot.__

A Hubot script for handling long messages by chunking them up into shorter messages. Useful for gracefully handling adapters that have a maximum message length. Test it out on `hubot help`.

## Installation via NPM

1. Install the **hubot-chunkify** module as a Hubot dependency by running:

    ```
    npm install --save hubot-chunkify
    ```

2. Enable the module by adding the **hubot-chunkify** entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-chunkify"
    ]
    ```

3. Run your bot and see below for available config / commands


## Configuration

Variable | Default | Description
--- | --- | ---
`HUBOT_CHUNKIFY_MAX` | 320 | Any message sent by Hubot that is longer than `HUBOT_CHUNKIFY_MAX` string characters will be replaced by a series of messages split by newline and `HUBOT_CHUNKIFY_MAX`.
