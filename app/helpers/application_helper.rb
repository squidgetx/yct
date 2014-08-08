module ApplicationHelper
  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def markdown md_string
    raw Kramdown::Document.new(md_string).to_html
  end

  def icon fastring
    "<i class='#{fastring}'></i>".html_safe
  end

end
