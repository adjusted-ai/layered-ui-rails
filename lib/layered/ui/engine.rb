module Layered
  module Ui
    class Engine < ::Rails::Engine
      isolate_namespace Layered::Ui

      initializer "layered-ui-rails.importmap", before: "importmap" do |app|
        app.config.importmap.paths << Engine.root.join("config/importmap.rb")
      end

      initializer "layered-ui-rails.assets" do |app|
        app.config.assets.paths << Engine.root.join("app/assets/images")
        app.config.assets.paths << Engine.root.join("app/javascript")
      end

      initializer "layered-ui-rails.helpers" do
        ActiveSupport.on_load(:action_controller) do
          helper Layered::Ui::ApplicationHelper if defined?(Layered::Ui::ApplicationHelper)
        end
      end

      initializer "layered-ui-rails.view_paths" do
        ActiveSupport.on_load(:action_controller) do
          prepend_view_path Engine.root.join("app/views")
        end

        ActiveSupport.on_load(:action_mailer) do
          prepend_view_path Engine.root.join("app/views")
        end
      end
    end
  end
end
