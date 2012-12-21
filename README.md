# fast-closure-compiler

This gets around the long startup time of [Google Closure Compiler](https://developers.google.com/closure/compiler/) using [Nailgun](http://www.martiansoftware.com/nailgun/), which runs a single java process in the background and keeps all of the classes loaded.

Installation:

    npm install fast-closure-compiler

Usage:

    closure --js script.js --js_output_file script.min.js
