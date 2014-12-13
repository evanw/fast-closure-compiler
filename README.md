fast-closure-compiler2
====

This gets around the long startup time of [Google Closure Compiler](https://developers.google.com/closure/compiler/) using [Nailgun](http://www.martiansoftware.com/nailgun/), which runs a single java process in the background and keeps all of the classes loaded.

## Installation:

    npm install fast-closure-compiler2

## Usage:

    fastclosure --js script.js --js_output_file script.min.js

## fast-closure-compiler2 vs. fast-closure-compiler

Folked because the original [fast-closure-compiler](https://github.com/evanw/fast-closure-compiler) is not maintained.

The advantages are:

* Support latest Closure Compiler and Nailgun
* Support Mac OS 10.9 and 10.10
* Support Linux environment in addition to Mac OS
* Expose `fastclosure` as global command instead of `closure`
* Now maintena
