const MergeTrees = require("broccoli-merge-trees");
const Concat = require("broccoli-concat");
const Funnel = require("broccoli-funnel");
const Myth = require("broccoli-myth");

var source = "."

var styles = [
  "bower_components/normalize.css/normalize.css",
  "source/application.css"
]
var scripts = [
  "transpile/application.js",
  "source/application.js"
]
var maps = [
  "transpile/application.js.map"
]
var htmls = [
  "source/index.html"
]
var assets = [

]
var libs = [
  "lib/**/*.rb"
]

// Styles
styles = Concat(source, {
  inputFiles: styles,
  outputFile: "/application.css",
});
styles = Myth(styles);

// Scripts
scripts = Concat(source, {
  inputFiles: scripts,
  outputFile: "/application.js",
  wrapInFunction: false
});

// Source Maps
maps = Funnel(source, {
  files: maps,
  getDestinationPath: function(relativePath) {
    if (relativePath.indexOf("transpile/") > -1) {
      return relativePath.replace("transpile/", "");
    } else {
      return relativePath;
    }
  }
});

// Templates
htmls = Funnel(source, {
  files: htmls,
  getDestinationPath: function(relativePath) {
    if (relativePath.indexOf("source/") > -1) {
      return relativePath.replace("source/", "");
    } else {
      return relativePath;
    }
  }
});

// Assets
assets = Funnel(source, {
  files: assets,
  srcDir: ".",
  destDir: ".",
  getDestinationPath: function(relativePath) {
    if (relativePath.indexOf("source/") > -1) {
      return relativePath.replace("source/", "");
    } else {
      return relativePath;
    }
  }
});

// Sources
libs = Funnel(source, {
  include: libs,
  getDestinationPath: function(relativePath) {
    if (relativePath.indexOf("lib/") > -1) {
      return relativePath.replace("lib/", "");
    } else {
      return relativePath;
    }
  }
});

module.exports = new MergeTrees([styles, scripts, maps, libs, assets, htmls]);
