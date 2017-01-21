class LamepressController < ::ApplicationController
  before_filter :fetch_url

  $layout = Rails.application.config.lamepress["layout"]
  $domain = Rails.application.config.lamepress["domain"]
  $title = Rails.application.config.lamepress["title"]

  if respond_to?(:helper)
    helper LamepressHelper
  end

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
       "/admin"
     end
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false,
                           status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def ckeditor_authenticate
    authorize! action_name, Ckeditor::Asset
  end

  def fetch_url
    @url = CGI::unescape(request.path.strip.gsub(/[\']|[\`]|[\"]/,""))
  end

  def fetch_issue
    @issue = if params[:number].present?
      Issue.published_only.find_by_number!(params[:number])
    else
      Setting.current_issue
    end
  end

end

