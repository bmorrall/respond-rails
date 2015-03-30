module RespondHelper

  def respond_include_tags
    tags = [javascript_include_tag(:respond)]

    unless ActionController::Base.asset_host.nil?
      tags << tag('link', {href: asset_path('respond-proxy.html'), id: 'respond-proxy', rel: 'respond-proxy'})
      tags << tag('link', {href: image_path('respond.proxy.gif', host: local_asset_host), id: 'respond-redirect', rel: 'respond-redirect'})
      tags << javascript_include_tag(javascript_path('respond.proxy.js', host: local_asset_host))
    end

    tags.join("\n").html_safe
  end

  protected

  def local_asset_host
    "//#{request.host_with_port}"
  end
end
