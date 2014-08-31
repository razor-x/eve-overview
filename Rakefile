require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'yaml'

build = '_overviews'

task default: :build
task build: [:reset_build_directory, :compile_overviews]

task :reset_build_directory do
  FileUtils.remove_entry_secure build if Dir.exist? build
  FileUtils.mkdir_p build
end

task :compile_overviews do
  Dir['overviews/*.yml'].each do |overview|
    name = File.basename(overview, File.extname(overview))
    compile_overview(
      name, File.join(build, "#{name}.yaml"),
      ActiveSupport::HashWithIndifferentAccess.new(YAML.load_file(overview))
    )
  end
end

task travis: [:build] do
  system 'tar', '-czf', 'overviews.tar.gz', '-C', build, '.'
end

def compile_overview(name, path, overview)
  overview_hash = {}
  overview.each do |k, v|
    opts = YAML.load_file(File.join(k.pluralize, "#{v}.yml"))
    if k.to_sym == :tabs
      overview_hash.merge! format_tabs(opts)
    else
      overview_hash.merge! opts
    end
  end

  presets = []
  Dir['presets/*.yml'].each do |preset|
    presets << format_preset(load_preset(preset))
  end
  overview_hash.merge! 'presets' => presets

  File.open(path, 'w') { |f| f.write overview_hash.to_yaml }
end

def format_tabs(tabs)
  tab_array = []
  tabs.each_with_index do |v, i|
    v = ActiveSupport::HashWithIndifferentAccess.new v
    tab = [i, [
      ['name', format_tab_name(v)],
      ['overview', format_preset_name(load_preset_by_name(v[:overview]))],
      ['bracket', format_preset_name(load_preset_by_name(v[:bracket]))]
    ]]
    tab_array << tab
  end

  {'tabSetup' => tab_array}
end

def load_preset_by_name(preset)
  ActiveSupport::HashWithIndifferentAccess.new(
    YAML.load_file File.join('presets', "#{preset}.yml")
  )
end

def load_preset(preset)
  ActiveSupport::HashWithIndifferentAccess.new(
    YAML.load_file preset
  )
end

def format_preset(preset)
  [format_preset_name(preset), [
    ['filteredStates', merge_states(preset[:states])],
    ['groups', merge_groups(preset[:groups])]
  ]]
end

def format_preset_name(preset)
  "#{preset[:symbol]}" + ' -- ' * preset[:level] + "#{preset[:name]}"
end

def format_tab_name(tab)
  "<color=0x#{tab[:color]}>   #{tab[:name]}   </color>"
end

def merge_states(names)
  array = []
  names.each do |name|
    array << YAML.load_file(File.join('states', "#{name}.yml"))
  end
  array.flatten.uniq
end

def merge_groups(names)
  hash = ActiveSupport::HashWithIndifferentAccess.new include: [], types: []
  names.each do |name|
    sub_hash = ActiveSupport::HashWithIndifferentAccess.new YAML.load_file(File.join('groups', "#{name}.yml"))
    %i(types include).each do |k|
      hash[k].concat sub_hash[k] unless sub_hash[k].nil?
    end
  end

  reduce_group(hash).uniq.sort
end

def reduce_group(group)
  types = []
  types << group[:types] unless group[:types].nil?
  types << group[:include].map do |v|
    reduce_group ActiveSupport::HashWithIndifferentAccess.new(
      YAML.load_file(File.join('groups', "#{v}.yml"))
    )
  end unless group[:include].nil?
  types.flatten.uniq
end
