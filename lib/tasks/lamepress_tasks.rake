namespace :lamepress do
  desc "Generate config file for lamepress"
  task :config do
    lamepress = File.new("#{Rails.root}/config/lamepress.yml", "w")
    lamepress.write("domain: \"http://www.mydomain.com\"\ntitle: \"lamepress\"\nlayout: \"demo\"")
    lamepress.close
  end
end
