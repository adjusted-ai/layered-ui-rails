module Layered
  module Ui
    class Engine < ::Rails::Engine
      initializer "layered-ui.importmap", before: "importmap" do |app|
        app.config.importmap.paths << Engine.root.join("config/importmap.rb")
      end

      initializer "layered-ui.assets" do |app|
        app.config.assets.paths << Engine.root.join("app/assets/images")
        app.config.assets.paths << Engine.root.join("app/javascript")
      end
    end
  end
end
