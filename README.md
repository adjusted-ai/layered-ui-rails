# layered-ui-rails

Foundational responsive UI system for Rails applications with light and dark theme support.

## Requirements

- Ruby on Rails >= 7.0
- Tailwind CSS Rails >= 4.0

## Installation

Add to your Gemfile:

```ruby
gem "layered-ui-rails"
```

Then run:

```bash
bundle install
```

## Setup

### Tailwind CSS

Run the install generator to copy the CSS to your application:

```bash
bin/rails generate layered:ui:install
```

This will:
- Copy `layered_ui.css` to `app/assets/tailwind/layered_ui.css`
- Add `@import "./layered_ui";` to your `app/assets/tailwind/application.css`

### JavaScript

The gem automatically configures importmap. Import and register the controllers in your `application.js`:

```javascript
import "layered_ui"
```

Or register controllers individually:

```javascript
import "layered_ui/controllers/theme_controller"
import "layered_ui/controllers/mobile_menu_controller"
```

This registers the `theme` and `mobile-menu` Stimulus controllers.

## Stimulus Controllers

### Theme Controller

Manages dark/light mode switching with system preference detection and localStorage persistence.

```html
<div data-controller="theme">
  <button data-action="click->theme#toggle">Toggle Theme</button>
</div>
```

The controller:
- Detects system preference via `prefers-color-scheme` on connect
- Respects saved preference in localStorage (`theme` key)
- Toggles the `dark` class on `<html>`

### Mobile Menu Controller

Handles mobile navigation visibility with click-outside-to-close behavior.

```html
<div data-controller="mobile-menu" data-action="click@window->mobile-menu#close">
  <button data-action="click->mobile-menu#toggle">Menu</button>
  <nav data-mobile-menu-target="nav">
    <!-- Navigation content -->
  </nav>
</div>
```

The controller:
- Toggles `open` class on the nav target
- Closes menu when clicking outside
