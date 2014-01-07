# Overrides the gist markup added by Jekyll's gist Liquid tag
# to support loading GitHub Gists asynchronously using gist-async.coffee from
# https://gist.github.com/razor-x/8288761
module Jekyll
  class GistTag
    def gist_script_tag(gist_id, filename = nil)
      file_data_attr = filename.empty? ? '' : %Q{ data-gist-file="#{filename}"}

      # Append additional markup to this string that will be replaced on gist load
      inner = ''

      %Q{<div class="gist" data-gist="#{gist_id}"#{file_data_attr}>#{inner}</div>}
    end
  end
end
