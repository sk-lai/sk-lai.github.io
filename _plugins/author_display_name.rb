# Keep BibTeX's structured names intact; use the preferred display order for
# the highlighted self-author on this personal site.
Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  next unless item.output.is_a?(String)

  item.output = item.output.gsub(/(<div class="author">)(.*?)(<\/div>)/m) do
    opening, authors, closing = Regexp.last_match.captures
    authors = authors.gsub(/(<em>\s*)Sing Kwong\s+Lai(?=\s*<)/, '\\1LAI Sing Kwong')
    opening + authors + closing
  end
end
