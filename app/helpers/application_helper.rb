module ApplicationHelper
  def auth_token
    html = '<input type="hidden"'
    html += 'name="authenticity_token"'
    html += 'value="<%= form_authenticity_token %>">'
    html.html_safe
  end

  def ugly_lyrics(lyrics)
    processed_lyrics = ""
    lyrics.lines.each do |line|
      processed_lyrics << "&#9835; #{h(line)}"
    end
    "<pre class='lyrics'>#{processed_lyrics}</pre>".html_safe   
  end
end
