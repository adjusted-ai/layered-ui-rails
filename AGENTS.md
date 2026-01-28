# AGENTS.md

This file provides guidance to AI agents when working with code in this repository.

## Project Overview

This is **layered-ui-rails**, a Rails 7+ engine gem that provides a foundational responsive UI system for Rails applications with light and dark theme support. It delivers design tokens, Tailwind CSS utilities, and Stimulus.js controllers for theme switching and mobile navigation. This is a pure frontend gem with no server-side logic.

## Architecture

**Entry Point:** `require "layered-ui-rails"` loads `lib/layered/ui.rb` → `lib/layered/ui/engine.rb`

**Engine Setup (`lib/layered/ui/engine.rb`):**
- Registers importmap paths from `config/importmap.rb`
- Adds `app/assets/images` and `app/javascript` to the asset pipeline

**CSS (`app/assets/tailwind/layered/ui/styles.css`):**
- Design tokens as CSS variables (HSL format) with light/dark mode variants
- Dark mode via `.dark` class on `<html>` (class-based, not media query)
- Custom Tailwind `@theme` block exposes tokens as utilities (e.g., `bg-background`, `text-foreground`)
- Component classes: `.btn-primary`, `.field`, `.nav__item`, `.notice--success`, etc.
- Layout: 63px header, 240px sidebar, 320px assistant panel

**Generator (`lib/generators/layered/ui/install_generator.rb`):**
- Copies CSS to host app at `app/assets/tailwind/layered_ui.css`
- Adds `@import "./layered_ui";` to `app/assets/tailwind/application.css`
- Run with: `bin/rails generate layered:ui:install`

**JavaScript (`app/javascript/layered_ui/`):**
- `index.js` - Registers all controllers with the Stimulus application
- `controllers/theme_controller.js` - Dark/light mode (localStorage + `prefers-color-scheme`)
- `controllers/mobile_menu_controller.js` - Mobile nav toggle with click-outside-to-close

## Commands

```bash
# Install dependencies
bundle install

# Build gem locally
gem build layered-ui-rails.gemspec

# Install gem locally for testing
gem install ./layered-ui-rails-0.1.0.gem
```

## Key Conventions

- CSS is installed via generator (`bin/rails generate layered:ui:install`) which copies it to the host app
- JavaScript uses importmap (no bundler)
- Stimulus controllers registered as `theme` and `mobile-menu`
