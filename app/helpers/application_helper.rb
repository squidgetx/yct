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

  def tooltip_icon fastring, tooltip_text
    # take a string for font awesome icon classes
    # and returns html for that string with a tooltip text
    link_to "<i class='#{fastring}'></i>".html_safe, "#", title: "#{tooltip_text}"
  end

  def icon fastring
    "<i class='#{fastring}'></i>".html_safe
  end


end
