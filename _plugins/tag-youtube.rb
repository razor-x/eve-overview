#
# YouTube Embed Plugin for Foundation
#
# See http://foundation.zurb.com/docs/components/flex-video.html
#
# You will need some SASS like
#
# div.video.youtube
#   +flex-video-container
#
# Usage:
#
# {% youtube oHg5SJYRHA0 %}
#
# or
#
# {% youtube oHg5SJYRHA0 560 315 %}
#
# Based on the Jekyll YouTube Embed Plugin by Joel Verhagen
# https://gist.github.com/joelverhagen/1805814
#
class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize tagName, markup, tokens
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
        @width = 560
        @height = 315
      else
        @width = $2.to_i
        @height = $3.to_i
      end
    else
      raise %Q{No YouTube ID provided in the "youtube" tag}
    end
  end

  def render context
    content = String.new
    content << '<div class="video youtube">'
    content << %Q{<iframe width="#{@width}" height="#{@height}" src="//www.youtube.com/embed/#{@id}" frameborder="0" allowfullscreen></iframe>}
    content << '</div>'
  end

  Liquid::Template.register_tag "youtube", self
end
