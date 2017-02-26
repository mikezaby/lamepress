module PaginatorHelper
  def paginate objects, options = {}
    if params[:controller].starts_with?('admin/')
      options[:theme] = 'twitter-bootstrap-3'
    end

    super( objects, options )
  end
end
