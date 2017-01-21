module LamepressHelper

  include ActionView::Helpers::SanitizeHelper

  def javascript(*files)
    content_for(:scripts) { javascript_include_tag(*files) }
  end

  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end

  def keywords(string)
    raw %(<meta name="keywords" content="#{string}" />)
  end

  def cannonical_link(string)
    raw %(<link rel="canonical" href="#{string}"/>)
  end

  def description(string)
    raw %(<meta name="description" content="#{string}" />)
  end

  def head_title(string)
    raw "\n<title>#{string}</title>"
  end

  def block(name)
    partials = ""
    Block.includes(:navigators).place(name).each do |block|
      begin
        partials << (render partial: "blocks/#{block.partial}",
                            locals: { block: block })
      rescue Exception => e
        if Rails.env.development?
          partials << e.message
        else
          partials << "missing"
        end
      end
    end
    raw partials
  end

  def article_canonical_path(article, issue = nil)
    if article.issue_id.nil?
      not_issued_article_path(article.category_permalink, article.id,
                              article.permalink)
    else
      issued_article_path(issue.number,article.category_permalink,
                          article.id, article.permalink)
    end
  end

  def article_canonical_url(article, issue = nil)
    if article.issue_id.nil?
      not_issued_article_url(article.category_permalink, article.id,
                             article.permalink)
    else
      issued_article_url(issue.number,article.category_permalink,
                         article.id, article.permalink)
    end
  end

  def cat_link(article)
    if article.issue_id.nil?
      not_issued_category_url(article.category.permalink)
    else
      issued_category_url(@issue.number, article.category.permalink)
    end
  end
end
