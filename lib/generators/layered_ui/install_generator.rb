module LayeredUi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy Layered UI CSS to the host application"

      def self.source_root
        Layered::Ui::Engine.root
      end

      def copy_css
        copy_file(
          "app/assets/tailwind/layered_ui/styles.css",
          "app/assets/tailwind/layered_ui.css"
        )
      end

      def add_css_import
        application_css = "app/assets/tailwind/application.css"

        return unless File.exist?(application_css)

        content = File.read(application_css)
        import_line = '@import "./layered_ui";'

        return if content.include?(import_line)

        # Insert after the first @import "tailwindcss" line
        if content.include?('@import "tailwindcss"')
          inject_into_file application_css, "\n#{import_line}", after: '@import "tailwindcss";'
          say "Added import to #{application_css}", :green
        else
          append_to_file application_css, "\n#{import_line}\n"
          say "Appended import to #{application_css}", :green
        end
      end

      def show_instructions
        say ""
        say "layered-ui-rails installed successfully!", :green
        say ""
        say "Copied app/assets/tailwind/layered_ui.css and imported into app/assets/tailwind/application.css"
        say ""
      end
    end
  end
end
