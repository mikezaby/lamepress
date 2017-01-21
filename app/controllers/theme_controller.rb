class ThemeController < LamepressController
  layout $layout
  ActionController::Base.prepend_view_path("app/themes/#{$layout}")
end
