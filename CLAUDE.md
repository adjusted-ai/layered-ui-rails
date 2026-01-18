# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **layered-ui**, a Rails 8+ engine gem that provides a foundational responsive UI system for Rails applications with light and dark theme support. It delivers design tokens, Tailwind CSS utilities, and Stimulus.js controllers for theme switching and mobile navigation. This is a pure frontend gem with no server-side logic.

## Architecture

**Entry Point:** `require "layered-ui"` loads `lib/layered/ui.rb` → `lib/layered/ui/engine.rb`

**Engine Setup (`lib/layered/ui/engine.rb`):**
- Registers importmap paths from `config/importmap.rb`
- Adds `app/assets/images` and `app/javascript` to the asset pipeline

**CSS (`app/assets/tailwind/layered_ui_engine/engine.css`):**
- Design tokens as CSS variables (HSL format) with light/dark mode variants
- Dark mode via `.dark` class on `<html>` (class-based, not media query)
- Custom Tailwind `@theme` block exposes tokens as utilities (e.g., `bg-background`, `text-foreground`)
- Component classes: `.btn-primary`, `.field`, `.nav-item`, `.notice--success`, etc.
- Layout: 63px header, 240px sidebar, 320px assistant panel

**JavaScript (`app/javascript/layered_ui/`):**
- `index.js` - Registers all controllers with the Stimulus application
- `controllers/theme_controller.js` - Dark/light mode (localStorage + `prefers-color-scheme`)
- `controllers/mobile_menu_controller.js` - Mobile nav toggle with click-outside-to-close

## Commands

```bash
# Install dependencies
bundle install

# Build gem locally
gem build layered-ui.gemspec

# Install gem locally for testing
gem install ./layered-ui-0.1.0.gem
```

## Key Conventions

- Follows [tailwindcss-rails engine convention](https://github.com/rails/tailwindcss-rails?tab=readme-ov-file#rails-engines-support-experimental) for CSS
- JavaScript uses importmap (no bundler)
- Stimulus controllers registered as `theme` and `mobile-menu`
