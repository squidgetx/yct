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

  def icon fastring, i_label=""
    i_string = "<i class='#{fastring}'></i>"
    label_string = "<span class='menu-label'>#{i_label}</span>"
    i_string += label_string unless i_label.blank?
    i_string.html_safe
  end

  def truncate string, length
    if string.length <= length
      return string
    else
      return string[0..length] + "..."
    end

  end

end
