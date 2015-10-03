module Lamepress
  class Engine < ::Rails::Engine
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    initializer "lamepress.assets.precompile" do |app|
      app.config.assets.precompile += %w(admin/all.css admin/all.js)
    end

    config.to_prepare do
      require_dependency 'string'
    end
  end
end
