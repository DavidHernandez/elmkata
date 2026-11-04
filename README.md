[![Build Status](https://travis-ci.org/DavidHernandez/elmkata.svg?branch=master)](https://travis-ci.org/DavidHernandez/elmkata)

> elmkata

## Docker

The image pins Node 6.17.1 (npm 3.10.10) and Elm 0.17.0, so nothing needs to be installed locally.

* Dev server with live reload: `docker compose up app`, then open http://localhost:3000
* Unit tests in the browser: `docker compose up reactor`, then open http://localhost:8000/src/elm/TestRunner.elm
* One-off commands: `docker compose run --rm app gulp publish`

Elm 0.17's npm installer no longer works because Bintray is gone. The `Dockerfile` explains where the Elm binaries come from instead.

## Installation

Make sure the following are installed:

* NodeJs (and npm)
* Elm (e.g. `npm install -g elm@0.17.0`)
* Compass (for SASS) (`gem update --system && gem install compass`)

## Usage

1. Serve locally, and watch file changes: `gulp`
1. Prepare file for publishing (e.g. minify, and rev file names): `gulp publish`
1. Deploy to GitHub's pages (`gh-pages` branch of your repository): `gulp deploy`

## Unit Tests

In order to view the tests on the browser Start elm reactor (elm-reactor) and navigate to http://0.0.0.0:8000/src/elm/TestRunner.elm

## License

MIT
