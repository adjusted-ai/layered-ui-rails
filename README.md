# layered-ui

Foundational responsive UI system for Rails applications with light and dark theme support.

## Requirements

- Ruby on Rails >= 8.0
- Tailwind CSS Rails >= 4.0

## Installation

Add to your Gemfile:

```ruby
gem "layered-ui"
```

Then run:

```bash
bundle install
```

## Setup

### Tailwind CSS

Import the layered-ui styles in your `app/assets/tailwind/application.css`:

```css
@import "tailwindcss";
@import "../builds/tailwind/layered_ui_engine";
```

The gem follows the [tailwindcss-rails engine convention](https://github.com/rails/tailwindcss-rails?tab=readme-ov-file#rails-engines-support-experimental). Run `rails tailwindcss:engines` to generate the entry point at `app/assets/builds/tailwind/layered_ui_engine.css`.

**Development:** Add `bundle exec rails tailwindcss:engines` to your `bin/dev` script before foreman starts to ensure engine CSS is always up to date during development.

**Production:** Choose one of these approaches:

1. **Commit the built CSS** (simpler deploys):
   ```bash
   bin/rails tailwindcss:engines
   git add app/assets/builds/tailwind/layered_ui_engine.css
   git commit -m "Add compiled engine CSS for production"
   ```

2. **Build during deployment** (keeps build artifacts out of version control):
   ```ruby
   # In your Rakefile or a rake task file
   Rake::Task["assets:precompile"].enhance(["tailwindcss:engines"])
   ```
   Or run `bin/rails tailwindcss:engines` before `assets:precompile` in your deploy script.

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
