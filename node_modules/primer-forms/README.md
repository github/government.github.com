# Primer CSS Forms

[![NPM version](http://img.shields.io/npm/v/primer-forms.svg)](https://www.npmjs.org/package/primer-forms)
[![Build Status](https://travis-ci.org/primer/forms.svg?branch=master)](https://travis-ci.org/primer/forms)

> Style individual form controls and utilize common layouts.

This repository is a module of the full [primer-css][primer-css] repository.

## Install

This repository is distributed with [npm][npm]. After [installing npm][install-npm], you can install `primer-forms` with this command.

```
$ npm install --save primer-forms
```

## Usage

The source files included are written in [Sass][sass] (`scss`) You can simply point your sass `include-path` at your `node_modules` directory and import it like this.

```scss
@import "primer-forms/index.scss";
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
title: Forms
homepage: https://github.com/primer/primer-forms
status: Stable
-->

### Forms

Style individual form controls and utilize common layouts.

- We reset several elements' default styles for cross browser consistency and easier manipulation later. This includes `<fieldset>`s, WebKit validation bubbles, and most textual `<input>`s.
- Specific types of textual `<input>`s are styled automatically, but `.form-control` is available should you need it.
- Always declare a `type` on your `<button>`s.
- Form layouts rely on form groups.

#### Kitchen sink

All our inputs and buttons side-by-side for easy testing of sizing and alignment with one another.

```html
<p>
  <button class="btn">Button</button>
  <button class="btn select-menu-button">
    Select menu
  </button>
  <input class="form-control" type="text" placeholder="Standard input">
  <input class="form-control input-monospace" type="text" placeholder="Monospace input">
  <select class="form-select">
    <option>Select</option>
  </select>
</p>

<p>
  <button class="btn btn-sm">Small button</button>
  <button class="btn btn-sm select-menu-button">
    Select menu
  </button>
  <input class="form-control input-sm" type="text" placeholder="Small input">
  <select class="form-select select-sm">
    <option>Select</option>
  </select>
</p>
```

#### Example form

Form controls in Primer currently have no basic layout specified (this is by design). You'll need to use `<fieldset>`s, `<div>`s, or other elements and styles to rearrange them.

```html
<form>
  <label for="name">Name</label>
  <input class="form-control" type="text" id="name">

  <label for="email">Email address</label>
  <input class="form-control" type="email" id="email">

  <label>
    <input type="checkbox"> Remember me
  </label>

  <label>
    <input type="radio" id="herp" name="herpderp" checked> Herp
  </label>
  <label>
    <input type="radio" id="derp" name="herpderp"> Derp
  </label>

  <button class="btn" type="submit">Submit</button>
</form>
```

#### Form contrast

Textual form controls have a white background by default. You can change this to a light gray with `.input-contrast`.

```html
<form>
  <input class="form-control" type="text" placeholder="Default input">
  <input class="form-control input-contrast" type="text" placeholder="Input with contrast">
</form>
```

#### Sizing

Make inputs smaller, larger, or full-width with an additional class.

##### Small

```html
<form>
  <input class="form-control input-sm" type="text" placeholder="Small input">
</form>
```

##### Large

```html
<form>
  <input class="form-control input-lg" type="text" placeholder="Large input">
</form>
```

##### Block

```html
<form>
  <input class="form-control input-block" type="text" placeholder="Full-width input">
</form>
```

#### Selects

Primer adds light `height` and `vertical-align` styles to `<select>`s for all browsers to render them consistently with textual inputs.

```html
<form>
  <select class="form-select">
    <option>Choose an option</option>
    <option>Git</option>
    <option>Subversion</option>
    <option>Social Coding</option>
    <option>Beets</option>
    <option>Bears</option>
    <option>Battlestar Galactica</option>
  </select>
</form>
```

##### Small

Use the `.select-sm` class to resize both default and custom `<select>`s to match the size of [our small buttons](/buttons/#default-buttons).

```html
<select class="form-select select-sm">
  <option>Choose an option</option>
  <option>Git</option>
  <option>Subversion</option>
  <option>Social Coding</option>
  <option>Beets</option>
  <option>Bears</option>
  <option>Battlestar Galactica</option>
</select>

<select class="form-select select-sm">
  <option>Choose an option</option>
  <option>Git</option>
  <option>Subversion</option>
  <option>Social Coding</option>
  <option>Beets</option>
  <option>Bears</option>
  <option>Battlestar Galactica</option>
</select>
```

#### Form groups

```html
<form>
  <dl class="form-group">
    <dt><label>Example Text</label></dt>
    <dd><input class="form-control" type="text" value="Example Value"></dd>
  </dl>

  <dl class="form-group">
    <dt><label>Example Select</label></dt>
    <dd>
      <select class="form-select">
        <option>Choose an option</option>
        <option>Git</option>
        <option>Subversion</option>
        <option>Social Coding</option>
        <option>Beets</option>
        <option>Bears</option>
        <option>Battlestar Galactica</option>
      </select>
    </dd>
  </dl>

  <dl class="form-group">
    <dt><label>Example Textarea</label></dt>
    <dd>
      <textarea class="form-control"></textarea>
    </dd>
  </dl>
</form>
```

#### Form group validation

Convey errors and warnings for form groups. Add the appropriate class—either `.errored` or `.warn`—to the `<dl class="form-group">` to start. Then, house your error messaging in an additional `<dd>` with either `.error` or `.warning`.

```html
<form>
  <dl class="form-group errored">
    <dt><label>Example Text</label></dt>
    <dd><input class="form-control" type="text" value="Example Value"></dd>
    <dd class="error">This example input has an error.</dd>
  </dl>
  <br>
  <dl class="form-group warn">
    <dt><label>Example Text</label></dt>
    <dd><input class="form-control" type="text" value="Example Value"></dd>
    <dd class="warning">This example input has a warning.</dd>
  </dl>
</form>
```

#### Checkboxes and radios

Utilities to spice up the alignment and styling of checkbox and radio controls.

```html
<form>
  <div class="form-checkbox">
    <label>
      <input type="checkbox" checked="checked">
      Available for hire
    </label>
    <p class="note">
      This will do insanely <strong>awesome</strong> and <strong>amazing</strong> things!
    </p>
  </div>
</form>
```

You may also add emphasis to the label:

```html
<form>
  <div class="form-checkbox">
    <label>
      <input type="checkbox" checked="checked">
      <em class="highlight">Available for hire</em>
    </label>
  </div>
</form>
```

#### Input group

Attached an input and button to one another.

```html
<form>
  <div class="input-group">
    <input class="form-control" type="text" placeholder="Username">
    <span class="input-group-button">
      <button class="btn">
        <%= octicon "clippy" %>
      </button>
    </span>
  </div>
</form>
```

#### Form actions

Align buttons to the right—via `float: right` on the buttons—in forms with `.form-actions`. The floats are automatically cleared for you.

```html
<div class="form-actions">
  <button type="button" class="btn btn-primary">Save changes</button>
  <button type="button" class="btn">Cancel</button>
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
