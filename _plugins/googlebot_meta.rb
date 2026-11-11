require 'cgi'

Jekyll::Hooks.register :pages, :post_render do |page|
  directive = page.data['googlebot']
  next unless directive.is_a?(String) && page.output_ext == '.html'

  tag = %(<meta name="googlebot" content="#{CGI.escapeHTML(directive)}">)
  page.output = page.output.sub('</head>') { "#{tag}\n</head>" }
end
