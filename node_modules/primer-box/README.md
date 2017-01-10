# Primer CSS box

[![NPM version](http://img.shields.io/npm/v/primer-box.svg)](https://www.npmjs.org/package/primer-box)
[![Build Status](https://travis-ci.org/primer/box.svg?branch=master)](https://travis-ci.org/primer/box)

> Box is a module for creating rounded-corner boxes with a white background and gray borders. Box has optional element styles for headers, lists, and footers.

This repository is a module of the full [primer-css][primer-css] repository.

## Install

This repository is distributed with [npm][npm]. After [installing npm][install-npm], you can install `primer-box` with this command.

```
$ npm install --save primer-box
```

## Usage

The source files included are written in [Sass][sass] (`scss`) You can simply point your sass `include-path` at your `node_modules` directory and import it like this.

```scss
@import "primer-box/index.scss";
```

You can also import specific portions of the module by importing those partials from the `/lib/` folder. _Make sure you import any requirements along with the modules._

## Build

For a compiled **css** version of this module, a npm script is included that will output a css version to `build/build.css` The built css file is also included in the npm package.

```
$ npm run build
```

## Documentation

You can read more about other primer modules in the [full primer docs][docs].

<!-- %docs
title: Box
homepage: https://github.com/primer/primer-box
status_issue: https://github.com/github/design-systems/issues/198
status: New release
-->

### Box

A `.Box` is a container with a a white background and light gray border. By default there are no additional styles, such as padding. These should be added as needed with utility classes.
Additional `margin` or `padding` may be required to properly space content.

```html
  <div class="Box">
    This is a box.
  </div>
```

## Box elements
Box elements include `Box-header`, `Box-body`, and `Box-footer`. These elements include borders and consistent padding.

```html
  <div class="Box">
    <div class="Box-header">
      Box header
    </div>
    <div class="Box-body">
      Box body
    </div>
    <div class="Box-footer">
      Box footer
    </div>
  </div>
```

<!-- %enddocs -->

## License

[MIT](./LICENSE) &copy; [GitHub](https://github.com/)

[primer-css]: https://github.com/primer/primer
[docs]: http://primercss.io/
[npm]: https://www.npmjs.com/
[install-npm]: https://docs.npmjs.com/getting-started/installing-node
[sass]: http://sass-lang.com/
